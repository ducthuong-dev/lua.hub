local Tab = Window:NewTab("Deal Rails")
local Section = Tab:NewSection("Tính năng")
Section:NewToggle("Auto Drive", "Tự lái xe", function(v)
    getgenv().AutoDrive = v
end)
Section:NewToggle("Anti Fall", "Chống ngã", function(v)
    getgenv().AntiFall = v
end)