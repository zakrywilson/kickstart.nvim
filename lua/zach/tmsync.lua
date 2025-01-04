-- tmsync.lua
-- Required for https://github.com/zakrywilson/tmsync
-- Based on source: https://felix-kling.de/blog/2021/linux-toggle-dark-mode.html#neovim

local function fileExists(filepath)
  local expandedPath = vim.fn.expand(filepath)
  local f = io.open(expandedPath, "r")

  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local filepath = vim.fn.expand('$TMSYNC_HOME/nvim-colorscheme.vim')
if not fileExists(filepath) then
  print("File does not exist: '" .. filepath .. "'")
  return
end

local function reload()
  vim.cmd('source ' .. filepath)
  vim.cmd([[
    highlight Comment cterm=italic gui=italic
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
  ]])
end

local w, err = vim.loop.new_fs_event()
if err then
  print("Error creating file watcher: " .. err)
  return
end

local function watch_file(fname)
  if w == nil then
    print("Error: file watcher is nil")
    return
  end

  w:start(fname, {}, vim.schedule_wrap(function()
    reload()
    -- Debounce: stop/start
    w:stop()
    watch_file(filepath)
  end))
end

-- Reload Vim config when background changes
watch_file(filepath)
reload()
