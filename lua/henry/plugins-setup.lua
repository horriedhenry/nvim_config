local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")

if not status then
    return
end

-- Plugins
return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    --lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    --color themes
    use("rebelot/kanagawa.nvim")
    use("rose-pine/neovim")
    use("folke/tokyonight.nvim")
    use("catppuccin/nvim")
    -- use("ellisonleao/gruvbox.nvim")
    -- use("morhetz/gruvbox")
    use("ellisonleao/gruvbox.nvim")
    use("sainnhe/sonokai")

    --undo tree
    use("mbbill/undotree")

    -- ThePrimeagen 
    use("ThePrimeagen/vim-be-good")
    use("ThePrimeagen/harpoon")

    -- Git
    use("tpope/vim-fugitive")

    -- ZenMode
    use("folke/zen-mode.nvim")

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")
    use("szw/vim-maximizer") --maximizes and restores current window

    -- essential plugins
    use("tpope/vim-surround") --surround a word with something
    use("vim-scripts/ReplaceWithRegister") -- replace copied word with other word

    -- commentign with gc
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    -- status line
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding w/ telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
      })
    use("nvim-treesitter/playground")

      -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

      -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    -- LSP Zero
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
    }

    use("jay-babu/mason-null-ls.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use {
      'Exafunction/codeium.vim',
      config = function ()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)

