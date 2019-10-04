
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

-- Debugging function where you can test stuff
hs.hotkey.bind(hyper, "D", function()
    local primaryScreen = hs.screen.primaryScreen()
    local secondaryScreen = primaryScreen:next()
    local allScreens = hs.screen.allScreens()
    hs.alert.show("This is the primary screen", hs.alert.defaultStyle, primaryScreen)
    hs.alert.show("This is the secondary screen", hs.alert.defaultStyle, secondaryScreen)
end)

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
hyper + b will launch Firefox
hyper + x will launch XCode
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

-- Launch Spotify with hyper+S
hs.hotkey.bind(hyper, "S", function()
  hs.application.launchOrFocus("Spotify")
end)

-- Launch Slack with hyper+C
hs.hotkey.bind(hyper, "C", function()
  hs.application.launchOrFocus("Slack")
end)

-- Launch XCode with hyper+X
hs.hotkey.bind(hyper, "X", function()
  hs.application.launchOrFocus("Xcode")
end)


--[[
Multiple displays
--]]

-- Make the give window fullscreen
function makeFullscreen(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  win:setFrame(max)
end

-- Move the given window to the primary screen
function moveToPrimaryScreen(win)
  local screen = hs.screen.primaryScreen()
  win:moveToScreen(screen)
end

-- Move the given window to the secondary screen
function moveToSecondaryScreen(win)
  local primaryScreen = hs.screen.primaryScreen()
  local secondaryScreen = primaryScreen:next()
  win:moveToScreen(secondaryScreen)
end

-- Move all windows to the primary screen and maximize them.
function maximizeAllVisibleWindowsOnPrimaryScreen()
  for i, win in ipairs(hs.window.visibleWindows()) do
    moveToPrimaryScreen(win)
    makeFullscreen(win)
  end
end

-- The arrangeWindows function is called when the number of displays
-- is changed.
function arrangeWindows()
    local primaryScreen = hs.screen.primaryScreen()
    local secondaryScreen = primaryScreen:next()

    local hasSingleScreen = primaryScreen == secondaryScreen

    if hasSingleScreen then
      maximizeAllVisibleWindowsOnPrimaryScreen()
    else
      maximizeAllVisibleWindowsOnPrimaryScreen()
    end
end
hs.hotkey.bind(hyper, "A", arrangeWindows)

-- Call the arrangeWindows function when the number of screens
-- changes.
screenWatcher = hs.screen.watcher.new(arrangeWindows)
screenWatcher:start()

--[[
Spotify
--]]

function playPauseSpotify()
  if hs.spotify.isRunning() then
    if hs.spotify.isPlaying() then
      hs.spotify.pause()
    else
      hs.spotify.play()
    end
  else
    hs.application.launchOrFocus("Spotify")
    hs.spotify.play()
  end
end

hs.hotkey.bind({}, "f8", playPauseSpotify)

hs.hotkey.bind({}, "f9", hs.spotify.next)
hs.hotkey.bind({}, "f7", hs.spotify.previous)

--[[
Audio volume control
--]]

-- To be able to bind the F10 and F11 keys you have to set
-- shortcuts for show desktop and show dashboard in mission
-- control to something else.
-- This can be done using the keyboard shortcut preferences.
-- https://github.com/Hammerspoon/hammerspoon/issues/901
hs.hotkey.bind({}, "f10", function()
  print("Mute volume")
  hs.execute("/usr/local/bin/cliclick kp:mute")

  -- This does not work when bound to f10.
  -- hs.eventtap.keyStroke({"fn"}, "f10")
end)

hs.hotkey.bind({}, "f11", function()
  print("Lower volume")
  hs.execute("/usr/local/bin/cliclick kp:volume-down")

  -- This does not work when bound to f11.
  -- hs.eventtap.keyStroke({"fn"}, "f11")
end)

hs.hotkey.bind({}, "f12", function()
  print("Raise volume")
  hs.execute("/usr/local/bin/cliclick kp:volume-up")

  -- This does not work when bound to f12
  -- hs.eventtap.keyStroke({"fn"}, "f12")
end)

--[[
Local config file
--]]
local localConfig=loadfile(hs.configdir .. "/init-local.lua")
if localConfig then
  localConfig()
end
