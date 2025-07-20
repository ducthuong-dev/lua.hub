-- LÚA.HUB GUI + Game Detector by Đức Thương Dev - Chủ Chợ Lớn
-- Phiên bản sạch, hỗ trợ: Grow A Garden, The Strongest Battlegrounds, Blox Fruits, Ink Game

local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = UILib.CreateLib("LÚA.HUB - Chợ Lớn", "Ocean")

local gameName = "Unknown"
local gameId = game.PlaceId

-- Detect Game
if gameId == 13864661000 then
    gameName = "Grow A Garden"
elseif gameId == 111958650 then
    gameName = "The Strongest Battlegrounds"
elseif gameId == 2753915549 or gameId == 4442272183 then
    gameName = "Blox Fruits"
elseif gameId == 6839171747 then
    gameName = "Ink Game"
else
    gameName = "Chọn Game"
end

-- GUI Tabs
local MainTab = Window:NewTab(gameName)
local MainSection = MainTab:NewSection("Chức năng chính")

-- GROW A GARDEN
if gameName == "Grow A Garden" then
    MainSection:NewToggle("Auto Water", "Tự động tưới cây", function(state)
        getgenv().autoWater = state
        while getgenv().autoWater do
            -- Lệnh tưới cây ở đây
            wait(1)
        end
    end)

    MainSection:NewToggle("Auto Harvest", "Thu hoạch tự động", function(state)
        getgenv().autoHarvest = state
        while getgenv().autoHarvest do
            -- Lệnh thu hoạch ở đây
            wait(1)
        end
    end)
end

-- THE STRONGEST BATTLEGROUNDS
if gameName == "The Strongest Battlegrounds" then
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local targetPlayer = nil

    -- ESP
    MainSection:NewButton("ESP Players", "Hiện tất cả người chơi", function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = player.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.new(1,1,1)
                highlight.Parent = player.Character
            end
        end
    end)

    -- Auto Combo
    MainSection:NewToggle("Auto Combo", "Đánh liên hoàn", function(state)
        getgenv().autoCombo = state
        while getgenv().autoCombo do
            -- Gửi keypress 1 hoặc mô phỏng combo
            keypress(0x31) -- phím 1
            wait(0.2)
            keypress(0x32) -- phím 2
            wait(0.2)
        end
    end)

    -- Bay
    MainSection:NewToggle("Fly", "Bay tự do", function(state)
        getgenv().flying = state
        local character = LocalPlayer.Character
        local root = character:WaitForChild("HumanoidRootPart")

        while getgenv().flying do
            root.Velocity = Vector3.new(0, 100, 0)
            wait(0.1)
        end
    end)

    -- Xuyên tường
    MainSection:NewButton("Xuyên Tường", "Không va chạm tường", function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end
        end
    end)

    -- Miễn Choáng
    MainSection:NewToggle("Anti Stun", "Không bị choáng", function(state)
        getgenv().antiStun = state
        while getgenv().antiStun do
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BoolValue") and v.Name == "Stunned" then
                    v:Destroy()
                end
            end
            wait(0.2)
        end
    end)

    -- Ghim người và theo
    MainSection:NewTextbox("Tên người", "Ghim để dí theo", function(name)
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Name:lower():find(name:lower()) then
                targetPlayer = plr
                break
            end
        end
    end)

    MainSection:NewToggle("Tự dí mục tiêu", "Tự chạy theo người đã ghim", function(state)
        getgenv().followTarget = state
        while getgenv().followTarget do
            if targetPlayer and targetPlayer.Character and LocalPlayer.Character then
                local myHumanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                local targetPos = targetPlayer.Character:FindFirstChild("HumanoidRootPart").Position
                myHumanoid:MoveTo(targetPos + Vector3.new(0,0,2))
            end
            wait(0.2)
        end
    end)
end

-- BLOX FRUITS
if gameName == "Blox Fruits" then
    MainSection:NewToggle("Auto Farm", "Tự farm quái và boss", function(state)
        getgenv().autoFarm = state
        while getgenv().autoFarm do
            -- Farm code ở đây
            wait(1)
        end
    end)

    MainSection:NewButton("Teleport to Island", "Dịch chuyển nhanh", function()
        -- Teleport logic ở đây
    end)
end

-- INK GAME
if gameName == "Ink Game" then
    MainSection:NewToggle("Auto Green Light", "Tự di chuyển khi đèn xanh", function(state)
        getgenv().autoGreen = state
        while getgenv().autoGreen do
            -- Code kiểm tra đèn và tự di chuyển
            wait(0.5)
        end
    end)

    MainSection:NewToggle("Auto Win", "Tự động về đích", function(state)
        getgenv().autoWin = state
        while getgenv().autoWin do
            -- Code tự đi thẳng về đích
            wait(1)
        end
    end)
end

-- CHUNG
MainSection:NewButton("FPS Boost", "Tăng tốc độ khung hình", function()
    -- Dọn rác scene để tăng FPS
end)

MainSection:NewLabel("Made by Đức Thương - Chủ Chợ Lớn")
