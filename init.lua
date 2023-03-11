local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  cmd 'packadd packer.nvim'
end
require('plugin')

local scan = require'plenary.scandir'

local cores = scan.scan_dir(string.format("%s/lua/core", fn.stdpath("config")), { hidden = true, depth = 2 })
for _, file in ipairs(cores) do
    cmd("source " .. file)
end

local plugins = scan.scan_dir(string.format("%s/lua/plugin", fn.stdpath("config")), { hidden = true, depth = 2 })
local plugin_init = string.format("%s/lua/plugin/%s", fn.stdpath("config"), "init.lua")
for _, file in ipairs(plugins) do
    if file ~= plugin_init then
        cmd("source " .. file)
    end
end
