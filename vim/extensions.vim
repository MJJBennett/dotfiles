" Vundle

set nocompatible
filetype off

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/bundle/')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'

Plug 'mattn/emmet-vim'

Plug 'tpope/vim-surround'
" Gotta set up custom binds for this lol (TODO)
" Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tell-k/vim-autopep8'
Plug 'rust-lang/rust.vim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin', 'tag': 'v0.2'}
" EdenEast/nightfox.nvim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'folke/trouble.nvim'
Plug 'feline-nvim/feline.nvim'

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Clang Format Configuration
let g:clang_format#style_options = {
    \ "BreakBeforeBraces" : "Allman",
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "AccessModifierOffset" : -4,
    \ "PointerAlignment" : "Left",
    \ "ColumnLimit" : "99",
    \ "AllowShortCaseLabelsOnASingleLine" : "true",
    \ "AllowShortFunctionsOnASingleLine" : "All",
    \ "AllowShortIfStatementsOnASingleLine" : "true",
    \ "TabWidth" : 4,
    \ "UseTab" : "Never",
    \ "AlignOperands" : "true",
    \ "AlignTrailingComments" : "true",
    \ "AlignConsecutiveAssignments" : "true",
    \ "Standard" : "C++11"}

" Pep8 Format Configuration
let g:autopep8_max_line_length=80
let g:autopep8_disable_show_diff=1

" NetRW Configuration (Technically builtin, but hey)
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_list_hide = '\s*.git'

" JavaScript prettifier
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin

set termguicolors
let g:catppuccin_flavour = "latte"
lua << EOF
require("catppuccin").setup({
    integrations = {
        gitsigns = true,
        barbar = true,
        lsp_trouble = true,
        coc_nvim = true,
    }
})

require("colorizer").setup()
require("gitsigns").setup()

require("trouble").setup()

local clrs = require("catppuccin.palettes").get_palette()
local ctp_feline = require('catppuccin.groups.integrations.feline')
local U = require "catppuccin.utils.colors"
local latte = require("catppuccin.palettes").get_palette "latte"

ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "",
        file = "",
        lsp = {
            server = "",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    sett = {
        text = U.vary_color({ latte = latte.base }, clrs.surface0),
        bkg = U.vary_color({ latte = latte.crust }, clrs.surface0),
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = true -- show if the file has been modified
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})

require("feline").setup({
    components = ctp_feline.get(),
})
EOF

colorscheme catppuccin-latte

" Some coc things! :)
let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer', 'coc-cmake', 'coc-prettier']
