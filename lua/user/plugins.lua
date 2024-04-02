-- local fn = vim.fn


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup(plugins, opts)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
-- vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({


  "folke/which-key.nvim",
  {
    "folke/neoconf.nvim",
    branch = "v1.x",
  },

  "folke/neodev.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },


  -- 通知
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig", -- enable LSP

  { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },


  -- cmp
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",  -- buffer completions
  "hrsh7th/cmp-path",    -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" }
  },
  "saadparwaiz1/cmp_luasnip", -- snippet completions

  -- 首页
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  -- 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- 折叠线
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",   opts = {} },

  -- 文件导航栏
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  "famiu/bufdelete.nvim",

  -- 底部状态栏
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- 注释
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- 自动括号
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  -- 快捷终端
  { 'akinsho/toggleterm.nvim', version = "*", opts = { --[[ things you want to change go here]] } },


  -- markdown 预览
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- theme
  "sainnhe/gruvbox-material",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- 快速跳转
  {
    "phaazon/hop.nvim", -- like easymotion, but more powerful
    branch = "v2",      -- optional but strongly recommended
    config = function()
      require 'hop'.setup()
    end
  },


  -- 首页
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  -- 透明
  {
    'xiyaowong/transparent.nvim',
  },

  -- AI 
  { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },

})

-- -- Automatically install packer
-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system {
--     "git",
--     "clone",
--     "--depth",
--     "1",
--     "https://github.com/wbthomason/packer.nvim",
--     install_path,
--   }
--   print "Installing packer close and reopen Neovim..."
--   vim.cmd [[packadd packer.nvim]]
-- end

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- -- Use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
--   return
-- end

-- -- Have packer use a popup window
-- packer.init {
--   git = {
--     clone_timeout = 600,

--   },
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- -- Install your plugins here
-- return packer.startup(function(use)
--   -- My plugins here
--   use "wbthomason/packer.nvim" -- Have packer manage itself
--   use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--   use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
--   use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
--   use "numToStr/Comment.nvim" -- Easily comment stuff
--   use "kyazdani42/nvim-web-devicons"
--   use "kyazdani42/nvim-tree.lua"
--   --[[ use "akinsho/bufferline.nvim" ]]
--   use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
--   use "moll/vim-bbye"
--   use "nvim-lualine/lualine.nvim"
--   use "akinsho/toggleterm.nvim"
--   use "ahmedkhalf/project.nvim"
--   use "lewis6991/impatient.nvim"
--   use "lukas-reineke/indent-blankline.nvim"
--   use "goolord/alpha-nvim"
--   use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
--   use "folke/which-key.nvim"

--   -- Colorschemes
--   -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
--   use "lunarvim/darkplus.nvim"
--   use "sainnhe/gruvbox-material"

--   -- cmp plugins
--
--   use "hrsh7th/nvim-cmp" -- The completion plugin
--   use "hrsh7th/cmp-buffer" -- buffer completions
--   use "hrsh7th/cmp-path" -- path completions
--   use "hrsh7th/cmp-cmdline" -- cmdline completions
--   use "saadparwaiz1/cmp_luasnip" -- snippet completions
--   use "hrsh7th/cmp-nvim-lsp"

--   -- snippets
--   use "L3MON4D3/LuaSnip" --snippet engine
--   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

--   -- LSP
--   use "neovim/nvim-lspconfig" -- enable LSP
--   use "williamboman/nvim-lsp-installer" -- simple to use language server installer
--   use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
--   use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

--   -- Telescope
--   use "nvim-telescope/telescope.nvim"

--   use {
--     "phaazon/hop.nvim", -- like easymotion, but more powerful
--     branch = "v1", -- optional but strongly recommended
--   }

--   -- Treesitter
--   use {
--     "nvim-treesitter/nvim-treesitter",
--     run = ":TSUpdate",
--   }
--   use "p00f/nvim-ts-rainbow"
--   use "JoosepAlviste/nvim-ts-context-commentstring"

--   -- Git
--   use "lewis6991/gitsigns.nvim"

--   -- quick run
--   use { 'michaelb/sniprun', run = 'bash ./install.sh' }

--   -- outline
--   use 'stevearc/aerial.nvim'

--   -- startuptime

--   -- notify
--   use 'rcarriga/nvim-notify'

--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if PACKER_BOOTSTRAP then
--     require("packer").sync()
--   end
-- end)
