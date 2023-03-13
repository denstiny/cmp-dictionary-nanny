-- @author      : aero (2254228017@qq.com)
-- @file        : source
-- @created     : 星期五 3月 10, 2023 19:47:14 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local utils = require("cmp-dictionary-nanny.utils")
local conf = require("cmp-dictionary-nanny.config")
local notify = require("cmp-dictionary-nanny.notify")
local cmp = require("cmp")
local fn = vim.fn

local source = {
	job = 0,
	pending = {},
}

function source:is_available()
	return true
end

function source:get_debug_name()
	return "Dictionary nanny"
end

function source.complete(self, ctx, callback)
	if conf:get("ignored_file_types")[vim.bo.filetype] then
		callback()
		return
	end
	self.pending[ctx.context.id] = { ctx = ctx, callback = callback, job = self.job }
	self:_do_complete(ctx)
end

--function swap_field(input)
--	local input_len = string.len(input)
--	print(input_len)
--	local char = input:sub(input_len, input_len)
--	if char > "~" then
--		return "translation"
--	end
--	if char <= "~" then
--		return "word"
--	end
--end

function source._do_complete(self, ctx)
	if self.job == 0 then
		return
	end
	local max_num_results = conf:get("max_num_results")
	local table_name = conf:get("table_name")
	local input = string.sub(ctx.context.cursor_before_line, ctx.offset)
	local req = {
		correlation_id = ctx.context.id,
		table_name = table_name,
		filter = input,
		--field = swap_field(input),
		max_num_results = max_num_results,
	}
	self.pending[ctx.context.id].field = req.field
	pcall(fn.chansend, self.job, fn.json_encode(req) .. "\n")
end

local last_instance = nil

source.new = function()
	last_instance = setmetatable({}, { __index = source })
	last_instance:on_exit(0)
	return last_instance
end

local function json_decode(data)
	local status, result = pcall(vim.fn.json_decode, data)
	if status then
		return result
	else
		return nil, result
	end
end

source.on_exit = function(self, job, code)
	if job ~= self.job then
		return
	end

	if code == 143 then
		-- nvim is exiting. do not restart
		return
	end
	self.pending = {}
	local bin = utils.binary()
	self.job = fn.jobstart({ bin, conf:get("database_path") }, {
		on_stderr = function(_, data, _)
			notify.Notify(data)
		end,
		on_exit = function(j, c, _)
			self:on_exit(j, c)
		end,
		on_stdout = function(_, data, _)
			self:on_stdout(data)
		end,
	})
end

source.on_stdout = function(self, data)
	for _, jd in ipairs(data) do
		if jd ~= nil and jd ~= "" and jd ~= "null" then
			local response = (json_decode(jd) or {})
			local id = response.correlation_id
			if response == nil then
				notify.Notify("Dictionary-nanny: json decode error: ")
			elseif id == nil then
				notify.Notify("id is nill")
			elseif self.pending[id] == nil then
				--vim.notify(vim.inspect(self.pending[id]))
				notify.Notify("unknown message: " .. jd)
			elseif self.pending[id].job ~= self.job then
				notify.Notify("pending[id].job ~= self.job")
			else
				local callback = self.pending[id].callback
				self.pending[id] = nil
				local items = {}
				local results = response.results
				if results ~= nil then
					for _, result in ipairs(results) do
						local word = result.word
						local definition = result.definition
						local translation = result.translation
						local phonetic = result.phonetic
						local item = {
							label = word,
							insertText = word,
							data = result,
							kind = cmp.lsp.CompletionItemKind.Text,
							priority = conf:get("priority"),
							documentation = {
								kind = cmp.lsp.MarkupKind.Markdown,
								value = translation .. "\n\n" .. phonetic .. "\n\n" .. definition,
							},
						}
						--if self.pending[id] == "word" then
						--	item.word = word
						--	item.documentation.value = translation .. "\n\n" .. phonetic .. "\n\n" .. definition
						--	vim.notify("word")
						--else
						--	item.word = translation
						--	item.documentation.value = word .. "\n\n" .. phonetic .. "\n\n" .. definition
						--	vim.notify("translation")
						--end
						table.insert(items, item)
					end
				end
				callback({
					items = items,
					isIncomplete = conf:get("run_on_every_keystroke"),
				})
			end
		end
	end
end

return source
