local M = {}
local fn = vim.fn
local Notify = require("cmp-dictionary-nanny.notify")
local utils = require("cmp-dictionary-nanny.utils")

local function existsfile(path)
	return fn.empty(fn.glob(path)) == 0
end

M.unzip = function(file_path, out_dir)
	local cmd = string.format("unzip %s -d %s", file_path, out_dir)
	local status = os.execute(cmd)
	os.remove(file_path)
	if status == 0 then
		vim.notify("DataBases download successful")
	else
		Notify.Notify("Unzip the files failed")
	end
end

M.download = function(path, url)
	local out_path = "/tmp/dict.zip"
	if not existsfile(path) then
		vim.notify("No download databases files,Are starting to download")
		vim.fn.jobstart({
			"wget",
			url,
			"-O",
			out_path,
		}, {
			on_exit = function(_, _, code)
				if code == 0 and existsfile(out_path) then
					if fn.executable("unzip") == 0 then
						Notify.Notify("unzip not found,please install unzip")
					else
						M.unzip(out_path, utils.parent_dir(path))
					end
				else
					Notify.Notify("Installation failed")
				end
			end,
			on_stdout = function(_, data, _)
				vim.notify(data)
			end,
			on_stderr = function(_, data, _)
				print(vim.inspect(data))
			end,
		})
	else
		if fn.executable("unzip") == 0 then
			Notify.Notify("unzip not found,please install unzip")
		elseif not existsfile(out_path) then
			M.unzip(out_path, utils.parent_dir(path))
		end
	end
end
return M
