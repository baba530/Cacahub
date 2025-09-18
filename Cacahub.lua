local gui = Instance.new("ScreenGui", game.CoreGui)

local logoButton = Instance.new("TextButton", gui)
logoButton.Size = UDim2.new(0, 200, 0, 50)
logoButton.Position = UDim2.new(0.85, 0, 0.15, 0)
logoButton.Text = "SANSARSV2xFARM"
logoButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logoButton.BackgroundTransparency = 0.3
logoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
logoButton.Font = Enum.Font.GothamBold
logoButton.TextScaled = true
logoButton.Draggable = true

local UICornerLogo = Instance.new("UICorner", logoButton)
UICornerLogo.CornerRadius = UDim.new(0, 12)

local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 400, 0, 320)
menu.Position = UDim2.new(0.5, -200, 0.5, -160)
menu.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
menu.BackgroundTransparency = 0.25
menu.Visible = false
menu.Active = true
menu.Draggable = true

local UICornerMenu = Instance.new("UICorner", menu)
UICornerMenu.CornerRadius = UDim.new(0, 18)

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Text = "SANSARSV2xFARM PANEL"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

logoButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)local autoBonesEnabled = false

local bonesButton = Instance.new("TextButton", menu)
bonesButton.Size = UDim2.new(1, -20, 0.12, 0)
bonesButton.Position = UDim2.new(0, 10, 0.2, 0)
bonesButton.Text = "Auto Bones Farm: OFF"
bonesButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
bonesButton.TextColor3 = Color3.fromRGB(255,255,255)
bonesButton.Font = Enum.Font.Gotham
bonesButton.TextScaled = true

