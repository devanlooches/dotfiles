Presence = require("presence"):setup({
	-- This config table shows all available config options with their default values
	auto_update       = false,
	editing_text      = "Editing %s",
	neovim_image_text = "The One True Text Editor",
	main_image        = "neovim",
    log_level = "debug",
	workspace_text = function(git_project_name, buffer)
	local project_name = git_project_name
	-- Not in a git repository, so do some custom parsing
	if not git_project_name then
	-- Parse buffer for your project name
	project_name = Get_project_name(buffer)
    else
        project_name = git_project_name
    end
	if project_name == "" then
	return nil
	end
	if Trim(project_name) == "nvim" then
	project_name = "Neovim Config Files"
	end
	if Trim(project_name) == "alacritty" then
	project_name = "Alacritty Config Files"
	end
	-- You can hide any directories you want by just adding them and making them return nil just like the one below
	if Trim(project_name) == "accounts" then
        return nil
	end
	if Trim(project_name) == ".gnupg" then
        return nil
	end
	return string.format("Working on %s", tostring(project_name))
	end,
	})
	-- Function to trim directory names (remove spaces)
	function Trim(str)
	return str:gsub("%s+", "")
	end
	-- custom function to parse the path and get the workspace name
	function Get_project_name(buffer)
	-- get file extension
	local file_extension = buffer:match("^.+%.(.+)$")
	-- Remove the file name from the end of the file
	local path = buffer:match( "^(.+/.+)/.*$")
	-- Remove the whole beginning of the path
	local dir_name = path:gsub("^/.*/", "")
	
	-- If its part of a cargo workspace, the file you are most likely editing is in src/main.rs
	-- That means you need to go up an extra directory to get the workspace name as in the if statement below
	if dir_name == "src" and file_extension == "rs" then
	local path = string.match(path, "^(.+/.+)/.*$")
	dir_name = string.gsub(path, "^/.*/","")
	end
	return dir_name
end
print('Discord presence is turned off by default. You can update it by pressing <leader>du')
vim.api.nvim_set_keymap('n','<leader>du' ,':lua package.loaded.presence:update()<CR>', {})
