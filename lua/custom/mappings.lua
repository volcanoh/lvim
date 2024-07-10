-- https://www.lunarvim.org/docs/configuration/keybindings
lvim.lsp.buffer_mappings.normal_mode['gr'] = {
  "<cmd>lua require('telescope.builtin').lsp_references({layout_strategy='vertical',layout_config={width=0.618, height=0.618}})<CR>",
  "Goto references" }
lvim.lsp.buffer_mappings.normal_mode['gd'] = {
  -- "<cmd>lua vim.lsp.buf.definition({layout_strategy='vertical',layout_config={width=0.618, height=0.618}})<CR>",
  "<cmd>lua require('telescope.builtin').lsp_definitions({layout_strategy='vertical',layout_config={width=0.618, height=0.618}})<CR>",
  "Gotox definition" }


lvim.builtin.telescope.defaults.dynamic_preview_title = true
lvim.builtin.telescope.theme = "ivy"
lvim.builtin.which_key.mappings['n'] = { '<cmd>NvimTreeFindFile<CR>', "File reveal" }

lvim.keys.normal_mode["<C-n>"] = { '<cmd>NvimTreeToggle<CR>' }
lvim.keys.normal_mode["<TAB>"] = { ":bnext<CR>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<S-TAB>"] = { ":bprevious<CR>", { noremap = true, silent = true } }
-- lvim.keys.normal_mode["<S-l>"] = { ":bnext<CR>", { noremap = true, silent = true } }
-- lvim.keys.normal_mode["<S-h>"] = { ":bprevious<CR>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<S-l>"] = { '<cmd>NvimTreeToggle<CR>' }
lvim.keys.normal_mode["<S-h>"] = { '<cmd>NvimTreeToggle<CR>' }

lvim.keys.insert_mode["<C-l>"] = { '<cmd>lua require("fittencode").accept_all_suggestions()<CR>' }


lvim.builtin.which_key.mappings["f"] = lvim.builtin.which_key.mappings["s"]
lvim.builtin.which_key.mappings["/"] = lvim.builtin.which_key.mappings["s"]["t"]
lvim.builtin.which_key.mappings["fs"] = { '<cmd>update<CR>', "Save" }
lvim.builtin.which_key.mappings["ff"] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files { previewer = true }
  end,
  "Find File",
}

lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>:set nospell<CR>", "Zen Mode" }

lvim.builtin.which_key.mappings["fm"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 10000 }
  end,
  "Format file"
}
lvim.builtin.which_key.vmappings["fm"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 10000 }
  end,
  "Format Selection"
}

lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 10000 }
  end,
  "Format file",
}

