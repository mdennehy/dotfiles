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
---  Keybindings for starting apps/switching to apps                         ---
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, "v",      function () hs.application.launchOrFocus("MacVim") end)
hs.hotkey.bind(hyper, "return", function () hs.application.launchOrFocus("iTerm2") end)
hs.hotkey.bind(hyper, "w",      function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, "s",      function () hs.application.launchOrFocus("Slack") end)
hs.hotkey.bind(hyper, "y",      function () hs.application.launchOrFocus("Skype") end)
hs.hotkey.bind(hyper, "m",      function () hs.application.launchOrFocus("Microsoft Outlook") end)
