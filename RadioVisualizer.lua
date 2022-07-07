BypassMethod = setprop
-- netless(bypass work on progress)
-- replicate sound still work on progress

Activated = true
Activated2 = false
Activated3 = true

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton2 = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")
local TextLabel2 = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = true

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(5,5,5)
Frame.BorderColor3 = Color3.new(0.67451, 0.211765, 0.152941)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.2,0.2,0.6)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(5,5,5)
TextButton.BackgroundTransparency = 0.80000001192093
TextButton.Position = UDim2.new(0.103524067, 0, 0.100333327, 0)
TextButton.Size = UDim2.new(0.8,0.3,0.2)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "Robloxindonesia30 Radio (Activate)"
TextButton.TextScaled = true
TextButton.TextSize = 8
TextButton.TextWrapped = true

TextButton2.Parent = Frame
TextButton2.BackgroundColor3 = Color3.new(5,5,5)
TextButton2.BackgroundTransparency = 0
TextButton2.BorderColor3 = Color3.new(255,0,0)
TextButton2.Position = UDim2.new(0.904524067, 0, 0.90033339, 0)
TextButton2.Size = UDim2.new(0.1,0.3,0.1)
TextButton2.Font = Enum.Font.Bodoni
TextButton2.FontSize = Enum.FontSize.Size14
TextButton2.Text = "X"
TextButton2.TextScaled = true
TextButton2.TextSize = 8
TextButton2.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.new(5,5,5)
TextBox.BackgroundTransparency = 0.80000001192093
TextBox.Position = UDim2.new(0.103524067, 0, 0.400333327, 0)
TextBox.Size = UDim2.new(0.8,0.3,0.4)
TextBox.Font = Enum.Font.SourceSansLight
TextBox.FontSize = Enum.FontSize.Size14
TextBox.PlaceholderText = "SoundId"
TextBox.Text = "4207207833"
TextBox.TextScaled = true
TextBox.TextSize = 8
TextBox.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(5,5,5)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.103524067, 0, 0.800333327, 0)
TextLabel.Size = UDim2.new(0.8,0.3,0.2)
TextLabel.Font = Enum.Font.SourceSansLight
TextLabel.FontSize = Enum.FontSize.Size14
TextLabel.Text = "Method:"
TextLabel.TextScaled = true
TextLabel.TextSize = 8
TextLabel.TextWrapped = true

TextLabel2.Parent = Frame
TextLabel2.BackgroundColor3 = Color3.new(5,5,5)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Position = UDim2.new(0.103524067, 0, -0.05033339, 0)
TextLabel2.Size = UDim2.new(0.8,0.3,0.2)
TextLabel2.Font = Enum.Font.SourceSansLight
TextLabel2.FontSize = Enum.FontSize.Size14
TextLabel2.Text = "RepSound : false"
TextLabel2.TextScaled = true
TextLabel2.TextSize = 8
TextLabel2.TextWrapped = true

if BypassMethod == setprop then
TextLabel.Text = "Method : setprop"
TextLabel.TextColor3 = Color3.fromRGB(0,255,0)
elseif BypassMethod == setrad then
TextLabel.Text = "Method : setrad"
TextLabel.TextColor3 = Color3.fromRGB(0,255,0)
else
TextLabel.Text = "method : nil"
TextLabel.TextColor3 = Color3.fromRGB(255,0,0)
end

local Sound = Instance.new("Sound" ,workspace)
Sound.Volume = 1
Sound.Pitch = 1
Sound.Looped = true

local plr = game.Players.LocalPlayer
local character = game.Players.LocalPlayer.Character
local rootPart = character['HumanoidRootPart']
local pet = Instance.new('Part')
local JJ = Instance.new("ColorCorrectionEffect", game.Lighting)
local MotionBlur = Instance.new("BlurEffect")
MotionBlur.Parent = game.Lighting

local part = Instance.new('Part', rootPart)
part.CanCollide = false
part.Anchored = true
part.Size = Vector3.new(1,1,1)
part.Transparency = 0
local Mesh = Instance.new("SpecialMesh", part)
Mesh.MeshId = "rbxassetid://192488915"
Mesh.TextureId = "rbxassetid://192488947"

local direction = CFrame.new(part.Position, rootPart.Position).lookVector
local increment = direction * 4

spawn(function()
while wait() do
  	part.CFrame = rootPart.CFrame + (direction * increment) + Vector3.new(0, 3, 0)
	part.Rotation = rootPart.Rotation + (direction * increment) + Vector3.new(-1, -2, increment)
	
	pet.Position = part.Position
if Activated3 == false then
break
end
end
end)

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local RenderStepped1
RenderStepped1 = game:GetService("RunService").RenderStepped:Connect(function()
    Sound.SoundId = "rbxassetid://"..TextBox.Text
	local MySound = Sound.PlaybackLoudness
	local Humanoid = char.Humanoid
  local Busted = Sound.PlaybackLoudness / 1000 * 0.5
	local SuperPower = 500
	local Power = 1000
   local PowerNum = 5000
   Magnitude = 1 * 20
   Mags2 = 1 * 3
   Mag1 = 1 * 1
	Humanoid.CameraOffset = Vector3.new(0,MySound/SuperPower,MySound/Power,MySound/PowerNum)
Mesh.Scale = Vector3.new(1 + Busted,1 + Busted,1 + Busted)
JJ.Brightness = Busted * Mag1
JJ.Contrast = Mags2 * Busted
MotionBlur.Size = math.abs(Magnitude * Busted)
if Activated3 == false then
RenderStepped1:Disconnect()
MySound = nil
Busted = nil
Humanoid.CameraOffset = Vector3.new(0, 0, 0)
Sound:Destroy()
end
end)

TextButton2.MouseButton1Down:Connect(function()
ScreenGui:Destroy()
part:Destroy()
Sound:Destroy()
JJ:Destroy()
MotionBlur:Destroy()
Activated3 = false
workspace.CurrentCamera.CameraSubject = character:FindFirstChildWhichIsA('Humanoid')
end)

plr.CharacterAdded:Connect(function()
ScreenGui:Destroy()
part:Destroy()
Sound:Destroy()
JJ:Destroy()
MotionBlur:Destroy()
Activated3 = false
end)

TextButton.MouseButton1Down:Connect(function()
if Activated then
Sound:Play()
TextButton.Text = "Sound Playing"
TextButton.TextColor3 = Color3.fromRGB(0, 255, 0)
Activated = false
Activated2 = true
else
if Activated2 then
Sound:Pause()
TextButton.Text = "Sound Paused"
TextButton.TextColor3 = Color3.fromRGB(255, 0, 0)
Activated = true
Activated2 = false
end
end
end)
