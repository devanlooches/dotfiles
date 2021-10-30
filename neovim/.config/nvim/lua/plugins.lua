local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

vim.o.runtimepath = vim.o.runtimepath..',~/.local/share/nvim/site/pack/packer/start/himalaya/vim'

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

    use { --lsp
            {
                'neovim/nvim-lspconfig',
                config = 'require("lsp.config")'
            },{
                "kabouzeid/nvim-lspinstall"
            },{
                'glepnir/lspsaga.nvim',
                config = 'require("lsp.saga")'
            }
        }

        -- Telescope
        use {"nvim-lua/popup.nvim"}
    use { -- for testing
        'nvim-lua/plenary.nvim',
        config = 'require("plugin_settings.plenary")',
    }
    -- brackets maps
    use 'tpope/vim-unimpaired'

    use { -- telescope
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = 'require("plugin_settings.telescope")',
    }

        -- Debugging
        use {"mfussenegger/nvim-dap", opt = true}

        -- Autocomplete
        use {"hrsh7th/nvim-compe", config = 'require("plugin_settings.compe")'}
        use {"hrsh7th/vim-vsnip"}
        use {"rafamadriz/friendly-snippets"}

        -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = 'require("plugin_settings.treesitter")',
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
        use {"windwp/nvim-ts-autotag", opt = true}

        -- Explorer
    use { -- tree (view files)
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}, -- for file icons
        config = 'require("plugin_settings.tree")',
    }

    use {
        { -- git merge conflicts
            'tpope/vim-fugitive',
            config = 'require("plugin_settings.fugitive")',
            requires = {'tpope/vim-rhubarb'},
        },
        {
            'lewis6991/gitsigns.nvim',
            requires = {'nvim-lua/plenary.nvim'},
            config = 'require("plugin_settings.gitsigns")',
        },
        {
            'f-person/git-blame.nvim',
            config = 'require("plugin_settings.gitblame")',
        },
        {
            'ruifm/gitlinker.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = 'require("plugin_settings.gitlinker")',
        },
    }
    use {'lukas-reineke/indent-blankline.nvim'}
    use {"ChristianChiarulli/dashboard-nvim", opt = true}
    use {"windwp/nvim-autopairs", config = 'require("plugin_settings.autopairs")'}

    use "devanlooches/better-comments-nvim"
    use {"terrortylor/nvim-comment", config = "require('nvim_comment').setup()"}

    use {"kevinhwang91/nvim-bqf", opt = true}

    -- Color
    use "rafamadriz/neon"

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim", config = 'require("plugin_settings.galaxyline")'}
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = 'require("plugin_settings.bufferline")'}

    use {'andweeb/presence.nvim', config = 'require("plugin_settings.presence")'}

    use {'euclio/vim-markdown-composer', run = 'cargo build --release'}

    use {'norcalli/nvim-colorizer.lua', config = "require'colorizer'.setup()"}

    use {'dhruvasagar/vim-table-mode'}

    use {'liuchengxu/vista.vim', config = 'require("plugin_settings.vista")'}
        
    use {'mattn/emmet-vim'}

    use {'pest-parser/pest.vim'}

    use {'soywod/himalaya', rtp = 'vim/himalaya.vim'}
 
    use {
    'AckslD/nvim-whichkey-setup.lua',
        requires = {{
            'liuchengxu/vim-which-key',
            config = 'require("plugin_settings.whichkey")',
        }}
    }
        require_plugin("nvim-dap")
        require_plugin("nvim-ts-autotag")
        require_plugin("dashboard-nvim")
        require_plugin("nvim-bqf")
        require_plugin("nvcode-color-schemes.vim")
    end
)
