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
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" EdenEast/nightfox.nvim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'folke/trouble.nvim'
" Plug 'feline-nvim/feline.nvim'
" Plug 'itchyny/lightline.nvim'
Plug 'nvim-lualine/lualine.nvim'

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

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat --theme=Coldark-Cold --style=numbers --color=always --line-range :500 {}']}, <bang>0)

set termguicolors
lua << EOF
require("catppuccin").setup({
    flavour = "latte",
    transparent_background = false,
    term_colors = true,
    integrations = {
        gitsigns = true,
        barbar = true,
        lsp_trouble = true,
        coc_nvim = true,
--        lightline = true,
    }
})

vim.cmd.colorscheme "catppuccin-latte"

require("colorizer").setup()
require("gitsigns").setup()

require("trouble").setup()

-- apparently this is deprecated? it's commented out anyways. for here.
require("barbar").setup({
    icons = { button = 'x' },
})

require('lualine').setup {
    options = {
        theme = 'catppuccin',
        component_separators = '|',
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            -- { 'mode', separator = { left = '' }, right_padding = 0 },
            { 'mode', separator = { left = '' }, right_padding = 0 },
        },
        lualine_b = { 'filetype', 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            -- { 'location', separator = { right = '' }, left_padding = 0 },
            { 'location', separator = { right = '' }, left_padding = 0 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}

--local ctp_feline = require('catppuccin.groups.integrations.feline')
--
--require("feline").setup({
--    components = ctp_feline.get(),
--})
EOF

let g:lightline = {'colorscheme': 'catppuccin', 'enable': {'tabline': 0}}

" Some coc things! :)
let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer', 'coc-cmake', 'coc-prettier']
