print("Kod çağrıldı 💀")

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "COPILOT HUB V7 | ESG x COPILOT 💀",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "CopilotTest"
})

Window:MakeTab({
    Name = "Test Tab",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
}):AddLabel("COPILOT HUB V7 çalışıyor 💀")

OrionLib:Init()
