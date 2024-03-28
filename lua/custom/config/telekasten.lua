local M = {}

M.config = function()
  require("telekasten").setup({
    -- Main paths
    -- home                        = vim.fn.expand("/Users/huangcan/My Drive/Obsidian/second-brain"), -- Put the name of your notes directory here
    home                        = vim.fn.expand("~/.second-brain"), -- Put the name of your notes directory here

    auto_set_filetype = false,

    dailies                     = 'periodic-notes/daily-notes/',             -- path to daily notes
    weeklies                    = 'periodic-notes/weekly-notes/',            -- path to weekly notes
    templates                   = 'templates',                               -- path to templates

    -- Specific note templates
    -- set to `nil` or do not specify if you do not want a template
    template_new_note           = 'templates/basenote.md', -- template for new notes
    template_new_daily          = 'templates/daily.md', -- template for new daily notes
    template_new_weekly         = 'templates/weekly.md', -- template for new weekly notes

    -- Image subdir for pasting
    -- subdir name
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir                = "assets/imgs",

    -- File extension for note files
    extension                   = ".md",

    -- Generate note filenames. One of:
    -- "title" (default) - Use title if supplied, uuid otherwise
    -- "uuid" - Use uuid
    -- "uuid-title" - Prefix title by uuid
    -- "title-uuid" - Suffix title with uuid
    new_note_filename           = "uuid-title",
    -- file uuid type ("rand" or input for os.date such as "%Y%m%d%H%M")
    -- uuid_type                   = "%Y%m%d%H%M",
    -- uuid_type                   = "rand",
    uuid_type = function()
      local suffix = ""
      local characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ3456789' -- Reserve '012' for something else.
      for _ = 1, 8 do
          local randomIndex = math.random(1, #characters)
          suffix = suffix .. characters:sub(randomIndex, randomIndex)
      end
      return suffix
    end,

    -- UUID separator
    uuid_sep                    = "-",
    filename_space_subst = '-',

    -- Flags for creating non-existing notes
    follow_creates_nonexisting  = true, -- create non-existing on follow
    dailies_create_nonexisting  = true, -- create non-existing dailies
    weeklies_create_nonexisting = true, -- create non-existing weeklies

    -- Image link style",
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style            = "wiki",

    -- Default sort option: 'filename', 'modified'
    sort                        = "filename",

    -- Make syntax available to markdown buffers and telescope previewers
    install_syntax              = true,

    -- Tag notation: '#tag', '@tag', ':tag:', 'yaml-bare'
    -- tag_notation                = "#tag",
    tag_notation                = "yaml-bare",

    -- When linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links            = true,

    -- Command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme       = "ivy",

    -- Tag list theme:
    -- get_cursor (small tag list at cursor)
    -- dropdown (window)
    -- ivy (bottom panel)
    show_tags_theme             = "ivy",

    -- Previewer for media files (images mostly)
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    -- "viu-previewer" if you have viu installed
    media_previewer             = "telescope-media-files",

    -- Calendar integration
    plug_into_calendar          = true, -- use calendar integration
    calendar_opts               = {
      weeknm = 1,                       -- calendar week display mode:
      --   1 .. 'WK01'
      --   2 .. 'WK 1'
      --   3 .. 'KW01'
      --   4 .. 'KW 1'
      --   5 .. '1'

      calendar_monday = 1, -- use monday as first day of week:
      --   1 .. true
      --   0 .. false

      calendar_mark = 'left-fit', -- calendar mark placement
      -- where to put mark for marked days:
      --   'left'
      --   'right'
      --   'left-fit'
    },

    -- vaults                      = {
      -- personal = {
        -- configuration for personal vault. E.g.:
        -- home = "/home/user/vaults/personal",
        -- home = "~/obsidian/second-brain/"
      -- }
    -- },
  })
end

return M
