local status_ok, lsp_zero = pcall(require, "lsp_zero")
if not status_ok then
  return
end

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)
