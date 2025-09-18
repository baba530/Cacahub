-- GUI Başlangıç
local gui = Instance.new("ScreenGui")
gui.Name = "CacahubGUI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local logoButton = Instance.new("TextButton", gui)
logoButton.Size = UDim2.new(0, 200, 0, 50)
logoButton.Position = UDim2.new(0.4, 0, 0.05, 0)
logoButton.Text = "Cacahub"
logoButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
logoButton.Font = Enum.Font.GothamBold
logoButton.TextScaled = true
logoButton.Draggable = true

local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 400, 0, 600)
menu.Position = UDim2.new(0.5, -200, 0.5, -300)
menu.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
menu.Visible = false
menu.Active = true
menu.Draggable = true

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Text = "Cacahub v1 Panel"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

logoButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- Buton Oluşturucu
local function createButton(text, posY)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(1, -20, 0.08, 0)
    btn.Position = UDim2.new(0, 10, posY, 0)
    btn.Text = text .. ": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    return btn
end

-- Auto Attack
local autoAttack = false
local btnAttack = createButton("Auto Attack", 0.12)
btnAttack.MouseButton1Click:Connect(function()
    autoAttack = not autoAttack
    btnAttack.Text = "Auto Attack: " .. (autoAttack and "ON" or "OFF")
end)
spawn(function()
    while true do
        if autoAttack then
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
end)

-- Speed Hack
local speedHack = false
local btnSpeed = createButton("Speed Hack", 0.22)
btnSpeed.MouseButton1Click:Connect(function()
    speedHack = not speedHack
    btnSpeed.Text = "Speed Hack: " .. (speedHack and "ON" or "OFF")
end)
spawn(function()
    while true do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = speedHack and 300 or 16
            end
        end)
        wait(0.5)
    end
end)

-- ESP Player
local espPlayer = false
local btnESP = createButton("Player ESP", 0.32)
btnESP.MouseButton1Click:Connect(function()
    espPlayer = not espPlayer
    btnESP.Text = "Player ESP: " .. (espPlayer and "ON" or "OFF")
end)
local espObjects = {}
local function clearESP()
    for _, v in pairs(espObjects) do if v and v.Parent then v:Destroy() end end
    table.clear(espObjects)
end
local function scanPlayers()
    clearESP()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local dist = math.floor((p.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
            local esp = Instance.new("BillboardGui", p.Character.HumanoidRootPart)
            esp.Size = UDim2.new(0, 120, 0, 30)
            esp.AlwaysOnTop = true
            esp.Adornee = p.Character.HumanoidRootPart
            local label = Instance.new("TextLabel", esp)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = p.Name .. " | " .. dist .. "m"
            label.TextColor3 = Color3.fromRGB(255, 0, 0)
            label.Font = Enum.Font.Gotham
            label.TextScaled = true
            table.insert(espObjects, esp)
        end
    end
end
spawn(function()
    while true do
        if espPlayer then scanPlayers() else clearESP() end
        wait(3)
    end
end)

-- ESP Fruit
local espFruit = false
local btnFruit = createButton("Fruit ESP", 0.42)
btnFruit.MouseButton1Click:Connect(function()
    espFruit = not espFruit
    btnFruit.Text = "Fruit ESP: " .. (espFruit and "ON" or "OFF")
end)
local fruitESPObjects = {}
local validFruits = {
    ["Bomb"] = true, ["Spike"] = true, ["Chop"] = true, ["Spring"] = true, ["Blade"] = true,
    ["Rocket"] = true, ["Spin"] = true, ["Kilo"] = true, ["Smoke"] = true, ["Sound"] = true,
    ["Creation"] = true, ["Ghost"] = true, ["Control"] = true, ["Pain"] = true, ["Portal"] = true,
    ["Love"] = true, ["Rubber"] = true, ["Quake"] = true, ["Shadow"] = true, ["Spirit"] = true,
    ["Gravity"] = true, ["Venom"] = true, ["Kitsune"] = true, ["Leopard"] = true, ["Eagle"] = true,
    ["Mammoth"] = true, ["T-Rex"] = true, ["Dragon"] = true, ["Dragon (Eastern Variant)"] = true,
    ["Dragon (Western Variant)"] = true, ["Flame"] = true, ["Ice"] = true, ["Sand"] = true,
    ["Dark"] = true, ["Light"] = true, ["Magma"] = true, ["Rumble"] = true, ["Blizzard"] = true,
    ["Gas"] = true, ["Lightning"] = true, ["Human: Buddha"] = true, ["Bird: Phoenix"] = true,
    ["Phoenix (Reworked)"] = true, ["Spider"] = true, ["Dough"] = true, ["Yeti"] = true
}
local function clearFruitESP()
    for _, v in pairs(fruitESPObjects) do if v and v.Parent then v:Destroy() end end
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
            esp.Adoresp.Adornee = obj.Handle
            local label = Instance.new("TextLabel", esp)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = obj.Name .. " | " .. dist .. "m"
            label.TextColor3 = Color3.fromRGB(0, 255, 0)
            label.Font = Enum.Font.Gotham
            label.TextScaled = true
            table.insert(fruitESPObjects, esp)
        end
    end
end

spawn(function()
    while true do
        if espFruit then scanFruits() else clearFruitESP() end
        wait(3)
    end
end)local aimbotEnabled = false
local btnAimbot = createButton("Aimbot Skill", 0.52)
btnAimbot.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    btnAimbot.Text = "Aimbot Skill: " .. (aimbotEnabled and "ON" or "OFF")
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
end)local masteryFarmEnabled = false
local btnMastery = createButton("Mastery Farm", 0.62)
btnMastery.MouseButton1Click:Connect(function()
    masteryFarmEnabled = not masteryFarmEnabled
    btnMastery.Text = "Mastery Farm: " .. (masteryFarmEnabled and "ON" or "OFF")
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
    end
end)local bossFarmEnabled = false
local btnBoss = createButton("Boss Farm", 0.72)
btnBoss.MouseButton1Click:Connect(function()
    bossFarmEnabled = not bossFarmEnabled
    btnBoss.Text = "Boss Farm: " .. (bossFarmEnabled and "ON" or "OFF")
end)

local bossNames = {
    ["Cake Queen"] = true, ["rip_indra"] = true, ["Don Swan"] = true,
    ["Cursed Captain"] = true, ["Stone"] = true, ["Island Empress"] = true,
    ["Kilo Admiral"] = true, ["Captain Elephant"] = true, ["Beautiful Pirate"] = true
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
local btnRaid = createButton("Auto Raid", 0.82)
btnRaid.MouseButton1Click:Connect(function()
    raidEnabled = not raidEnabled
    btnRaid.Text = "Auto Raid: " .. (raidEnabled and "ON" or "OFF")
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
end)local seaTeleportButton = createButton("Teleport Panel", 0.92)

local seaIslands = {
    ["Sea1"] = {"Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Fountain City"},
    ["Sea2"] = {"Kingdom of Rose", "Green Zone", "Cafe", "Usoap's Island", "Forgotten Island", "Hot and Cold", "Ice Castle", "Dark Arena"},
    ["Sea3"] = {"Castle on the Sea", "Hydra Island", "Floating Turtle", "Great Tree", "Haunted Castle", "Sea of Treats"}
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
    dropdownFrame.Position = UDim2.new(0, 10, 1.00, 0)
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
end)local statViewerButton = createButton("Show Stats", 1.42)

local statFrame = Instance.new("Frame", menu)
statFrame.Size = UDim2.new(1, -20, 0.3, 0)
statFrame.Position = UDim2.new(0, 10, 1.52, 0)
statFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
statFrame.Visible = false

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
