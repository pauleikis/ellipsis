local meh = {"shift", "alt", "ctrl"}
local hyper = {"shift", "alt", "ctrl", "cmd"}

hs.alert.show("Hammerspoon config reloaded")
hs.window.animationDuration = 0
hs.hotkey.bind(meh, "R",
  function()
    hs.reload()
  end
)

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse(
    "MiroWindowsManager",
    {
        hotkeys = {
            up = {meh, "up"},
            right = {meh, "right"},
            down = {meh, "down"},
            left = {meh, "left"},
            fullscreen = {meh, "m"}
        }
    }
)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
  end)