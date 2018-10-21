
--[[
Hammerspoon is a tool for automation of macOS. It can be used to create
keyboard shortcuts to launch applications and to replace window managers
like Spectacle.

https://www.hammerspoon.org/
--]]

-- Define the hyper key chord as Crtl+Shift+Alt+Cmd. In Karabiner Elements
-- we have a rule so that left_control will emit the hyper key chord. There
-- is also a rule that maps caps_lock to left_ctrl.
hyper = {"cmd", "alt", "ctrl", "shift"}

-- Reload Hammerspoon configuration
hs.hotkey.bind(hyper, "R", function()
    hs.alert.show("Reloading Hammerspoon Configuration")
    hs.reload()
end)

--[[
Tiling
--]]

-- Disable animations
hs.window.animationDuration=0

-- Tile Window Left
hs.hotkey.bind(hyper, "Left", function()
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
hs.hotkey.bind(hyper, "Right", function()
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
hs.hotkey.bind(hyper, "Up", function()
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
hs.hotkey.bind(hyper, "Down", function()
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
hs.hotkey.bind(hyper, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  win:setFrame(max)
end)

-- Center
hs.hotkey.bind(hyper, "C", function()
  local win = hs.window.focusedWindow()
  win:centerOnScreen()
end)

--[[
Application Launchers

hyper + e will launch Emacs
hyper + t will launch iTerm
hyper + g will launch Google Chrome
hyper + f will launch Firefox
--]]

-- Launch Emacs with hyper+e
hs.hotkey.bind(hyper, "E", function()
  hs.application.launchOrFocus("Emacs")
end)

-- Launch iTerm with hyper+t
hs.hotkey.bind(hyper, "T", function()
  hs.application.launchOrFocus("iTerm")
end)

-- Launch Google Chrome with hyper+g
hs.hotkey.bind(hyper, "G", function()
  hs.application.launchOrFocus("Google Chrome")
end)

-- Launch Firefox with hyper+f
hs.hotkey.bind(hyper, "B", function()
  hs.application.launchOrFocus("Firefox")
end)

-- Launch Spotify with hyper+M
hs.hotkey.bind(hyper, "M", function()
  hs.application.launchOrFocus("Spotify")
end)

-- Launch Slack with hyper+S
hs.hotkey.bind(hyper, "S", function()
  hs.application.launchOrFocus("Slack")
end)

-- https://www.hammerspoon.org/go/#helloworld
