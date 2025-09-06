-- Başlangıç bildirimi
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "VOLCANO HUB | ESG x COPILOT 💀",
        Text = "Local GUI sahneye çıkıyor...",
        Duration = 5
    })
end)

-- GUI oluştur
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VolcanoLocalGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Başlık
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 0.1, 0)
title.Position = UDim2.new(0.2, 0, 0.05, 0)
title.Text = "VOLCANO HUB | ESG x COPILOT 💀"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 85, 0)
title.Parent = screenGui

-- Tuş oluşturma fonksiyonu
local function createButton(text, yPos, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.6, 0, 0.08, 0)
    button.Position = UDim2.new(0.2, 0, yPos, 0)
    button.Text = text
    button.TextScaled = true
    button.Font = Enum.Font.Gotham
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = screenGui
    button.MouseButton1Click:Connect(callback)
end

-- Volcano işlevleri
createButton("Auto Farm", 0.2, function()
    print("Auto Farm aktif 💀")
    -- Buraya Auto Farm fonksiyonları eklenebilir
end)

createButton("Boss Teleport", 0.3, function()
    print("Boss Teleport aktif 💀")
    -- Boss konumuna teleport kodu buraya
end)

createButton("Fruit ESP", 0.4, function()
    print("Fruit ESP aktif 💀")
    -- ESP fonksiyonu buraya
end)

createButton("PvP Modu", 0.5, function()
    print("PvP Modu aktif 💀")
    -- Camlock, Skill Spam vs.
end)

createButton("FPS Boost", 0.6, function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
    print("FPS Boost uygulandı 💀")
end)
