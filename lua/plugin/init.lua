vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    -- use { 'ray-x/go.nvim' }
    use { 'ray-x/guihua.lua' } -- recommended if need floating window support
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'rking/ag.vim' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'Mofiqul/dracula.nvim' }
    use { 'folke/todo-comments.nvim' }
    use { 'tpope/vim-fugitive' }
    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- 'jose-elias-alvarez/null-ls.nvim',
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'simrat39/symbols-outline.nvim',
    }
    use {
        'folke/trouble.nvim'
    }

    use {
        'mfussenegger/nvim-dap',
        'leoluz/nvim-dap-go',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text'
    }

    use { 'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
        ft = { 'markdown' }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }
    use({
        'kylechui/nvim-surround',
        tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    })
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
end
)
