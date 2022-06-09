local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local IsFlying = False
local flyv
local flyg
local Player = game.Players.LocalPlayer
local Speed = 50
local LastSpeed = Speed
local IsRunning = false
local f = 1

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = true

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(5,5,5)
Frame.BorderColor3 = Color3.new(0.67451, 0.211765, 0.152941)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.2,0.2,0.2)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(5,5,5)
TextButton.BackgroundTransparency = 0.80000001192093
TextButton.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
TextButton.Size = UDim2.new(0.8,0.9,0.6)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "Fly is Off"
TextButton.TextScaled = true
TextButton.TextSize = 8
TextButton.TextWrapped = true

TextButton.MouseButton1Click:connect(function()
if IsFlying then
				IsFlying = false
				flyv:Destroy()
				flyg:Destroy()
			    TextButton.Text = "Fly is Off"
			    TextButton.TextColor3 = Color3.fromRGB(255,0,0)
				Player.Character:WaitForChild('Humanoid').PlatformStand = false
			else
				IsFlying = true
				flyv = Instance.new("BodyVelocity")
	
			flyv.Parent = Player.Character:FindFirstChild('Torso') or Player.Character:FindFirstChild('UpperTorso')
				flyv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	
				flyg = Instance.new("BodyGyro")
			flyg.Parent = Player.Character:FindFirstChild('Torso') or Player.Character:FindFirstChild('UpperTorso')
				flyg.MaxTorque = Vector3.new(9e9,9e9,9e9)
				flyg.P = 1000
				flyg.D = 50
			TextButton.Text = "Fly is On"
			TextButton.TextColor3 = Color3.fromRGB(0,255,0)
			Player.Character:WaitForChild('Humanoid').PlatformStand = true
			end
	end)

spawn(function()
		while true do
			wait()
		if IsFlying then
				flyg.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((f+0)*50*Speed),0,0) 
					flyv.Velocity = workspace.CurrentCamera.CoordinateFrame.LookVector * Speed
else
f = 0
		end
if IsRunning then
			Speed = LastSpeed
		else
			if not Speed == 0 then
				LastSpeed = Speed
			end 
			Speed = 0
		end
		end
	end)

Player.Character.Humanoid.Changed:Connect(function()
		if Player.Character.Humanoid.Health == 0 then
		if IsFlying then
		IsFlying = false
		flyg:Destroy()
		flyv:Destroy()
		TextButton.Text = "You died! Restart The Script"
      TextButton.TextColor3 = Color3.fromRGB(255,0,0)
		end
		end
	end)
	Player.Character.Humanoid.Changed:Connect(function(Prop)
		
			if Player.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) then
				IsRunning = false
			else
				IsRunning = true
			end	
	end)
