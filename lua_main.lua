--[[ 
    LÚA.HUB – Chủ Chợ Lớn
    Author: Đức Thương Dev
    GitHub: https://github.com/ducthuong-dev/lua.hub
--]]

local utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/ducthuong-dev/lua.hub/main/lib/utils.lua"))()
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/ducthuong-dev/lua.hub/main/lib/ui.lua"))()

-- Danh sách GameID và Script tương ứng
local games = {
    ["2753915549"] = "blox.lua",            -- Blox Fruits
    ["10324347967"] = "tsb.lua",            -- The Strongest Battlegrounds
    ["13258801357"] = "garden.lua",         -- Grow A Garden
    ["1537690962"] = "ink.lua",             -- Ink Game
    ["16034562004"] = "deal.lua"            -- Deal Rails
}

local gameId = tostring(game.GameId)

-- Tự động tải script theo game hoặc mở menu chọn nếu không nhận diện được
if games[gameId] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ducthuong-dev/lua.hub/main/" .. games[gameId]))()
else
    ui.createGameSelect(games)
end
