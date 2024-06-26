-- set cursor to alacritty default on exit
vim.cmd([[
  au VimLeave * set guicursor=a:ver10-blinkwait800
]])

local uv = vim.loop

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		if vim.env.TMUX_PLUGIN_MANAGER_PATH then
			uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
		end
	end,
})
