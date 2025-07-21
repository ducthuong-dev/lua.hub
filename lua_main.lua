--[[ 
    LÚA.HUB – Chủ Chợ Lớn
    Author: Đức Thương Dev
    GitHub: https://github.com/ducthuong-dev/lua.hub
--]]

local utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/ducthuong-dev/lua.hub/main/lib/utils.lua"))()
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/ducthuong-dev/lua.hub/main/lib/ui.lua"))()

-- Danh sách GameID và Script tương ứng
local games = {
    ["2753915549"] = "games/blox_fruits.lua",            -- Blox Fruits
    ["10324347967"] = "games/strongest_battlegrounds.lua", -- The Strongest Battlegrounds
    ["13258801357"] = "games/grow_a_garden.lua",         -- Grow A Garden
    ["1537690962"] = "games/ink_game.lua",               -- Ink Game
    ["16034562004"] = "games/deal_rails.lua"             -- Deal Rails
}

local gameId = tostring(game.GameId)

-- Tự động tải script theo game hoặc mở tab chọn nếu không nhận diện được
if games[gameId] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ducthuong-dev/lua.hub/main/" .. games[gameId]))()
else
    ui.createGameSelect(games)
end