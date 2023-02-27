-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/guilherme/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/guilherme/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/guilherme/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/guilherme/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/guilherme/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["gleam.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/gleam.vim",
    url = "https://github.com/gleam-lang/gleam.vim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/npxbr/glow.nvim"
  },
  ["haskell-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nim.nvim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/nim.nvim",
    url = "https://github.com/alaviss/nim.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-jdtls"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-elixir"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/jubnzv/virtual-types.nvim"
  },
  wal = {
    loaded = true,
    path = "/home/guilherme/.local/share/nvim/site/pack/packer/start/wal",
    url = "https://github.com/Gabulhas/wal.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType nim ++once lua require("packer.load")({'nim.nvim'}, { ft = "nim" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "eelixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType gleam ++once lua require("packer.load")({'gleam.vim'}, { ft = "gleam" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-dap-go', 'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'haskell-vim'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "elixir" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/nim.nvim/ftdetect/nim.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/nim.nvim/ftdetect/nim.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/nim.nvim/ftdetect/nim.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/gleam.vim/ftdetect/gleam.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/gleam.vim/ftdetect/gleam.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/gleam.vim/ftdetect/gleam.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]], false)
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/guilherme/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
