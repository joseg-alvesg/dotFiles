-- set relative number
vim.opt.relativenumber = true

lvim.keys.normal_mode["<leader>lg"] = ":!eslint_d --fix %<CR>, { silent = true }"
lvim.keys.normal_mode["<leader>bk"] = ":BufferKill<CR>"
-- exec python files
lvim.keys.normal_mode["<leader>lp"] = ":exec '!python3' shellescape(@%, 1)<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"

lvim.transparent_window = true
lvim.colorscheme = "shades_of_purple"
lvim.airline_theme = "shades_of_purple"

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
  "html",
  "php",
}

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black",  extra_args = { "--line-length", '78' }, filetypes = { "python" } },
  { command = "isort",  filetypes = { "python" } },
  -- HTML Template Linter and Formatter. Django - Jinja - Nunjucks - Handlebars - GoLang.
  { command = "djlint", extra_args = { "--reformat" },          filetypes = { "htmldjango" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "javascript", "javascriptreact" },
  },
  { command = "phpcsfixer", filetypes = { "php" } },
}


-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  },
  {
    command = "flake8",
    filetypes = { "python" }
  },
  -- { command = "phpcs", filetypes = { "php" } },
}

-- -- set LSP
local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("intelephense", {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    require("lsp").common_on_attach(client, bufnr)
  end,
  settings = {
    intelephense = {
      files = {
        maxSize = 1000000,
      },
    },
  },
})

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
  { "wakatime/vim-wakatime" },
  { "justinmk/vim-sneak" },
  { "github/copilot.vim" },
  { "tpope/vim-surround" },
  { "terryma/vim-multiple-cursors" },
  -- theme default
  { "folke/tokyonight.nvim" },
  { "Rigellute/shades-of-purple.vim" },
  { "ful1e5/onedark.nvim" },
  -- java
  { "mfussenegger/nvim-jdtls" },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  },
  -- for python
  {
    "AckslD/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
  },
  -- for ncm2
  -- {
  --   "ncm2/ncm2-vim-lsp",
  --   event = "InsertEnter",
  --   ft = { "php" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       autotag = {
  --         enable = true,
  --       },
  --     })
  --   end,
  --   "roxma/nvim-yarp",
  --   "ncm2/ncm2-bufword",
  --   "ncm2/ncm2-path",
  -- },
  {
    "aca/emmet-ls",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false
          require("lsp").common_on_attach(client, bufnr)
        end,
        filetypes = {
          "html",
          "css",
          "php",
        },
      })
    end,
  },
}

--java
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- Setup markdown preview
vim.g.mkdp_browser = 'electron'
vim.g.mkdp_port = '8959'
vim.g.mkdp_theme = 'dark'

-- Setup to html works on jsx, tsx files
require('luasnip').filetype_extend("javascriptreact", { "html" })
require('luasnip').filetype_extend("typescriptreact", { "html" })

-- Setup to html works on php files
require("luasnip").filetype_extend("php", { "html" })

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

local dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { mason_path .. "packages/php-debug-adapter/extension/out/phpDebug.js" },
}
-- dap.configurations.php = {
--   {
--     name = "Listen for Xdebug",
--     type = "php",
--     request = "launch",
--     port = 9003,
--   },
--   {
--     name = "Debug currently open script",
--     type = "php",
--     request = "launch",
--     port = 9003,
--     cwd = "${fileDirname}",
--     program = "${file}",
--     runtimeExecutable = "php",
--   },
-- }

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

require("swenv").setup({
  get_venvs = function(venvs_path)
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
