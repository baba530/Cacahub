-- Auto Restart (Redz Hub tarzı queue_on_teleport)
local executor = syn or fluxus
local queueteleport = queue_on_teleport or (executor and executor.queue_on_teleport)

if type(queueteleport) == "function" then
    local SourceCode = "loadstring(game:HttpGet('https://raw.githubusercontent.com/baba530/Sansarsv2/main/sansarmod.lua'))()"
    pcall(queueteleport, SourceCode)
end

-- GUI Setup
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
menu.Size = UDim2.new(0, 400, 0, 300)
menu.Position = UDim2.new(0.5, -200, 0.5, -150)
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
end)

-- Auto Bones Farm
spawn(function()
    while true do
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
        wait(5)
    end
end)

-- ESP Player
spawn(function()
    while true do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("ESP") then
                    local esp = Instance.new("BillboardGui", player.Character.HumanoidRootPart)
                    esp.Name = "ESP"
                    esp.Size = UDim2.new(0, 100, 0, 30)
                    esp.AlwaysOnTop = true
                    local label = Instance.new("TextLabel", esp)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = "👤 " .. player.Name
                    label.TextColor3 = Color3.fromRGB(255, 0, 0)
                    label.Font = Enum.Font.GothamBold
                    label.TextScaled = true
                end
            end
        end
        wait(3)
    end
end)

-- ESP Fruit
spawn(function()
    while true do
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Tool") and obj:FindFirstChild("Handle") and not obj.Handle:FindFirstChild("FruitESP") then
                local esp = Instance.new("BillboardGui", obj.Handle)
                esp.Name = "FruitESP"
                esp.Size = UDim2.new(0, 100, 0, 30)
                esp.AlwaysOnTop = true
                local label = Instance.new("TextLabel", esp)
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = "🍍 " .. obj.Name
                label.TextColor3 = Color3.fromRGB(0, 255, 0)
                label.Font = Enum.Font.GothamBold
                label.TextScaled = true
            end
        end
        wait(5)
    end
end)

-- Aimbot Skill
spawn(function()
    while true do
        pcall(function()
            local target = nil
            local shortest = math.huge
            for _, mob in pairs(workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    local dist = (mob.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < shortest then
                        shortest = dist
                        target = mob
                    end
                end
            end
            if target then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(target.HumanoidRootPart.Position.X, target.HumanoidRootPart.Position.Y, 0, true, game, 0)
            end
        end)
        wait(1)
    end
end)
