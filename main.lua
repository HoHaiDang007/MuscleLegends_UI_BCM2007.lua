-- dangdepzai - Muscle Legends Rainbow V3 Full Script
-- UI by Instance.new - compatible with KRNL Mobile
-- Creator: Bcm2007

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local AutoStrengthBtn = Instance.new("TextButton")
local AutoRebirthBtn = Instance.new("TextButton")
local AutoPunchBtn = Instance.new("TextButton")
local AutoKillBtn = Instance.new("TextButton")
local AutoPetBtn = Instance.new("TextButton")
local AutoAuraBtn = Instance.new("TextButton")
local WalkSpeedSlider = Instance.new("TextBox")
local JumpPowerSlider = Instance.new("TextBox")
local FlyButton = Instance.new("TextButton")
local AntiAfk = Instance.new("TextButton")

-- GUI Setup
ScreenGui.Name = "RainbowV3"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 192, 203)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 168, 200)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.FredokaOne
Title.Text = "bcm2000 - Rainbow V3"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true

Tabs.Name = "Tabs"
Tabs.Parent = MainFrame
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0, 0, 0, 45)
Tabs.Size = UDim2.new(1, 0, 1, -45)

function createButton(name, posY, callback)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Parent = Tabs
	button.Position = UDim2.new(0.05, 0, 0, posY)
	button.Size = UDim2.new(0.9, 0, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(255, 150, 200)
	button.Font = Enum.Font.GothamBold
	button.Text = name
	button.TextColor3 = Color3.new(1,1,1)
	button.TextScaled = true
	button.MouseButton1Click:Connect(callback)
	return button
end

-- Features
local autoStrength = false
createButton("Auto Strength", 0, function()
	autoStrength = not autoStrength
	while autoStrength do
		game:GetService("ReplicatedStorage").Events.MuscleEvent:FireServer("GainMuscle")
		wait()
	end
end)

local autoPunch = false
createButton("Auto Punch", 35, function()
	autoPunch = not autoPunch
	while autoPunch do
		game:GetService("ReplicatedStorage").Events.Training:FireServer("punch")
		wait()
	end
end)

local autoKill = false
createButton("Auto Kill", 70, function()
	autoKill = not autoKill
	while autoKill do
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				game:GetService("ReplicatedStorage").Events.rEvents.hitPlayer:FireServer(player.Character)
			end
		end
		wait(0.5)
	end
end)

local autoRebirth = false
createButton("Auto Rebirth", 105, function()
	autoRebirth = not autoRebirth
	while autoRebirth do
		game:GetService("ReplicatedStorage").Events.MuscleEvent:FireServer("Rebirth")
		wait(2)
	end
end)

local autoPet = false
createButton("Auto Pet", 140, function()
	autoPet = not autoPet
	while autoPet do
		game:GetService("ReplicatedStorage").Events.DataEvent:InvokeServer("buyEgg", "BlueCrystal")
		wait(1.5)
	end
end)

local autoAura = false
createButton("Auto Aura", 175, function()
	autoAura = not autoAura
	while autoAura do
		game:GetService("ReplicatedStorage").Events.DataEvent:InvokeServer("buyAura", "Dark Lightning")
		wait(2)
	end
end)

createButton("Set WalkSpeed: 100", 210, function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton("Set JumpPower: 120", 245, function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
end)

createButton("Enable Fly", 280, function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid then
		local bp = Instance.new("BodyPosition", Humanoid.RootPart)
		bp.Position = Humanoid.RootPart.Position + Vector3.new(0, 100, 0)
		bp.MaxForce = Vector3.new(100000, 100000, 100000)
		wait(3)
		bp:Destroy()
	end
end)

createButton("Anti AFK", 315, function()
	local vu = game:service("VirtualUser")
	game:service("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end)
