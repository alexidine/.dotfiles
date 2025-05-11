-- [[ Basic vim options ]]

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make relative line numbers default
vim.opt.relativenumber = true
vim.opt.number = true

-- Don't show the mode, since it's already in the status line (lua-line plugin)
vim.opt.showmode = false

-- Tab & indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Line wrap settings
vim.opt.wrap = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 20

-- backspace
vim.opt.backspace = "indent,eol,start"

-- turn off swapfile
vim.opt.swapfile = false

-- [[ Basic Keymaps ]]
-- See ':help vim.keymap.set()'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
-- See ':help lua-guide-autocommands'

-- Highlight when yanking (copying) text
--  Try it with 'yap' in normal mode
--  See ':help vim.highlight.on_yank()'
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) test",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Sets specific options and key mappings for text-like files (e.g., text, Markdown, LaTeX, AsciiDoc).
--  When a file of these types is opened, the following settings are applied locally to the buffer:
--    1. Enable line wrapping (`wrap`).
--    2. Enable breaking lines at word boundaries (`linebreak`).
--    3. Allow certain keys to move to the next/previous line when the cursor is at the start/end of a line (`whichwrap`).
--    4. Map the `j` key to move down by display lines (`gj`), considering wrapped lines.
--    5. Map the `k` key to move up by display lines (`gk`), considering wrapped lines.
vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable specific options & key mappings for text-like files",
  group = vim.api.nvim_create_augroup("TextFileOptions", { clear = true }),
  pattern = { "text", "md", "markdown", "latex", "plaintex", "rst", "asciidoc" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.whichwrap:append("b,s,<,>,[,],h,l")
    -- get current buffer number
    local bufnr = vim.api.nvim_get_current_buf()
    -- set buffer-local key mappings
    vim.api.nvim_buf_set_keymap(bufnr, "n", "j", "gj", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "k", "gk", { noremap = true, silent = true })
  end,
})

-- Reset terminal cursor to underscore when exiting nvim
vim.api.nvim_create_autocmd("ExitPre", {
  desc = "Set cursor back to underscore when leaving Neovim",
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=n-ci:hor30-iCursor-blinkwait300-blinkon200-blinkoff150",
})
