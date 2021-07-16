local function enable_options(options)
    for _, option in ipairs(options) do
        -- TODO fix this
        -- vim.b[option] = true
        -- vim.o[option] = true
        vim.cmd('set '..option)
    end
end

local function set_options(options)
    for _, option in ipairs(options) do
        -- TODO fix this
        -- vim.b[option[1]] = option[2]
        -- vim.o[option[1]] = option[2]
        vim.cmd('set '..option[1]..'='..option[2])
    end
end

enable_options({
    -- 'spell',
    'expandtab',
    'termguicolors',
    'wildmenu', -- tabcomplete
    'list', -- show tabs and blankspace
    'nu', 'rnu', -- line numbers
    'splitright',
    'splitbelow',
    'autowrite', -- autowrite on :make
    'nowrapscan',
    'hidden',
    'nowrap',
    'title',
    'splitbelow',
    'splitright',
    'smartindent',
    'cursorline',
    'noshowmode',
    'nobackup',
    'nowritebackup',
})

vim.bo.expandtab = true -- Converts tabs to spaces
set_options({
    {'scrolloff', 1}, {'sidescrolloff', 5}, -- min lines around cursor
    {'complete', '.,w,b,u,t,i,kspell'}, -- completion
    {'wildmode', 'longest:full,full'}, -- tabcomplete
    {'tabstop', 8}, {'shiftwidth', 4}, {'softtabstop', 4}, -- default indentation
    {'grepprg', [[rg\ --vimgrep\ --smart-case\ --follow]]}, -- use ripgrep as grep program
    {'switchbuf', 'useopen,usetab,newtab'}, -- Specify the behavior when switching between buffers
    {'stal', 2},
    {'timeoutlen', 500},
    {'updatetime', 300},
    {'pumheight', 10},
    {'fileencoding', 'utf-8'},
    {'cmdheight', 2},
    {'mouse', 'a'},
    {'conceallevel', 0},
    {'signcolumn', 'yes'},
    {'inccommand', 'split'},
    {'ts', 4},
    {'sw', 4},
    {'clipboard', 'unnamedplus'}, -- Copy paste between vim and everything elsewhere
})
TERMINAL = vim.fn.expand('$TERMINAL')

vim.cmd('filetype plugin on')
vim.cmd('syntax enable')
-- netrw configs
vim.cmd('let netrw_liststyle=3')
vim.cmd('let g:netrw_banner = 0')
vim.cmd('let g:netrw_browse_split = 3')
vim.cmd('let g:netrw_winsize = 25')


vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.cmd('syntax on') -- syntax highlighting
vim.cmd('set formatoptions-=cro') -- Don't insert comments
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true

vim.cmd[[colorscheme neon]]
