local meh = {"shift", "alt", "ctrl"}
local hyper = {"shift", "alt", "ctrl", "cmd"}

hs.alert.show("Hammerspoon config reloaded")
hs.window.animationDuration = 0
hs.hotkey.bind(meh, "R",
  function()
    hs.reload()
  end
)

local switches = {
  {'B', 'Safari'},
  {'M', 'Messages'},
  {'D', 'IntelliJ IDEA'},
  {'C', 'Visual Studio Code'},
  {'F', 'Finder'},
  {'P', 'Spotify'},
  {'S', 'Slack'},
  {'T', 'iterm'},
  {'K', 'Keychain Access'},
  {'J', 'Activity Monitor'},
}

for k, v in pairs(switches) do
  hs.hotkey.bind(hyper, v[1],
  function()
    hs.application.open(v[2])
  end
)
end

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse(
    "MiroWindowsManager",
    {
        hotkeys = {
            up = {meh, "up"},
            right = {meh, "right"},
            down = {meh, "down"},
            left = {meh, "left"},
            fullscreen = {meh, "="}
        }
    }
)

hs.hotkey.bind(meh, "]", function()
  -- move the focused window one display to the right
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
end)

hs.hotkey.bind(meh, "[", function()
  -- move the focused window one display to the left
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
end)



hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
  end)