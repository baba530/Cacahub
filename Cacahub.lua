local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CopilotGui"
screenGui.Parent = playerGui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.5, 0, 0.1, 0)
label.Position = UDim2.new(0.25, 0, 0.45, 0)
label.Text = "COPILOT HUB V7 çalışıyor 💀"
label.TextScaled = true
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Parent = screenGui
