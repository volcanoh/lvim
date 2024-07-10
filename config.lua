-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
vim.opt_local.conceallevel = 2
lvim.transparent_window = false

lvim.plugins = {
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = "InsertEnter",
  --   -- lazy = false,
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     require("custom.config.copilot").config()
  --   end,
  -- },

  {
    'luozhiya/fittencode.nvim',
    config = function()
      -- require('fittencode').setup()
      require("custom.config.fittencode").config()
    end,
  },

  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({
  --     })
  --   end,
  --   event = 'BufEnter'
  -- },

  -- You must install glow globally
  -- https://github.com/charmbracelet/glow
  -- yay -S glow
  -- {
  --   "npxbr/glow.nvim",
  --   ft = { "markdown" }
  --   -- build = "yay -S glow"
  -- },
  { "ellisonleao/glow.nvim",  config = true, cmd = "Glow" },
  "KeitaNakamura/tex-conceal.vim",
  "kdheepak/cmp-latex-symbols",
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_quickfix_mode = 0
      vim.g.maplocalleader = ","
      vim.g.vimtex_callback_progpath =  vim.fn.expand('$HOME/.local/bin/lvim')
    end,
    -- ft = 'tex'
  },

  -- -- install without yarn or npm
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },

  -- install with yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = require("custom.config.neoscroll").config,
  },

  { 'tanvirtin/monokai.nvim', },
  {
    "mrjones2014/nvim-ts-rainbow",
  },

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("custom.config.zen").config()
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "fd" },         -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
        keys = "<Esc>",             -- keys used for escaping, if it is a function will use the result everytime
      })
    end,
  },
  { 'ojroques/nvim-osc52' },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        timeout = 1000,
      })
    end
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "nvim-cmp",
      "telescope.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("custom.config.obsidian").config()
    end,

  },
  -- {
  --   'preservim/vim-markdown'
  -- },
  -- {
  -- 'plasticboy/vim-markdown',
  -- branch = 'master',
  -- require = { 'godlygeek/tabular' },
  -- },
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("custom.config.telekasten").config()
    end
  },
  {
    'renerocksai/calendar-vim'
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    "zk-org/zk-nvim",
    config = require("custom.config.zk").config,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    config = function()
      require("custom.config.noice").config()
    end,

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "voldikss/vim-translator"
  }
}
require("telescope").load_extension("noice")

lvim.builtin.treesitter.rainbow.enable = false
-- append to the list of enabled languages
table.insert(lvim.builtin.treesitter.ensure_installed, "markdown")
lvim.colorscheme = "monokai"
lvim.builtin.lualine.style = "lvim" -- or "none"
-- vimtex

lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        local color = "#686765" -- change it to your liking

        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = color, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = color, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = color, underline = false, bold = true })
      end,
    }
  },
  -- other autocmds
}

-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
local components = require "lvim.core.lualine.components"

local filename_component = {
  function()
    local file = vim.fn.expand "%:."
    if vim.fn.empty(file) == 1 then
      return ""
    end
    if string.len(file) > 100 then
      file = vim.fn.pathshorten(file)
    end
    return lvim.icons.ui.Pencil .. " " .. file .. " "
  end,
  color = function()
    local colors = require "lvim.core.lualine.colors"
    local buf = vim.api.nvim_get_current_buf()
    -- if buffer is modified
    local mod = vim.api.nvim_buf_get_option(buf, "modified")
    return { fg = not mod and colors.green or colors.red, gui = "bold" }
  end,
  cond = nil,
}

lvim.builtin.lualine.sections.lualine_c = { components.diff, components.python_env, filename_component }

--
-- require('custom/plugins/lualine')
require('custom/plugins/lsp')
require('custom/mappings')
-- vim.cmd('source ~/.config/lvim/lua/custom/plugins/lualine.lua')
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.filesystem_watchers.enable = false


table.insert(lvim.builtin.cmp.sources, { name = "codeium" })
lvim.builtin.cmp.formatting.source_names.codeium = "(Codeium)"

vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 2        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines
-- Enable line breaking
vim.o.linebreak = true
-- Set a specific textwidth (adjust the value to your preference)
-- vim.o.textwidth = 120
vim.opt.wrapmargin = 20

-- use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