-- Nvimtree
lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  local function telescope_find_files(_)
    require("lvim.core.nvimtree").start_telescope "find_files"
  end

  local function telescope_live_grep(_)
    require("lvim.core.nvimtree").start_telescope "live_grep"
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  local useful_keys = {
    ["l"] = { api.node.open.edit, opts "Open" },
    ["o"] = { api.node.open.edit, opts "Open" },
    ["<CR>"] = { api.node.open.edit, opts "Open" },
    ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
    ["C"] = { api.tree.change_root_to_node, opts "CD" },
    ["gtg"] = { telescope_live_grep, opts "Telescope Live Grep" },
    ["gtf"] = { telescope_find_files, opts "Telescope Find File" },
    ["|"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["-"] = { api.node.open.horizontal, opts "Open: Horizontal Split" },
  }

  require("lvim.keymappings").load_mode("n", useful_keys)
end


-- Obsidian
--
lvim.builtin.which_key.mappings['o'] = {
  -- lvim.builtin.which_key.mappings = {
  name = "Obsidian",
  o = { "<cmd>ObsidianOpen<cr>", "to open a note in the Obsidian app" },
  f = { "<cmd>ObsidianFollowLink<cr>", "to follow a note reference under the cursor, optionally opening it in a vertical or horizontal split." },
  d = { "<cmd>ObsidianToday<cr>", "to open/create a new daily note. This command also takes an optional offset in days" },
  T = { "<cmd>ObsidianTemplate<cr>", " to insert a template from the templates folder, selecting from a list using" },
  s = { "<cmd>ObsidianSearch<cr>", "to search for (or create) notes in your vault using ripgrep with telescope.nvim, fzf.vim, fzf-lua, or Mini.Pick." },
  p = { "<cmd>ObsidianPasteImg<cr>", "to paste an image from the clipboard into the note at the cursor position by saving it to the vault and adding a markdown image link. You can configure the default folder to save images to with the attachments.img_folder option." },
  w = { "<cmd>ObsidianWorkspace<cr>", "to switch to another workspace" },
  r = { "<cmd>ObsidianRename<cr>", "to rename the note of the current buffer or reference under the cursor, updating all backlinks across the vault." },
  -- :ObsidianNew [TITLE] to create a new note. This command has one optional argument: the title of the new note.
  n = { "<cmd>ObsidianNew<cr>", "to create a new note. This command has one optional argument: the title of the new note." },
  q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick switch." },
  t = { "<cmd>ObsidianTags<cr>", "Tags" },

}

lvim.builtin.which_key.vmappings['o'] = {
  name = "Obsidian",
  l = { "<cmd>ObsidianLink<cr>", "to link an inline visual selection of text to a note. This command has one optional argument: a query that will be used to resolve the note by ID, path, or alias. If not given, the selected text will be used as the query." },
  -- t = { "<cmd>ObsidianLinkNew<cr>", "to create a new note and link it to an inline visual selection of text. This command has one optional argument: the title of the new note. If not given, the selected text will be used as the title." },
  T = { "<cmd>ObsidianTemplate<cr>", " to insert a template from the templates folder, selecting from a list using" },
}

lvim.keys.normal_mode["  "] = { ':' }
lvim.keys.normal_mode["gf"] = { '<cmd>ObsidianFollowLink<CR>' }
-- lvim.keys.normal_mode["<leader>on"] = ":ObsidianNew<space>"


-- telekasten
-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

lvim.builtin.which_key.mappings['z'] = {
  name = "Telekasten",
  -- f = { "<cmd>Telekasten find_notes<CR>", "Find notes" },
  f = {
    name = "Find",
    n = { "<cmd>Telekasten find_notes<CR>", "Find notes by title" },
    d = { "<cmd>Telekasten find_daily_notes<CR>", "Find daily notes" },
    w = { "<cmd>Telekasten find_weekly_notes<CR>", "Find weekly notes" },
    s = { "<cmd>Telekasten search_notes<CR>", "Search in all notes" },
    f = { "<cmd>Telekasten find_friends<CR>", "Show all notes linking to the link under the cursor" },
  },
  s = {
    name = "Show",
    c = { "<cmd>Telekasten show_calendar<CR>", "Show calendar" },
    b = { "<cmd>Telekasten show_backlinks<CR>", "Show backlinks" },
    t = { "<cmd>Telekasten show_tags<CR>", "Show tags" },
    i = { "<cmd>Telekasten preview_img<CR>", "Preview image under the cursor" },
  },
  g = {
    name = "Goto",
    d = { "<cmd>Telekasten goto_today<CR>", "Goto today" },
    w = { "<cmd>Telekasten goto_thisweek<CR>", "Goto this week" },
    l = { "<cmd>Telekasten follow_link<CR>", "Follow link" },
  },
  i = {
    name = "Image",
    i = { "<cmd>Telekasten insert_img_link<CR>", "Browse images / media files and insert a link to the selected one" },
    p = { "<cmd>Telekasten paste_img_and_link<CR>", "Paste an image from the clipboard into a file and inserts a link to it" },
  },
  r = { "<cmd>Telekasten rename_note<CR>", "Rename current note and update the links pointing to it" },
  -- g = { "<cmd>Telekasten search_notes<CR>", "Search notes" },
  -- d = { "<cmd>Telekasten goto_today<CR>", "Goto today" },
  n = { "<cmd>Telekasten new_note<CR>", "New note" },
  -- c = { "<cmd>Telekasten show_calendar<CR>", "Show calendar" },
  -- b = { "<cmd>Telekasten show_backlinks<CR>", "Show backlinks" },
  -- w = { "<cmd>Telekasten goto_thisweek<CR>", "Goto this week" },
  -- t = { "<cmd>Telekasten show_tags<CR>", "Show tags" },
  z = { "<cmd>Telekasten panel<CR>", "Bring up the command palette" },
}

-- Translate
lvim.builtin.which_key.mappings['t'] = {
  name = "Translate",
  t = { "<cmd>Translate<CR>", "Echo translation in the cmdline" },
  w = { "<cmd>TranslateW<CR>", "Display translation in a window" },
  r = { "<cmd>TranslateR<CR>", "Replace the text with translation" },
  x = { "<cmd>TranslateX<CR>", "Translate the text in clipboard" },
}

lvim.builtin.which_key.vmappings['t'] = {
  name = "Translate",
  t = { "<cmd>Translate<CR>", "Echo translation in the cmdline" },
  w = { "<cmd>TranslateW<CR>", "Display translation in a window" },
  r = { "<cmd>TranslateR<CR>", "Replace the text with translation" },
}



lvim.builtin.which_key.mappings['m'] = {
  name = "Markdown",
  p = { "<cmd>MarkdownPreview<CR>", "Preview" },
  s = { "<cmd>MarkdownPreviewStop<CR>", "Stop preview" },
  m = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle preview" },
}
