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
menu.Size = UDim2.new(0, 400, 0, 600)
menu.Position = UDim2.new(0.5, -200, 0.5, -300)
menu.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
menu.BackgroundTransparency = 0.25
menu.Visible = false
menu.Active = true
menu.Draggable = true

local UICornerMenu = Instance.new("UICorner", menu)
UICornerMenu.CornerRadius = UDim.new(0, 18)

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Text = "SANSARSV2xFARM PANEL"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

logoButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)local raidEnabled = false

local raidButton = Instance.new("TextButton", menu)
raidButton.Size = UDim2.new(1, -20, 0.08, 0)
raidButton.Position = UDim2.new(0, 10, 0.92, 0)
raidButton.Text = "Auto Raid: OFF"
raidButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
raidButton.TextColor3 = Color3.fromRGB(255,255,255)
raidButton.Font = Enum.Font.Gotham
raidButton.TextScaled = true

raidButton.MouseButton1Click:Connect(function()
    raidEnabled = not raidEnabled
    raidButton.Text = "Auto Raid: " .. (raidEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if raidEnabled then
            pcall(function()
                local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
                remote:InvokeServer("BuyChip", "Random")
                wait(1)
                remote:InvokeServer("ActivateChip")
            end)
        end
        wait(10)
    end
end)local seaTeleportButton = Instance.new("TextButton", menu)
seaTeleportButton.Size = UDim2.new(1, -20, 0.08, 0)
seaTeleportButton.Position = UDim2.new(0, 10, 1.32, 0)
seaTeleportButton.Text = "Teleport Panel"
seaTeleportButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
seaTeleportButton.TextColor3 = Color3.fromRGB(255,255,255)
seaTeleportButton.Font = Enum.Font.Gotham
seaTeleportButton.TextScaled = true

local seaIslands = {
    ["Sea1"] = {
        "Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village",
        "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village",
        "Underwater City", "Fountain City"
    },
    ["Sea2"] = {
        "Kingdom of Rose", "Green Zone", "Cafe", "Usoap's Island", "Forgotten Island",
        "Hot and Cold", "Ice Castle", "Dark Arena"
    },
    ["Sea3"] = {
        "Castle on the Sea", "Hydra Island", "Floating Turtle", "Great Tree",
        "Haunted Castle", "Sea of Treats"
    }
}

local function getCurrentSea()
    local placeId = game.PlaceId
    if placeId == 2753915549 then return "Sea1"
    elseif placeId == 4442272183 then return "Sea2"
    elseif placeId == 7449423635 then return "Sea3"
    else return "Unknown"
    end
end

seaTeleportButton.MouseButton1Click:Connect(function()
    local currentSea = getCurrentSea()
    local islands = seaIslands[currentSea]
    if not islands then return end

    local dropdownFrame = Instance.new("Frame", menu)
    dropdownFrame.Size = UDim2.new(1, -20, 0.4, 0)
    dropdownFrame.Position = UDim2.new(0, 10, 1.40, 0)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    dropdownFrame.ZIndex = 10

    local UIList = Instance.new("UIListLayout", dropdownFrame)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder

    for _, island in pairs(islands) do
        local option = Instance.new("TextButton", dropdownFrame)
        option.Size = UDim2.new(1, 0, 0, 25)
        option.Text = island
        option.BackgroundColor3 = Color3.fromRGB(45,45,45)
        option.TextColor3 = Color3.fromRGB(255,255,255)
        option.Font = Enum.Font.Gotham
        option.TextScaled = true

        option.MouseButton1Click:Connect(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Travel", island)
            dropdownFrame:Destroy()
        end)
    endlocal autoAttackEnabled = false

local attackButton = Instance.new("TextButton", menu)
attackButton.Size = UDim2.new(1, -20, 0.08, 0)
attackButton.Position = UDim2.new(0, 10, 0.22, 0)
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
    endlocal aimbotEnabled = false

local aimbotButton = Instance.new("TextButton", menu)
aimbotButton.Size = UDim2.new(1, -20, 0.08, 0)
aimbotButton.Position = UDim2.new(0, 10, 0.32, 0)
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
speedButton.Size = UDim2.new(1, -20, 0.08, 0)
speedButton.Position = UDim2.new(0, 10, 0.42, 0)
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
playerESPButton.Size = UDim2.new(1, -20, 0.08, 0)
playerESPButton.Position = UDim2.new(0, 10, 0.52, 0)
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
fruitESPButton.Size = UDim2.new(1, -20, 0.08, 0)
fruitESPButton.Position = UDim2.new(0, 10, 0.62, 0)
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
    endlocal masteryFarmEnabled = false

local masteryButton = Instance.new("TextButton", menu)
masteryButton.Size = UDim2.new(1, -20, 0.08, 0)
masteryButton.Position = UDim2.new(0, 10, 0.72, 0)
masteryButton.Text = "Mastery Farm: OFF"
masteryButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
masteryButton.TextColor3 = Color3.fromRGB(255,255,255)
masteryButton.Font = Enum.Font.Gotham
masteryButton.TextScaled = true

masteryButton.MouseButton1Click:Connect(function()
    masteryFarmEnabled = not masteryFarmEnabled
    masteryButton.Text = "Mastery Farm: " .. (masteryFarmEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if masteryFarmEnabled then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    for _, mob in pairs(workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnableObservationHaki")
                            tool:Activate()
                        end
                    end
                end
            end)
        end
        wait(1.5)
    endlocal bossFarmEnabled = false

local bossButton = Instance.new("TextButton", menu)
bossButton.Size = UDim2.new(1, -20, 0.08, 0)
bossButton.Position = UDim2.new(0, 10, 0.82, 0)
bossButton.Text = "Boss Farm: OFF"
bossButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
bossButton.TextColor3 = Color3.fromRGB(255,255,255)
bossButton.Font = Enum.Font.Gotham
bossButton.TextScaled = true

bossButton.MouseButton1Click:Connect(function()
    bossFarmEnabled = not bossFarmEnabled
    bossButton.Text = "Boss Farm: " .. (bossFarmEnabled and "ON" or "OFF")
end)

local bossNames = {
    ["Cake Queen"] = true,
    ["rip_indra"] = true,
    ["Don Swan"] = true,
    ["Cursed Captain"] = true,
    ["Stone"] = true,
    ["Island Empress"] = true,
    ["Kilo Admiral"] = true,
    ["Captain Elephant"] = true,
    ["Beautiful Pirate"] = true
}

spawn(function()
    while true do
        if bossFarmEnabled then
            pcall(function()
                for _, boss in pairs(workspace.Enemies:GetChildren()) do
                    if bossNames[boss.Name] and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and boss:FindFirstChild("HumanoidRootPart") then
                        local char = game.Players.LocalPlayer.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnableObservationHaki")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Attack", boss)
                        end
                    end
                end
            end)
        end
        wait(2)
    end
end)local raidEnabled = false

local raidButton = Instance.new("TextButton", menu)
raidButton.Size = UDim2.new(1, -20, 0.08, 0)
raidButton.Position = UDim2.new(0, 10, 0.92, 0)
raidButton.Text = "Auto Raid: OFF"
raidButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
raidButton.TextColor3 = Color3.fromRGB(255,255,255)
raidButton.Font = Enum.Font.Gotham
raidButton.TextScaled = true

raidButton.MouseButton1Click:Connect(function()
    raidEnabled = not raidEnabled
    raidButton.Text = "Auto Raid: " .. (raidEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if raidEnabled then
            pcall(function()
                local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
                remote:InvokeServer("BuyChip", "Random")
                wait(1)
                remote:InvokeServer("ActivateChip")
            end)
        end
        wait(10)
    end
end)local seaTeleportButton = Instance.new("TextButton", menu)
seaTeleportButton.Size = UDim2.new(1, -20, 0.08, 0)
seaTeleportButton.Position = UDim2.new(0, 10, 1.02, 0)
seaTeleportButton.Text = "Teleport Panel"
seaTeleportButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
seaTeleportButton.TextColor3 = Color3.fromRGB(255,255,255)
seaTeleportButton.Font = Enum.Font.Gotham
seaTeleportButton.TextScaled = true

local seaIslands = {
    ["Sea1"] = {
        "Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village",
        "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village",
        "Underwater City", "Fountain City"
    },
    ["Sea2"] = {
        "Kingdom of Rose", "Green Zone", "Cafe", "Usoap's Island", "Forgotten Island",
        "Hot and Cold", "Ice Castle", "Dark Arena"
    },
    ["Sea3"] = {
        "Castle on the Sea", "Hydra Island", "Floating Turtle", "Great Tree",
        "Haunted Castle", "Sea of Treats"
    }
}

local function getCurrentSea()
    local placeId = game.PlaceId
    if placeId == 2753915549 then return "Sea1"
    elseif placeId == 4442272183 then return "Sea2"
    elseif placeId == 7449423635 then return "Sea3"
    else return "Unknown"
    end
end

seaTeleportButton.MouseButton1Click:Connect(function()
    local currentSea = getCurrentSea()
    local islands = seaIslands[currentSea]
    if not islands then return end

    local dropdownFrame = Instance.new("Frame", menu)
    dropdownFrame.Size = UDim2.new(1, -20, 0.4, 0)
    dropdownFrame.Position = UDim2.new(0, 10, 1.10, 0)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    dropdownFrame.ZIndex = 10

    local UIList = Instance.new("UIListLayout", dropdownFrame)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder

    for _, island in pairs(islands) do
        local option = Instance.new("TextButton", dropdownFrame)
        option.Size = UDim2.new(1, 0, 0, 25)
        option.Text = island
        option.BackgroundColor3 = Color3.fromRGB(45,45,45)
        option.TextColor3 = Color3.fromRGB(255,255,255)
        option.Font = Enum.Font.Gotham
        option.TextScaled = true

        option.MouseButton1Click:Connect(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Travel", island)
            dropdownFrame:Destroy()
        end)
    end
end)local antiAFKEnabled = false

local afkButton = Instance.new("TextButton", menu)
afkButton.Size = UDim2.new(1, -20, 0.08, 0)
afkButton.Position = UDim2.new(0, 10, 1.22, 0)
afkButton.Text = "Anti AFK: OFF"
afkButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
afkButton.TextColor3 = Color3.fromRGB(255,255,255)
afkButton.Font = Enum.Font.Gotham
afkButton.TextScaled = true

afkButton.MouseButton1Click:Connect(function()
    antiAFKEnabled = not antiAFKEnabled
    afkButton.Text = "Anti AFK: " .. (antiAFKEnabled and "ON" or "OFF")
end)

spawn(function()
    while true do
        if antiAFKEnabled then
            pcall(function()
                local virtualUser = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:Connect(function()
                    virtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    wait(1)
                    virtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            end)
        end
        wait(10)
    end
end)local statViewerButton = Instance.new("TextButton", menu)
statViewerButton.Size = UDim2.new(1, -20, 0.08, 0)
statViewerButton.Position = UDim2.new(0, 10, 1.32, 0)
statViewerButton.Text = "Show Stats"
statViewerButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
statViewerButton.TextColor3 = Color3.fromRGB(255,255,255)
statViewerButton.Font = Enum.Font.Gotham
statViewerButton.TextScaled = true

local statFrame = Instance.new("Frame", menu)
statFrame.Size = UDim2.new(1, -20, 0.3, 0)
statFrame.Position = UDim2.new(0, 10, 1.42, 0)
statFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
statFrame.Visible = false

local UICornerStat = Instance.new("UICorner", statFrame)
UICornerStat.CornerRadius = UDim.new(0, 10)

local statLabel = Instance.new("TextLabel", statFrame)
statLabel.Size = UDim2.new(1, 0, 1, 0)
statLabel.BackgroundTransparency = 1
statLabel.TextColor3 = Color3.fromRGB(255,255,255)
statLabel.Font = Enum.Font.Gotham
statLabel.TextScaled = true
statLabel.Text = "Loading..."

statViewerButton.MouseButton1Click:Connect(function()
    statFrame.Visible = not statFrame.Visible
end)

spawn(function()
    while true do
        pcall(function()
            local player = game.Players.LocalPlayer
            local fruit = player.Character:FindFirstChildOfClass("Tool")
            local bounty = player.leaderstats:FindFirstChild("Bounty") and player.leaderstats.Bounty.Value or "N/A"
            local level = player.leaderstats:FindFirstChild("Level") and player.leaderstats.Level.Value or "N/A"
            local haki = player:FindFirstChild("Data") and player.Data:FindFirstChild("Observation") and player.Data.Observation.Value or "Unknown"
            local fruitName = fruit and fruit.Name or "None"

            statLabel.Text = "Level: " .. level ..
                            "\nBounty: " .. bounty ..
                            "\nFruit: " .. fruitName ..
                            "\nObservation Haki: " .. haki
        end)
        wait(3)
    end
end)
end)
end)
end)
end)
end)
