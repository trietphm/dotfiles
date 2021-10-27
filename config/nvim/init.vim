set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

set termguicolors
lua <<EOF
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "go", "ruby" },  -- list of language that will be disabled
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

require("bufferline").setup{
	options = {
		numbers = function(opts)
			return string.format('%s', opts.ordinal)
		end,
		--separator_style = "padded_slant",
		name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
		  --return 
 		  ---- remove extension from markdown files for example
 		  --if buf.name:match('%.md') then
 		  --  return vim.fn.fnamemodify(buf.name, ':t:r')
 		  --end
		  return buf.name
 		end,
	}
	
}

local lsp_status = require('lsp-status')
lsp_status.register_progress()

require('lualine').setup{
	options = {theme = 'palenight'},
	extension = {'nerdtree'},
	sections = {
	    lualine_a = {'mode'},
	    lualine_b = {'branch'},
	    lualine_c = {
		    {
		      'filename',
		      file_status = true, -- displays file status (readonly status, modified status)
		      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
		    }
		  },
	    lualine_x = {'encoding', 'fileformat', 'filetype'},
	    lualine_y  = {'g:coc_status'},
	    lualine_z = { function() return '%l:%c/%L' end },
	  },
	inactive_sections = {
	    lualine_a = {},
	    lualine_b = {},
	    lualine_c = {'filename'},
	    lualine_x = {'location'},
	    lualine_y = {},
	    lualine_z = {}
 	},
}

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

require'colorizer'.setup()

require('gitsigns').setup{
    current_line_blame = true,
    keymaps = {
      -- Default keymap options
      noremap = true,
      ['n <Leader>j'] = { expr = true, "&diff ? '<Leader>j' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
      ['n <Leader>k'] = { expr = true, "&diff ? '<Leader>k' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
    },
    watch_index = {
      interval = 2000,
      follow_files = true
    },
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
}

require'lspconfig'.ansiblels.setup{
  filetypes = { "yml", "yaml" }
}

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

--print('lua in init.vim loaded')
EOF

"au FileType go setlocal foldmethod=expr foldnestmax=3 foldlevelstart=2 foldexpr=nvim_treesitter#foldexpr()

lua <<EOF

--require'nvim-web-devicons'.get_icons()
EOF
