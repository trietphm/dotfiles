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
		separator_style = "padded_slant",
	}
	
}

require('lualine').setup{
	options = {theme = 'palenight'}
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

--print('lua in init.vim loaded')
EOF
"au FileType go setlocal foldmethod=expr foldnestmax=3 foldlevelstart=2 foldexpr=nvim_treesitter#foldexpr()

lua <<EOF

--require'nvim-web-devicons'.get_icons()
EOF
