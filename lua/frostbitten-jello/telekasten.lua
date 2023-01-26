local home = vim.fn.expand("~/Documents/Notes/Second-brain")
-- NOTE for Windows users:
-- - don't use Windows
-- - try WSL2 on Windows and pretend you're on Linux
-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
-- - NEVER use "C:\Users\myname" style paths
-- - Using `vim.fn.expand("~/zettelkasten")` should work now but mileage will vary with anything outside of finding and opening files
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = false,
    auto_set_syntax = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- Generate note filenames. One of:
    -- "title" (default) - Use title if supplied, uuid otherwise
    -- "uuid" - Use uuid
    -- "uuid-title" - Prefix title by uuid
    -- "title-uuid" - Suffix title with uuid
    new_note_filename = "title",

    --[[ file UUID type
        - "rand"
        - string input for os.date()
        - or custom lua function that returns a string
    --]]
    uuid_type = "%Y%m%d%H%M",
    -- UUID separator
    uuid_sep = "-",

    -- if not nil, this string replaces spaces in the title when generating filenames
    filename_space_subst = nil,

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- skip telescope prompt for goto_today and goto_thisweek
    journal_auto_open = false,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- default sort option: 'filename', 'modified'
    sort = "filename",

    -- integrate with calendar-vim
    plug_into_calendar = false,
    -- calendar_opts = {
    --     -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
    --     weeknm = 4,
    --     -- use monday as first day of week: 1 .. true, 0 .. false
    --     calendar_monday = 1,
    --     -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
    --     calendar_mark = 'left-fit',
    -- },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = ":tag:",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,

    vaults = {
        vault2 = {
            -- alternate configuration for vault2 here. Missing values are defaulted to
            -- default values from telekasten.
            -- e.g.
            -- home = "/home/user/vaults/personal",
        },
    },

    -- how to preview media files
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    media_previewer = "telescope-media-files",

    -- A customizable fallback handler for urls.
    follow_url_fallback = nil,
})

vim.keymap.set('n', '<leader>zn ', "<cmd>lua require('telekasten').new_note()<CR>", { desc = '[z]ettelkasten [n]ew note' })
vim.keymap.set('n', '<leader>znt ', "<cmd>lua require('telekasten').new_templated_note()<CR>", { desc = '[z]ettelkasten [n]ew [t]emplate' })
vim.keymap.set('n', '<leader>zf', ':lua require("telekasten").find_notes()<CR>', {desc = '[z]ettelkasten [f]ind'})
vim.keymap.set('n', '<leader>zd', ':lua require("telekasten").find_daily_notes()<CR>', {desc = '[z]ettelkasten [d]aily'})
vim.keymap.set('n', '<leader>zw ', "<cmd>lua require('telekasten').find_weekly_notes()<CR>", { desc = '[z]ettelkasten [W]eekly' })
vim.keymap.set('n', '<leader>zs', ':lua require("telekasten").search_notes()<CR>', {desc = '[z]ettelkasten [s]earch'})
vim.keymap.set('n', '<leader>zil', ':lua require("telekasten").insert_link()<CR>', {desc = '[z]ettelkasten [i]nsert [l]ink'})
vim.keymap.set('n', '<leader>zI ', "<cmd>lua require('telekasten').insert_img_link({ i=true })<CR>", { desc = '[z]ettelkasten [i]nsert [i]mage link' })
vim.keymap.set('n', 'K', ':lua require("telekasten").follow_link()<CR>', {desc = 'Open lin[K]'})
vim.keymap.set('n', '<leader>zT ', "<cmd>lua require('telekasten').goto_today()<CR>", { desc = '[z]ettelkasten [T]oday' })
vim.keymap.set('n', '<leader>zW ', "<cmd>lua require('telekasten').goto_thisweek()<CR>", { desc = '[z]ettelkasten this [W]eek' })
vim.keymap.set('n', '<leader>zy ', "<cmd>lua require('telekasten').yank_notelink()<CR>", { desc = '[z]ettelkasten [y]ank notelink' })
vim.keymap.set('n', '<leader>ztt ', "<cmd>lua require('telekasten').toggle_todo()<CR>", { desc = '[z]ettelkasten [t]oggle [t]odo' })
vim.keymap.set('n', '<leader>zp ', "<cmd>lua require('telekasten').preview_img()<CR>", { desc = '[z]ettelkasten [p]review' })
vim.keymap.set('n', '<leader>zm ', "<cmd>lua require('telekasten').browse_media()<CR>", { desc = '[z]ettelkasten browse [m]edia' })
vim.keymap.set('n', '<leader>zr ', "<cmd>lua require('telekasten').rename_note()<CR>", { desc = '[z]ettelkasten [r]ename' })
vim.keymap.set('n', '<leader>zc ', "<cmd>lua require('telekasten').show_calendar()<CR>", { desc = '[z]ettelkasten [c]alendar' })
vim.keymap.set('n', '<leader>zsb ', "<cmd>lua require('telekasten').show_backlinks()<CR>", { desc = '[z]ettelkasten [s]how [b]acklinks' })
vim.keymap.set('n', '<leader>zst ', "<cmd>lua require('telekasten').show_tags()<CR>", { desc = '[z]ettelkasten [s]how [t]ags' })

-- we could define [[ in **insert mode** to call insert link
-- inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
-- alternatively: leader [
vim.keymap.set('n', '<leader>[', "<cmd>:lua require('telekasten').insert_link({ i=true })<CR>", { desc = '' })
vim.keymap.set('n', '<leader>zt', "<cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>", { desc = '' })
vim.keymap.set('n', '<leader>#', "<cmd>lua require('telekasten').show_tags({i = true})<cr>", { desc = '' })
