-- dangdepzai - Muscle Legends Rainbow V3 UI
-- Creator: Bcm2007

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Bảo vệ UI không bị mất khi chết
local function protectUI(gui)
    if not gui then return end
    gui.ResetOnSpawn = false
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
        gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end)
end

-- Tạo UI cơ bản
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RainbowV3"
protectUI(ScreenGui)
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Khung chính
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Muscle Legends - Rainbow V3"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- Nút Auto Strength
local AutoStrengthBtn = Instance.new("TextButton")
AutoStrengthBtn.Name = "AutoStrengthBtn"
AutoStrengthBtn.Parent = MainFrame
AutoStrengthBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
AutoStrengthBtn.Size = UDim2.new(0, 300, 0, 40)
AutoStrengthBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoStrengthBtn.Font = Enum.Font.GothamBold
AutoStrengthBtn.Text = "Auto Strength: OFF"
AutoStrengthBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoStrengthBtn.TextSize = 14

_G.AutoStrength = false
local equippedTool = nil

AutoStrengthBtn.MouseButton1Click:Connect(function()
    _G.AutoStrength = not _G.AutoStrength
    if _G.AutoStrength then
        AutoStrengthBtn.Text = "Auto Strength: ON"
        AutoStrengthBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        AutoStrengthBtn.Text = "Auto Strength: OFF"
        AutoStrengthBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoStrength then
            local char = LocalPlayer.Character
            local toolEquipped = char and char:FindFirstChildOfClass("Tool")
            if not equippedTool then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name:lower():find("weight") then
                        equippedTool = v
                        break
                    end
                end
                if equippedTool then
                    char.Humanoid:EquipTool(equippedTool)
                    task.wait(0.1)
                end
            elseif toolEquipped and toolEquipped ~= equippedTool then
                char.Humanoid:UnequipTools()
                task.wait(0.1)
                char.Humanoid:EquipTool(equippedTool)
            end
            if equippedTool then
                pcall(function()
                    equippedTool:Activate()
                end)
            end
        end
    end
end)
