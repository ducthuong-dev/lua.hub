local Tab = Window:NewTab("Grow A Garden")
local Section = Tab:NewSection("Tính năng")
Section:NewToggle("Auto Grow", "Tự trồng cây", function(v)
    getgenv().AutoGrow = v
    while AutoGrow do
        task.wait()
        print("Tự trồng cây...")
    end
end)