set exrc
set relativenumber
set nu
set nohlsearch
set mouse=a
set hidden
set splitright
set splitbelow
set noerrorbells
set nowrap
set formatoptions-=t
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=2
set noshowmode
set completeopt=menu,menuone,noselect
set signcolumn=yes
set number
set updatetime=50
set encoding=UTF-8
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line
set wildignore+=*/node_modules/**
filetype plugin indent on
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set ttyfast
set lazyredraw


call plug#begin('~/.vim/plugged')
" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/trouble.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'creativenull/diagnosticls-configs-nvim'

" Gruvbox
Plug 'morhetz/gruvbox'

" Dashboard
Plug 'glepnir/dashboard-nvim'

" tpope
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

" File management
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Custom motions
Plug 'michaeljsmith/vim-indent-object' " gcii gcaI
Plug 'kana/vim-textobj-user'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'David-Kunz/cmp-npm'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'MaxMEllon/vim-jsx-pretty' " fix indentation in jsx until treesitter can
Plug 'jxnblk/vim-mdx-js'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'editorconfig/editorconfig-vim'
 Plug 'APZelos/blamer.nvim'
 Plug 'lewis6991/gitsigns.nvim'
 Plug 'karb94/neoscroll.nvim'
 Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex'] }
 Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
 Plug 'machakann/vim-highlightedyank'
 " Plug 'folke/which-key.nvim'
 Plug 'wesQ3/vim-windowswap' " <leader>ww
 Plug 'justinmk/vim-sneak'
 " Plug 'tweekmonster/startuptime.vim'
 Plug 'dstein64/vim-startuptime'
 Plug 'akinsho/nvim-bufferline.lua'
 Plug 'windwp/nvim-autopairs'
 Plug 'miyakogi/conoline.vim'
 " Plug 'github/copilot.vim'
 Plug 'yamatsum/nvim-cursorline'
 Plug 'mattn/emmet-vim'

 Plug 'folke/zen-mode.nvim'
 Plug 'junegunn/limelight.vim'
 Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'stevearc/dressing.nvim'

 Plug 'vim-pandoc/vim-pandoc'
 Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()
" Gruvbox settings
let mapleader = " "
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
" $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)

if (empty($TMUX))
	if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
call wilder#setup({'modes': [':', '/', '?']})

" nvim-telescope/telescope.nvim {{{
lua << EOF
require('telescope').setup {
	defaults = {
		file_ignore_patterns = { "yarn.lock" }
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case"
		},
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			-- theme = "dropdown",
			-- previewer = false,
			mappings = {
				i = {
					["<M-d>"] = "delete_buffer",
				}
			}
		}
	}
}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
EOF
nnoremap <leader>ps :lua require('telescope.builtin').grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>fs <cmd>lua require 'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <Leader>fc :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>cb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fr :lua require'telescope.builtin'.resume{}<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>
nnoremap <leader>fgd :lua require'telescope.builtin'.live_grep{ search_dirs = { 'slices/admin' } }
nnoremap <leader>cheat :Cheatsheet<cr>

"}}}

" kyazdani42/nvim-tree.lua {{{
lua << EOF
require("nvim-tree").setup({
	ignore_ft_on_setup  = { 'startify', 'dashboard' },
	filters = {
		custom = { '.git', 'node_modules', '.cache' }
	},
	git = {
		ignore = true,
	},
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
	renderer = {
		indent_markers = {
			enable = true
		},
		highlight_git = true,
		highlight_opened_files = "icon",
		group_empty = true,
	}
})
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" }}}

" tpope/vim-commentary {{{
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
"}}}

" neovim/nvim-lspconfig {{{
" npm i -g typescript typescript-language-server
lua << EOF
local util = require "lspconfig/util"
require 'lspconfig'.tsserver.setup{
	on_attach = function(client)
        	client.server_capabilities.documentFormattingProvider = false
	end,
	root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
	--[=====[ 
	handlers = {
		["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
              		local ignore_codes = { 80001, 7016 };
	              		if params.diagnostics ~= nil then
			        	local idx = 1
					while idx <= #params.diagnostics do
						if vim.tbl_contains(ignore_codes, params.diagnostics[idx].code) then
							table.remove(params.diagnostics, idx)
						else
							idx = idx + 1
						end
					end
				end
				vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
			end,
		}
	--]=====]
}
EOF

nnoremap <leader>tn :set invrelativenumber<cr>
highlight Cursor guifg=#f00 guibg=#657b83
highlight Comment cterm=italic gui=italic

set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=#181818

let g:sneak#label = 1


lua << EOF
vim.api.nvim_exec([[let $KITTY_WINDOW_ID=0]], true)
require("bufferline").setup{
	highlights = {
		fill = {
			bg = "#282828"
		},
		separator_selected = {
			fg = "#282828"
		},
		separator_visible = {
			fg = "#282828"
		},
		separator = {
			fg = "#282828"
		}
	},
	options = {
		modified_icon = "●",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 25,
		max_prefix_length = 25,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		show_close_icon = false,
		separator_style = "slant",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")"
		end,
		offsets = {
			{
					filetype = "coc-explorer",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center"
			}
		}
	}
}
EOF
nnoremap <silent> gb :BufferLinePick<CR>
" }}}

lua << EOF
local function on_attach(client)
  print('Attached to ' .. client.name)
end

local dlsconfig = require 'diagnosticls-configs'
dlsconfig.init {
	default_config = false,
	format = true,
	on_attach = on_attach,
}

local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'

prettier.requiredFiles = {
	'.prettierrc',
	'.prettierrc.json',
	'.prettierrc.toml',
	'.prettierrc.yml',
	'.prettierrc.yaml',
	'.prettierrc.json5',
	'.prettierrc.js',
	'.prettierrc.cjs',
	'prettier.config.js',
	'prettier.config.cjs',
}
dlsconfig.setup {
	['javascript'] = {
		linter = eslint,
		formatter = { prettier }
	},
	['javascriptreact'] = {
	linter = { eslint },
	formatter = { prettier }
	},
	['css'] = {
		formatter = prettier
	},
	['html'] = {
		formatter = prettier
	},
}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gca   <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>fo <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
require 'trouble'.setup {}
EOF

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

lua << EOF
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
	server:setup(opts)
end)
EOF

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>, :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

lua <<EOF
  -- Setup nvim-cmp.
	local cmp = require'cmp'

	cmp.setup({
		auto_select = false,
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		mapping = {
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			--['<C-Space>'] = cmp.mapping.complete(),
			['<C-x>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			--['<CR>'] = cmp.mapping.confirm({ select = false }),
			['<C-y>'] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,        
				select = true
			}),
		},
		sources = {
			{ name = 'nvim_lsp' },
			-- For vsnip user.
			-- { name = 'vsnip' },
			-- For luasnip user.
			{ name = 'path' },
			-- For ultisnips user.
			-- { name = 'ultisnips' },
			{ name = 'luasnip' },
			{ name = 'buffer', keywork_length = 5 },
			{ name = 'npm', keyword_length = 4 },
		},
		formatting = {
			-- format = require('lspkind').cmp_format {
			--   with_text = true,
			--   menu = {
			--     buffer = "[buf]",
			--     nvim_lsp = "[LSP]",
			--     path = "[path]",
			--     luasnip = "[snip]"
			--   }
			-- }
		},
		experimental = {
			native_menu = false,
			ghost_text = true
		}
	})
EOF
																														      
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css', 'json' },
	-- ensure_installed = "all", -- or maintained
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},
	indent = {
		enable = false
	},
	context_commentstring = {
		enable = true
	}
}
EOF

lua << EOF
require('plenary.reload').reload_module('lualine', true)
require('lualine').setup({
	options = {
		theme = 'dracula',
	        disabled_types = { 'NvimTree' }
	},
	sections = {
		lualine_x = {},
		-- lualine_y = {},
		-- lualine_z = {},
	}
})
EOF

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

nnoremap <leader>vw :VimwikiIndex<CR>
nnoremap <leader>tl :VimwikiToggleListItem<cr>

let g:dashboard_default_executive ='telescope'
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>

" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>ct :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fg :DashboardFindWord<CR>
nnoremap <silent> <Leader>fm :DashboardJumpMark<CR>
nnoremap <silent> <Leader>nf :DashboardNewFile<CR>

let g:dashboard_custom_shortcut={
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC f h',
			\ 'find_file'          : 'SPC f f',
			\ 'new_file'           : 'SPC n f',
			\ 'change_colorscheme' : 'SPC c t',
			\ 'find_word'          : 'SPC f g',
			\ 'book_marks'         : 'SPC f m',
			\ }

let s:header = [
	    \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ '                 [ @elijahmanor ]                 ',
    \ ]
let s:footer = []
let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer

