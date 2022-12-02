local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
require('settings')
require('impatient')
require('plugins')
require('keymaps')
