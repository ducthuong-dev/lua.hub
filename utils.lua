-- Thư viện tiện ích chung
function Notify(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration or 5;
    })
end

function SafeTP(pos)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char:MoveTo(pos)
    end
end

function CreateESP(player, color)
    local billboard = Instance.new("BillboardGui", player.Character:WaitForChild("Head"))
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.AlwaysOnTop = true

    local name = Instance.new("TextLabel", billboard)
    name.Size = UDim2.new(1, 0, 1, 0)
    name.Text = player.Name
    name.TextColor3 = color or Color3.new(1, 1, 1)
    name.BackgroundTransparency = 1
end