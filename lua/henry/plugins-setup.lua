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
    use("Mofiqul/dracula.nvim")
    use("rose-pine/neovim")
    use("morhetz/gruvbox") -- gruvbox

    --undo tree
    use("mbbill/undotree")

    -- ThePrimeagen 
    use("ThePrimeagen/vim-be-good")
    use("ThePrimeagen/harpoon")

    -- Git
    use("tpope/vim-fugitive")

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

	  -- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

    -- temp
    use("p00f/clangd_extensions.nvim")
	  -- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/mason.nvim" -- simple to use language server installer
	use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
	use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions


    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
      })

      -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

      -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    if packer_bootstrap then
        require("packer").sync()
    end
end)

