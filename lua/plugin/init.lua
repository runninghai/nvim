local fn = vim.fn
local cmd = vim.cmd

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'windwp/nvim-autopairs' }
    -- use { 'ray-x/go.nvim' }
    use { "folke/neodev.nvim" }
    use { 'ray-x/guihua.lua' } -- recommended if need floating window support
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'rking/ag.vim' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'Mofiqul/dracula.nvim' }
    use { 'wakatime/vim-wakatime' }
    use { 'folke/todo-comments.nvim' }
    use { 'tpope/vim-fugitive' }
    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- 'jose-elias-alvarez/null-ls.nvim',
    }

    use {
        'renerocksai/telekasten.nvim',
        requires = { 'nvim-telescope/telescope.nvim' }
    }
    use { 'renerocksai/calendar-vim' }

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
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
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

local scan = require 'plenary.scandir'
local plugins = scan.scan_dir(string.format("%s/lua/plugin", fn.stdpath("config")), { hidden = true, depth = 2 })
local plugin_init = string.format("%s/lua/plugin/%s", fn.stdpath("config"), "init.lua")
for _, file in ipairs(plugins) do
    if file ~= plugin_init then
        cmd("source " .. file)
    end
end
