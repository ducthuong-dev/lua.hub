local Tab = Window:NewTab("TSB")
local Section = Tab:NewSection("Auto")
Section:NewToggle("Auto Combo", "Tự đánh combo", function(v)
    getgenv().AutoCombo = v
    while AutoCombo do
        task.wait()
        print("Đang combo...")
    end
end)
Section:NewToggle("Auto Parry", "Tự đỡ đòn", function(v)
    getgenv().AutoParry = v
end)