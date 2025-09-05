local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "COPİLOT HUB | Reborn by Esg 💀",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "CopilotHub"
})

local FarmTab = Window:MakeTab({Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PvPTab = Window:MakeTab({Name = "PvP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FruitTab = Window:MakeTab({Name = "Fruit", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MiscTab = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false})

FarmTab:AddButton({
    Name = "Auto Farm Level",
    Callback = function()
        print("Auto Farm Level çalışıyor")
    end
})

FarmTab:AddButton({
    Name = "Auto Farm Boss",
    Callback = function()
        print("Auto Farm Boss çalışıyor")
    end
})

FruitTab:AddButton({
    Name = "Fruit Sniper",
    Callback = function()
        print("Fruit Sniper aktif")
    end
})

FruitTab:AddButton({
    Name = "Fruit ESP",
    Callback = function()
        print("Fruit ESP aktif")
    end
})

PvPTab:AddButton({
    Name = "Camlock + Skill Spam",
    Callback = function()
        print("PvP sistemi aktif")
    end
})

PvPTab:AddButton({
    Name = "Anti Stun",
    Callback = function()
        print("Anti Stun aktif")
    end
})

MiscTab:AddButton({
    Name = "FPS Boost",
    Callback = function()
        print("FPS Boost aktif")
    end
})

MiscTab:AddButton({
    Name = "Anti-AFK",
    Callback = function()
        print("Anti-AFK aktif")
    end
})

OrionLib:Init()
