local keyset = vim.keymap.set
keyset('n', '<Leader>mdp', ':MarkdownPreview<CR>')
keyset('n', '<Leader>mds', ':MarkdownPreview<CR>')


local g = vim.g
g.mkdp_open_ip = "0.0.0.0"
g.mkdp_port='9090'
