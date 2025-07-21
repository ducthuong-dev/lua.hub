local Tab = Window:NewTab("Blox Fruits")
local Section = Tab:NewSection("Auto Farm")
Section:NewToggle("Auto Farm", "Farm tự động", function(v)
    getgenv().AutoFarm = v
    while AutoFarm do
        task.wait()
        print("Đang farm...")
    end
end)
Section:NewButton("Teleport", "Dịch chuyển", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
end)