-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/devan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/devan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/devan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/devan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/devan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["better-comments-nvim"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/better-comments-nvim"
  },
  ["dashboard-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { 'require("plugin_settings.galaxyline")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    config = { 'require("plugin_settings.gitblame")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { 'require("plugin_settings.gitlinker")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugin_settings.gitsigns")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require("lsp.saga")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neon = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/neon"
  },
  ["nvim-autopairs"] = {
    config = { 'require("plugin_settings.autopairs")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { 'require("plugin_settings.bufferline")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'colorizer'.setup()" },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "require('nvim_comment').setup()" },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { 'require("plugin_settings.compe")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("lsp.config")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("plugin_settings.tree")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugin_settings.treesitter")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-whichkey-setup.lua"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/nvim-whichkey-setup.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    config = { 'require("plugin_settings.plenary")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    config = { 'require("plugin_settings.presence")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugin_settings.telescope")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-fugitive"] = {
    config = { 'require("plugin_settings.fugitive")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-markdown-composer"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-markdown-composer"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-table-mode"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-which-key"] = {
    config = { 'require("plugin_settings.whichkey")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vista.vim"] = {
    config = { 'require("plugin_settings.vista")' },
    loaded = true,
    path = "/Users/devan/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require'colorizer'.setup()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
require('nvim_comment').setup()
time([[Config for nvim-comment]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require("plugin_settings.compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("lsp.config")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-which-key
time([[Config for vim-which-key]], true)
require("plugin_settings.whichkey")
time([[Config for vim-which-key]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("plugin_settings.tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require("plugin_settings.galaxyline")
time([[Config for galaxyline.nvim]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
require("plugin_settings.gitblame")
time([[Config for git-blame.nvim]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
require("plugin_settings.gitlinker")
time([[Config for gitlinker.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("plugin_settings.gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require("lsp.saga")
time([[Config for lspsaga.nvim]], false)
-- Config for: plenary.nvim
time([[Config for plenary.nvim]], true)
require("plugin_settings.plenary")
time([[Config for plenary.nvim]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
require("plugin_settings.vista")
time([[Config for vista.vim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugin_settings.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
require("plugin_settings.presence")
time([[Config for presence.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("plugin_settings.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugin_settings.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require("plugin_settings.bufferline")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
require("plugin_settings.fugitive")
time([[Config for vim-fugitive]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
