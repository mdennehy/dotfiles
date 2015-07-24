--------------------------------------------------------------------------------
---  Load required extensions                                                ---
--------------------------------------------------------------------------------

package.path = package.path .. ';hs/tiling/?.lua;hs/?/init.lua;hs/_asm/undocumented/spaces/?.lua;hs/_asm/undocumented/?/init.lua'

---  Unsupported Spaces extension. Uses private APIs
---  http://github.com/asmagill/hammerspoon_asm.undocumented
-- local spaces = require("hs._asm.undocumented.spaces")

---  Tiling extension
---  https://github.com/dsanson/hs.tiling
local tiling = require("hs.tiling")


--------------------------------------------------------------------------------
---  Keys                                                                    ---
--------------------------------------------------------------------------------
local hyper = {"shift", "cmd", "alt", "ctrl"}

--------------------------------------------------------------------------------
---  Reload config on write                                                  ---
--------------------------------------------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

--------------------------------------------------------------------------------
---  Hyper L to Lock screen                                                  ---
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, "l", function()
--    os.execute("/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend")
--  hs.caffeinate.lockScreen()
  hs.caffeinate.startScreensaver()
end)

--------------------------------------------------------------------------------
---  Hyper-tab to show window hints                                          ---
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, "tab", function()
    hs.hints.windowHints(hs.window:otherWindowsAllScreens())
end)

--------------------------------------------------------------------------------
---  Hyper f for fullscreen                                                  ---
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, "f", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

--------------------------------------------------------------------------------
---  Tiling layout                                                           ---
--------------------------------------------------------------------------------

---  Layouts in use
tiling.set('layouts', {
  'fullscreen', 
  'columns',
  'main-horizontal',
  'rows',
  'main-vertical',
  'gp-vertical'
})

---  Push the window into the exact center of the screen
local function center(window)
  frame = window:screen():frame()
  frame.x = (frame.w / 2) - (frame.w / 4)
  frame.y = (frame.h / 2) - (frame.h / 4)
  frame.w = frame.w / 2
  frame.h = frame.h / 2
  window:setframe(frame)
end

hs.hotkey.bind(hyper, "c", function() tiling.togglefloat(center) end)
hs.hotkey.bind(hyper, "h", function() 
  hs.alert.show('cycle') 
  tiling.cyclelayout() 
  tiling.retile() 
  hs.alert.show('cycled') 
end)

hs.hotkey.bind(hyper, "t", function()
  local space = getspace()
  hs.alert.show('test')
  hs.alert.show(tostring(space))
end)

hs.hotkey.bind(hyper, "j", function() tiling.cycle(1) end)
hs.hotkey.bind(hyper, "k", function() tiling.cycle(-1) end)
hs.hotkey.bind(hyper, "space", function() tiling.promote() end)


--------------------------------------------------------------------------------
---  switch Spaces                                                           ---
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, '1', function()
  spaces.moveToSpace("1")
end)
hs.hotkey.bind(hyper, '2', function()
  spaces.moveToSpace("2")
end)
hs.hotkey.bind(hyper, '3', function()
  spaces.moveToSpace("3")
end)
hs.hotkey.bind(hyper, '4', function()
  spaces.moveToSpace("4")
end)
hs.hotkey.bind(hyper, '5', function()
  spaces.moveToSpace("5")
end)
hs.hotkey.bind(hyper, '6', function()
  spaces.moveToSpace("6")
end)
hs.hotkey.bind(hyper, '7', function()
  spaces.moveToSpace("7")
end)
hs.hotkey.bind(hyper, '8', function()
  spaces.moveToSpace("8")
end)
hs.hotkey.bind(hyper, '9', function()
  spaces.moveToSpace("9")
end)
hs.hotkey.bind(hyper, '0', function()
  spaces.moveToSpace("0")
end)

