-- ~/.config/nvim/init.lua

vim.cmd('source ~/.vimrc')

require("lazy").setup({
    { 'github/copilot.vim' },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                      local function map(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr }) end

                      map('n', '<leader>n', require('gitsigns').next_hunk)
                      map('n', '<leader>p', require('gitsigns').prev_hunk)
                      map('n', '<leader>v', require('gitsigns').preview_hunk)
                end
            }
        end
    },
})

