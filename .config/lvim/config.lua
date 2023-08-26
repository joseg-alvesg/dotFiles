-- general
vim.opt.shell = "/bin/bash"
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = "80"
lvim.log.level = "warn"
-- lvim.format_on_save = true
lvim.builtin.cmp.confirm_opts.select = true
lvim.leader = "space"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.width = 50
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.keys.normal_mode["<leader>lg"] = ":!eslint_d --fix %<CR>, { silent = true }"
lvim.keys.normal_mode["<leader>bk"] = ":BufferKill<CR>"
-- exec python files
lvim.keys.normal_mode["<leader>lp"] = ":exec '!python3' shellescape(@%, 1)<CR>"

lvim.transparent_window = true
lvim.colorscheme = "tokyonight"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}


-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", extra_args = { "--line-length", '78' }, filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "javascript", "javascriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  },
  { command = "flake8",
    filetypes = { "python" } }
}

-- Additional Plugins
lvim.plugins = {
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact" },
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end
  },
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  { "wakatime/vim-wakatime"},
  { "justinmk/vim-sneak" },
  { "github/copilot.vim" },
  { "tpope/vim-surround" },
  { "terryma/vim-multiple-cursors" },
  -- theme default
  { "folke/tokyonight.nvim" },
  -- for python
  {
    "AckslD/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
  }
}

-- Setup to html works on jsx, tsx files
require('luasnip').filetype_extend("javascriptreact", { "html" })
require('luasnip').filetype_extend("typescriptreact", { "html" })

-- Setup copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  cmp.mapping.abort()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

require("swenv").setup({ get_venvs = function(venvs_path)
    return require('swenv.api').get_venvs(venvs_path)
  end,
  -- Path passed to `get_venvs`.
  venvs_path = vim.fn.expand('~/.virtualenvs'),
  -- Something to do after setting an environment, for example call vim.cmd.LspRestart
  post_set_venv = function()
    vim.cmd("LspRestart")
  end,
})


-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  -- c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
  c = { "<cmd>lua require('swenv.api').pick_venv({venv_dir = '~/.virtualenvs/'})<cr>", "Choose Env" },
}
lvim.builtin.which_key.mappings["o"] = {
name = "others",
  b = { "<cmd>norm yssb<cr>", "Entire line with ()" },
  B = { "<cm>'<,'>norm yssb<cr>", "Entire line with ()" },
  k = { "<cmd>norm yss}<cr>", "Entire line with {}" },
  K = { "<cm>'<,'>norm yss}<cr>", "Entire line with {}" },
  c = { "<cmd>norm yss]<cr>", "Entire line with []" },
  C = { "<cm>'<,'>norm yss]<cr>", "Entire line with []" },
  w = { "<cmd>norm yss\"<cr>", "Entire line with \"\"" },
  W = { "<cm>'<,'>norm yss\"<cr>", "Entire line with \"\"" },
  y = { "<cmd>norm ysiw\"<cr>", "one word with \" " },
}
