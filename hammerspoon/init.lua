local meh = {"shift", "alt", "ctrl"}
local hyper = {"shift", "alt", "ctrl", "cmd"}

hs.alert.show("Hammerspoon config reloaded")
hs.window.animationDuration = 0
hs.hotkey.bind(meh, "R",
  function()
    hs.reload()
  end
)

-- uncomment to print out all application names
-- hs.fnutils.each(
--   hs.application.runningApplications(),
--   function(app)
--     print(app:title()) 
--   end
-- )

local switches = {
  {'D', 'IntelliJ IDEA'},
  {'F', 'Finder'},
  {'B', 'Brave Browser'},

  {'T', 'iterm'},
  {'O', 'Safari'},
  {'A', 'Slack'},
  {'W', 'Messages'},

  {'V', 'DBeaver'},
  {'C', 'Visual Studio Code'},
  {'K', 'Spotify'},

  {'H', 'Keychain Access'},

  {'M', 'Activity Monitor'},
}

hs.hotkey.bind(hyper, "space",
  function()
    local msg = ""
    for k, v in pairs(switches) do
      msg = msg .. v[1] .. " -> " .. v[2] .. "\n"
    end
    hs.alert.show(string.gsub(msg, "%s+$", ""), 10)
  end
)

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
    hs.alert.show("Hello!")
    -- hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
  end)

hs.hotkey.bind(meh, "tab", hs.caffeinate.lockScreen)
