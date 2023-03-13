local M = {}
local NotifyTitle = "cmp-dictionary-nanny"
M.Notify = function(body_text)
	vim.notify_once(body_text, vim.log.levels.WARN, {
		title = NotifyTitle,
	})
end
return M