bonesButton.MouseButton1Click:Connect(function()
    autoBonesEnabled = not autoBonesEnabled
    bonesButton.Text = "Auto Bones Farm: " .. (autoBonesEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if autoBonesEnabled then
            pcall(function()
                local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
                remote:InvokeServer("TravelHauntedCastle")
                wait(2)
                for _, mob in pairs(workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
                        remote:InvokeServer("EnableObservationHaki")
                    end
                end
            end)
        end
        wait(5)
    end
end)local autoAttackEnabled = false

local attackButton = Instance.new("TextButton", menu)
attackButton.Size = UDim2.new(1, -20, 0.12, 0)
attackButton.Position = UDim2.new(0, 10, 0.35, 0)
attackButton.Text = "Auto Attack: OFF"
attackButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
attackButton.TextColor3 = Color3.fromRGB(255,255,255)
attackButton.Font = Enum.Font.Gotham
attackButton.TextScaled = true

attackButton.MouseButton1Click:Connect(function()
    autoAttackEnabled = not autoAttackEnabled
    attackButton.Text = "Auto Attack: " .. (autoAttackEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if autoAttackEnabled then
            pcall(function()
                for _, mob in pairs(workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                        local char = game.Players.LocalPlayer.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnableObservationHaki")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Attack", mob)
                        end
                    end
                end
            end)
        end
        wait(1)
    end
end)local aimbotEnabled = false

local aimbotButton = Instance.new("TextButton", menu)
aimbotButton.Size = UDim2.new(1, -20, 0.12, 0)
aimbotButton.Position = UDim2.new(0, 10, 0.5, 0)
aimbotButton.Text = "Aimbot Skill: OFF"
aimbotButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
aimbotButton.TextColor3 = Color3.fromRGB(255,255,255)
aimbotButton.Font = Enum.Font.Gotham
aimbotButton.TextScaled = true

aimbotButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    aimbotButton.Text = "Aimbot Skill: " .. (aimbotEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if aimbotEnabled then
            pcall(function()
                local closest, dist = nil, math.huge
                for _, mob in pairs(workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        local d = (mob.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if d < dist then
                            closest = mob
                            dist = d
                        end
                    end
                end
                if closest then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnableObservationHaki")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SkillAim", closest.HumanoidRootPart.Position)
                end
            end)
        end
        wait(1)
    end
end)local speedEnabled = false
local defaultSpeed = 16
local boostedSpeed = 300 -- Redz Hub standardı

local speedButton = Instance.new("TextButton", menu)
speedButton.Size = UDim2.new(1, -20, 0.12, 0)
speedButton.Position = UDim2.new(0, 10, 0.65, 0)
speedButton.Text = "Speed Hack: OFF"
speedButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedButton.TextColor3 = Color3.fromRGB(255,255,255)
speedButton.Font = Enum.Font.Gotham
speedButton.TextScaled = true

speedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedButton.Text = "Speed Hack: " .. (speedEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = speedEnabled and boostedSpeed or defaultSpeed
            end
        end)
        wait(0.5)
    endlocal playerESPEnabled = false
local playerESPObjects = {}

local playerESPButton = Instance.new("TextButton", menu)
playerESPButton.Size = UDim2.new(1, -20, 0.12, 0)
playerESPButton.Position = UDim2.new(0, 10, 0.8, 0)
playerESPButton.Text = "Player ESP: OFF"
playerESPButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
playerESPButton.TextColor3 = Color3.fromRGB(255,255,255)
playerESPButton.Font = Enum.Font.Gotham
playerESPButton.TextScaled = true

playerESPButton.MouseButton1Click:Connect(function()
    playerESPEnabled = not playerESPEnabled
    playerESPButton.Text = "Player ESP: " .. (playerESPEnabled and "ON" or "OFF")
end)

local function clearPlayerESP()
    for _, v in pairs(playerESPObjects) do
        if v and v.Parent then v:Destroy() end
    end
    table.clear(playerESPObjects)
end

local function scanPlayers()
    clearPlayerESP()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = math.floor((player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
            local esp = Instance.new("BillboardGui", player.Character.HumanoidRootPart)
            esp.Size = UDim2.new(0, 120, 0, 30)
            esp.AlwaysOnTop = true
            esp.Adornee = player.Character.HumanoidRootPart
            esp.Name = "ESP"

            local label = Instance.new("TextLabel", esp)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = player.Name .. " | Distance: " .. dist
            label.TextColor3 = Color3.fromRGB(255, 0, 0)
            label.Font = Enum.Font.Gotham
            label.TextScaled = true

            table.insert(playerESPObjects, esp)
        end
    end
end

spawn(function()
    while true do
        if playerESPEnabled then scanPlayers() else clearPlayerESP() end
        wait(3)
    end
end)local fruitESPEnabled = false
local fruitESPObjects = {}

local fruitESPButton = Instance.new("TextButton", menu)
fruitESPButton.Size = UDim2.new(1, -20, 0.12, 0)
fruitESPButton.Position = UDim2.new(0, 10, 0.93, 0)
fruitESPButton.Text = "Fruit ESP: OFF"
fruitESPButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
fruitESPButton.TextColor3 = Color3.fromRGB(255,255,255)
fruitESPButton.Font = Enum.Font.Gotham
fruitESPButton.TextScaled = true

fruitESPButton.MouseButton1Click:Connect(function()
    fruitESPEnabled = not fruitESPEnabled
    fruitESPButton.Text = "Fruit ESP: " .. (fruitESPEnabled and "ON" or "OFF")
end)

local validFruits = {
    -- Natural
    ["Bomb"] = true, ["Spike"] = true, ["Chop"] = true, ["Spring"] = true, ["Blade"] = true,
    ["Rocket"] = true, ["Spin"] = true, ["Kilo"] = true, ["Smoke"] = true, ["Sound"] = true,
    ["Creation"] = true, ["Ghost"] = true, ["Control"] = true, ["Pain"] = true, ["Portal"] = true,
    ["Love"] = true, ["Rubber"] = true, ["Quake"] = true, ["Shadow"] = true, ["Spirit"] = true,
    ["Gravity"] = true, ["Venom"] = true, ["Kitsune"] = true, ["Leopard"] = true, ["Eagle"] = true,
    ["Mammoth"] = true, ["T-Rex"] = true, ["Dragon"] = true, ["Dragon (Eastern Variant)"] = true,
    ["Dragon (Western Variant)"] = true,

    -- Elemental
    ["Flame"] = true, ["Ice"] = true, ["Sand"] = true, ["Dark"] = true, ["Light"] = true,
    ["Magma"] = true, ["Rumble"] = true, ["Blizzard"] = true, ["Gas"] = true, ["Lightning"] = true,

    -- Beast
    ["Human: Buddha"] = true, ["Bird: Phoenix"] = true, ["Phoenix (Reworked)"] = true,
    ["Spider"] = true, ["Dough"] = true, ["Yeti"] = true
}

local function clearFruitESP()
    for _, v in pairs(fruitESPObjects) do
        if v and v.Parent then v:Destroy() end
    end
    table.clear(fruitESPObjects)
end

local function scanFruits()
    clearFruitESP()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and validFruits[obj.Name] and obj:FindFirstChild("Handle") then
            local dist = math.floor((obj.Handle.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
            local esp = Instance.new("BillboardGui", obj.Handle)
            esp.Size = UDim2.new(0, 120, 0, 30)
            esp.AlwaysOnTop = true
            esp.Adornee = obj.Handle
            esp.Name = "FruitESP"

            local label = Instance.new("TextLabel", esp)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = obj.Name .. " | Distance: " .. dist
            label.TextColor3 = Color3.fromRGB(0, 255, 0)
            label.Font = Enum.Font.Gotham
            label.TextScaled = true

            table.insert(fruitESPObjects, esp)
        end
    end
end

spawn(function()
    while true do
        if fruitESPEnabled then scanFruits() else clearFruitESP() end
        wait(3)
    end
end)
end)
