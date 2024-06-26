local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok1 then
  return
end


local status_ok2, lspconfig = pcall(require, "lspconfig")
if not status_ok2 then
  return
end

local status_ok3, lsp_zero = pcall(require, "lsp-zero")
if not status_ok3 then
  return
end


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

vim.diagnostic.config({
  signs = false
})


mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})


mason_lspconfig.setup {
  ensure_installed = { "lua_ls", "rust_analyzer" },
  handlers = {
    lsp_zero.default_setup,
  }
}

require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup {}
  end,
}


require("user.lsp.lsp-config")
-- require("lspconfig").lua_ls.setup{}

--require "user.lsp.lsp-installer"
-- require("user.lsp.handlers").setup()
-- require "user.lsp.null-ls
