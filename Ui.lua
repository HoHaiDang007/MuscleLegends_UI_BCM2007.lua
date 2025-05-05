-- dangdepzai UI loader
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MLRainbowUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 380, 0, 320)
Main.Position = UDim2.new(0.5, -190, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(255, 210, 240)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- UI Corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Main

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "Muscle Legends Rainbow V3 - dangdepzai"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(255, 180, 220)
Title.TextColor3 = Color3.fromRGB(60, 0, 60)
Title.Font = Enum.Font.FredokaOne
Title.TextScaled = true
Title.Parent = Main

-- Cute Icon
local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 40, 0, 40)
Icon.Position = UDim2.new(0, -10, 0, -10)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://17092691145" -- bcm2000 mèo cute
Icon.Parent = Main

-- Tabs Folder
local Tabs = Instance.new("Folder", Main)
Tabs.Name = "Tabs"

local menuList = {
    "Auto Strength",
    "Auto Kill",
    "Auto Rebirth",
    "Auto Pet",
    "Auto Aura",
    "Stats Control",
    "Anti AFK"
}

for i, name in ipairs(menuList) do
    local Btn = Instance.new("TextButton")
    Btn.Name = name:gsub(" ", "") .. "Btn"
    Btn.Size = UDim2.new(0, 160, 0, 28)
    Btn.Position = UDim2.new(0, 10, 0, 40 + ((i - 1) * 35))
    Btn.BackgroundColor3 = Color3.fromRGB(255, 170, 200)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(40, 0, 40)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 14
    Btn.Parent = Main

    -- UICorner cho nút
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = Btn

    -- Toggle state
    local enabled = false

    Btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        Btn.BackgroundColor3 = enabled and Color3.fromRGB(140, 255, 160) or Color3.fromRGB(255, 170, 200)
        Btn.Text = name .. ": " .. (enabled and "ON" or "OFF")
        -- Gửi tín hiệu ra Global để file con dùng
        getgenv()[name:gsub(" ", "_") .. "_Enabled"] = enabled
    end)
end
