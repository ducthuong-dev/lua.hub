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
    local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local CombatEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Combat")

local function isPlayerValid(target)
    return target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 and target:FindFirstChild("HumanoidRootPart")
end

local function getNearestTarget()
    local closest, distance = nil, 100
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isPlayerValid(player.Character) then
            local mag = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
            if mag < distance then
                closest = player
                distance = mag
            end
        end
    end
    return closest
end

local comboKey = Enum.KeyCode.Z -- anh đổi tuỳ ý
local doingCombo = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == comboKey and not doingCombo then
        doingCombo = true
        local target = getNearestTarget()
        if target then
            for i = 1, 6 do
                CombatEvent:FireServer("Light", true) -- combo nhẹ
                task.wait(0.15)
            end
            CombatEvent:FireServer("Heavy", true) -- đấm kết thúc
        end
        doingCombo = false
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
        
            -- LÚA.HUB – Blox Fruits [Đức Thương Dev – Chủ Chợ Lớn]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local BloxFruits = {}
local selectedIsland, selectedBoss, selectedStats = "", "", "Melee"

-- GUI
local UI = KavoUiLibrary.CreateLib("LÚA.HUB | Blox Fruits", "Midnight")
local Main = UI:NewTab("Auto Farm")
local ESP = UI:NewTab("ESP")
local Tele = UI:NewTab("Teleport")
local Misc = UI:NewTab("Misc")

-- Auto Farm Level
Main:NewToggle("Auto Farm Level", "Tự đánh quái theo cấp", function(state)
    BloxFruits.autoFarmLevel = state
end)

Main:NewToggle("Auto Boss", "Tự đánh boss gần", function(state)
    BloxFruits.autoBoss = state
end)

Main:NewToggle("Auto Quest", "Nhận nhiệm vụ tự động", function(state)
    BloxFruits.autoQuest = state
end)

-- Auto Skill, Stats
Main:NewToggle("Auto Ken", "Tự bật Ken", function(state)
    BloxFruits.autoKen = state
end)

Main:NewToggle("Auto Haki", "Tự bật Haki", function(state)
    BloxFruits.autoHaki = state
end)

Main:NewDropdown("Auto Stats", "Tự nâng điểm", {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}, function(value)
    selectedStats = value
end)

Main:NewToggle("Auto Stats", "Bỏ điểm tự động", function(state)
    BloxFruits.autoStats = state
end)

-- Fruit
Misc:NewToggle("Auto Store Fruit", "Lưu trái ác quỷ", function(state)
    BloxFruits.autoStoreFruit = state
end)

Misc:NewToggle("Auto Eat Fruit", "Ăn trái tự động", function(state)
    BloxFruits.autoEat = state
end)

Misc:NewToggle("Random Fruit", "Quay trái random", function(state)
    BloxFruits.randomFruit = state
end)

-- ESP
ESP:NewToggle("ESP Player", "Hiển thị người chơi", function(state)
    BloxFruits.espPlayer = state
end)

ESP:NewToggle("ESP Boss", "Hiển thị boss", function(state)
    BloxFruits.espBoss = state
end)

ESP:NewToggle("ESP Fruit", "Hiển thị trái rơi", function(state)
    BloxFruits.espFruit = state
end)

-- Teleport
Tele:NewDropdown("Đảo", "Chọn đảo", {"Jungle", "Desert", "Sky Island", "Snow Island", "Hot Island"}, function(opt)
    selectedIsland = opt
end)

Tele:NewButton("Teleport đến đảo", "Dịch chuyển ngay", function()
    BloxFruits:TeleportToIsland(selectedIsland)
end)

-- Hàm hoạt động
function BloxFruits:TeleportToIsland(name)
    local island = Workspace:FindFirstChild(name)
    if island then
        LocalPlayer.Character.HumanoidRootPart.CFrame = island.Position
    end
end

RunService.RenderStepped:Connect(function()
    pcall(function()
        if BloxFruits.autoFarmLevel then
            -- Hàm tìm quái và đánh (viết theo cấp)
        end
        if BloxFruits.autoBoss then
            -- Tìm boss gần, dịch và đánh
        end
        if BloxFruits.autoQuest then
            -- Lấy quest tự động
        end
        if BloxFruits.autoKen then
            -- Bật Ken nếu tắt
        end
        if BloxFruits.autoHaki then
            -- Bật Haki nếu tắt
        end
        if BloxFruits.autoStats then
            -- Nâng điểm vào selectedStats
        end
        if BloxFruits.randomFruit then
            -- Gọi hàm quay trái
        end
    end)
end)

return BloxFruits

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

-- 🚂 Deal Rails – Auto lái, vào ghế, anti ngã, ESP xe | By Đức Thương Dev – Chủ Chợ Lớn

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ⚙️ AUTO LÁI XE
getgenv().AutoDrive = true
spawn(function()
    while getgenv().AutoDrive do
        for _,v in pairs(Workspace:GetDescendants()) do
            if v:IsA("VehicleSeat") and v.Occupant == nil then
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                wait(0.2)
                v.Throttle = 1
            end
        end
        wait(1)
    end
end)

-- 🪑 AUTO TELEPORT VÀO GHẾ
getgenv().AutoSeat = true
spawn(function()
    while getgenv().AutoSeat do
        for _,v in pairs(Workspace:GetDescendants()) do
            if v:IsA("VehicleSeat") and v:FindFirstChild("SeatWeld") == nil then
                LocalPlayer.Character:MoveTo(v.Position)
                wait(0.5)
                break
            end
        end
        wait(3)
    end
end)

-- 💥 CHỐNG NGÃ / RESET NHANH
getgenv().AntiFall = true
spawn(function()
    while getgenv().AntiFall do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if LocalPlayer.Character.HumanoidRootPart.Velocity.Y < -100 then
                    LocalPlayer.Character:BreakJoints() -- Tự reset
                end
            end
        end)
        wait(1)
    end
end)

-- 🔍 ESP XE
getgenv().EnableESP = true
spawn(function()
    while getgenv().EnableESP do
        for _,v in pairs(Workspace:GetDescendants()) do
            if v:IsA("VehicleSeat") and not v:FindFirstChild("ESP") then
                local billboard = Instance.new("BillboardGui", v)
                billboard.Name = "ESP"
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 100, 0, 40)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local label = Instance.new("TextLabel", billboard)
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Text = "🚂 DEAL RAILS"
                label.TextColor3 = Color3.new(1, 1, 0)
                label.BackgroundTransparency = 1
                label.TextScaled = true
            end
        end
        wait(5)
    end
end)

-- CHUNG
MainSection:NewButton("FPS Boost", "Tăng tốc độ khung hình", function()
    -- Dọn rác scene để tăng FPS
end)

MainSection:NewLabel("Made by Đức Thương - Chủ Chợ Lớn")
