
--[[
Hammerspoon is a tool for automation of macOS. It can be used to create
keyboard shortcuts to launch applications and to replace window managers
like Spectacle.

https://www.hammerspoon.org/
--]]

primary = {"cmd", "alt", "ctrl"}
secondary = {"cmd", "alt", "ctrl", "shift"}

-- Reload Hammerspoon configuration
hs.hotkey.bind(primary, "R", function()
    hs.alert.show("Reloading Hammerspoon Configuration")
    hs.reload()
end)

--[[
Tiling
--]]

-- Disable animations
hs.window.animationDuration=0

-- Tile Window Left
hs.hotkey.bind(primary, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Tile Window Right
hs.hotkey.bind(primary, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Tile Window Top
hs.hotkey.bind(primary, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Tile Window Bottom
hs.hotkey.bind(primary, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Fullscreen
hs.hotkey.bind(primary, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  win:setFrame(max)
end)

-- Center
hs.hotkey.bind(primary, "C", function()
  local win = hs.window.focusedWindow()
  win:centerOnScreen()
end)

--[[
Application Launchers

primary + e will launch Emacs
primary + t will launch iTerm
primary + g will launch Google Chrome
primary + f will launch Firefox
--]]

-- Launch Emacs with primary+e
hs.hotkey.bind(primary, "E", function()
  hs.application.launchOrFocus("Emacs")
end)

-- Launch iTerm with primary+t
hs.hotkey.bind(primary, "T", function()
  hs.application.launchOrFocus("iTerm")
end)

-- Launch Google Chrome with primary+g
hs.hotkey.bind(primary, "G", function()
  hs.application.launchOrFocus("Google Chrome")
end)

-- Launch Firefox with primary+f
hs.hotkey.bind(primary, "B", function()
  hs.application.launchOrFocus("Firefox")
end)

-- Launch Spotify with primary+M
hs.hotkey.bind(primary, "M", function()
  hs.application.launchOrFocus("Spotify")
end)

-- Launch Slack with primary+S
hs.hotkey.bind(primary, "S", function()
  hs.application.launchOrFocus("Slack")
end)

-- https://www.hammerspoon.org/go/#helloworld
