
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

-- Tile Window West
function tileWest()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Left", tileWest)
hs.hotkey.bind(hyper, "Pad4", tileWest)

-- Tile Window East
function tileEast()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Right", tileEast)
hs.hotkey.bind(hyper, "Pad6", tileEast)

-- Tile Window North
function tileNorth()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Up", tileNorth)
hs.hotkey.bind(hyper, "Pad8", tileNorth)

-- Tile Window South
function tileSouth()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Down", tileSouth)
hs.hotkey.bind(hyper, "Pad2", tileSouth)

-- Tile Window Northeast
function tileNorthEast()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Pad9", tileNorthEast)

-- Tile Window Northwest
function tileNorthWest()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2

  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Pad7", tileNorthWest)

-- Tile Window Southwest
function tileSouthWest()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2

  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Pad1", tileSouthWest)

-- Tile Window Southeast
function tileSouthEast()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2

  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Pad3", tileSouthEast)

-- Fullscreen focused window
hs.hotkey.bind(hyper, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  win:setFrame(max)
end)

-- Center focused window
hs.hotkey.bind(hyper, "C", function()
  local win = hs.window.focusedWindow()
  win:centerOnScreen()
end)

-- Move focused window to next screen
hs.hotkey.bind(hyper, "N", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:moveToScreen(screen:next())
end)

-- Move focused window to previous screen
hs.hotkey.bind(hyper, "P", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:moveToScreen(screen:previous())
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
