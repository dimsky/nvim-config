local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
  return
end

transparent.setup({ -- Optional, you don't have to run setup.
  groups = {        -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {},   -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

-- vim.api.nvim_set_hl(0, 'NotifyBackground', vim.api.nvim_get_hl_by_name('Normal', true))


transparent.clear_prefix('NeoTree')
transparent.clear_prefix('lualine')
