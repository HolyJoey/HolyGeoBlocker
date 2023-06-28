--Made by holyjoey.
util.require_natives(1676318796)
local regionKick = {
    [0]  = {kick = false, lang = "English"},
    [1]  = {kick = false, lang = "French"},
    [2]  = {kick = false, lang = "German"},
    [3]  = {kick = false, lang = "Italian"},
    [4]  = {kick = false, lang = "Spanish"},
    [5]  = {kick = false, lang = "Brazilian"},
    [6]  = {kick = false, lang = "Polish"},
    [7]  = {kick = false, lang = "Russian"},
    [8]  = {kick = false, lang = "Korean"},
    [9]  = {kick = false, lang = "Chinese Traditional"},
    [10] = {kick = false, lang = "Japanese"},
    [11] = {kick = false, lang = "Mexican"},
    [12] = {kick = false, lang = "Chinese Simplified"},
}
for k, v in pairs(regionKick) do
    menu.toggle(menu.my_root(), "Kick ".. regionKick[k].lang, { "Kick".. regionKick[k].lang }, "Automatically kicks ".. regionKick[k].lang .. " people from your game.", function(toggle)
        regionKick[k].kick = toggle
    end)
end
local function generateFeatures(pid)
end
players.on_join(generateFeatures)
players.on_join(function(pid)
    util.yield(25000)
    while util.is_session_transition_active() do util.yield(100) end
    while not NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) do util.yield(100) end
    if pid ~= players.user() then
        local language = players.get_language(pid)
        if regionKick[language] and regionKick[language].kick then
            menu.trigger_commands("kick" .. players.get_name(pid))
        end
    end
end)
players.dispatch_on_join()
util.keep_running()
