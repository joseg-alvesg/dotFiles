-- Inicialização do Plugin Manager (vim-plug)
vim.cmd [[
  call plug#begin()
    Plug 'sainnhe/sonokai'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'dense-analysis/ale'
    Plug 'johnstef99/vim-nerdtree-syntax-highlight'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'tpope/vim-commentary'
    Plug 'github/copilot.vim'
  call plug#end()
]]

-- Configurações globais
vim.cmd [[
  syntax on
  set relativenumber
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set smarttab
  set smartindent
  set hidden
  set incsearch
  set ignorecase
  set smartcase
  set scrolloff=8
  set colorcolumn=100
  set signcolumn=yes
  set cmdheight=2
  set updatetime=100
  set encoding=utf-8
  set nobackup
  set nowritebackup
  set splitright
  set splitbelow
  set autoread
  set mouse=a
  filetype on
  filetype plugin on
  filetype indent on
]]

-- Configurações do Tema Sonokai
vim.cmd [[
  if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  let g:sonokai_style = 'andromeda'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 0
  let g:sonokai_diagnostic_line_highlight = 1
  let g:sonokai_current_word = 'bold'
  colorscheme sonokai

  if (has("nvim")) "Transparent background. Only for nvim
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NormalNC guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
  endif

  let g:airline_theme = 'sonokai'
]]

-- Mapeamento de Líder
vim.g.mapleader = "<Space>"

-- Mapeamento de atalhos
vim.cmd [[
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  nnoremap <leader>b :ls<CR>:b<Space>
  nmap <C-a> :NERDTreeToggle<CR>
]]

-- Configurações do AirLine
vim.cmd [[
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
]]

-- Configurações do ALE
vim.cmd [[
  let g:ale_linters = {}
  let g:ale_fixers = {'*': ['trim_whitespace']}
  let g:ale_fix_on_save = 1
]]

-- Configurações do Telescope
vim.cmd [[
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]]

require('mason-config')
-- Configurações do COC
vim.cmd [[
  let g:coc_global_extensions = {'coc-snippets', 'coc-explorer', 'coc-pairs'}
  set encoding=utf-8
  set nobackup
  set nowritebackup
  set updatetime=300
  set signcolumn=yes
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  let g:coc_snippet_next = '<tab>'
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  nnoremap <leader>rn <Plug>(coc-rename)
  nnoremap <leader>fl :CocCommand eslint.executeAutofix<CR>
  nnoremap <leader>fp :Prettier<CR>
]]
