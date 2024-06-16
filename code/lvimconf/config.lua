--colorscheme 
lvim.colorscheme = "catppuccin"
vim.opt.relativenumber = true

--disabled plugins
lvim.builtin.dap.active = false
lvim.builtin.gitsigns.active = false

--plugins 
lvim.plugins = {
  { "kosayoda/nvim-lightbulb", lazy=true },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000},
  { "mbbill/undotree" },
  { "norcalli/nvim-colorizer.lua", lazy=true },
}

--set hightlight on search but clear it using esc
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})

require'colorizer'.setup()

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}
