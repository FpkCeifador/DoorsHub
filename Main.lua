if game.PlaceId == 6516141723 then
	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
	OrionLib:MakeNotification({
        	Name = "Error!",
                Content = "Join A Game Lobby First.",
                Time = 10
        }) 
end

if game.PlaceId == 6839171747 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("FPK Scripter", "BloodTheme")
    -- MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")
    getgenv().Title = "Welcome To FPK Hub The Best Open Source Script" --Title Here
    getgenv().Description = "Join Our Discord For Updates And Suport" --Description Here
    getgenv().Reason = "Loading Script..." --Reason Here
    getgenv().BadgeId = 2126048428 
    getgenv().Category = 10 
    
    local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
    local Achievements = debug.getupvalue(Unlock, 1)
    for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
        v.Title = getgenv().Title
        v.Desc = getgenv().Description
        v.Reason = getgenv().Reason
        v.BadgeId = getgenv().BadgeId
        v.Category = getgenv().Category
    end
    Unlock(nil,"Join")

	MainSection:NewToggle("Instant Interact", "RAAAAHHHHHH", function(state)
		if state then
			_G.UOp = true
			game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Instant Interact exploit is on!"; Duration=5;})
			while true do
				game:GetService("RunService").RenderStepped:wait()
				game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
					fireproximityprompt(prompt)
				end)
				if _G.UOp == false then
					break
				end
			end
		else
			_G.UOp = false
		end
	end)

	MainSection:NewToggle("Anti Screech", "RAAAAHHHHHH", function(state)
        if state then
            _G.llpo = true
        else
            _G.llpo = false
        end
		workspace.CurrentCamera.ChildAdded:Connect(function(child)
            if child.Name == "Screech" and _G.llpo == true then
                child:Destroy()
            end
        end)
	end)

	MainSection:NewToggle("Flip Lever (X)", "RAAAAHHHHHH", function(state)
		local Keybind = Enum.KeyCode.X
		local CanSkipRoom_50 = true
		local CanAutoUnlockDoors = true
		local CanPullTheLevers = true
		local cooldown = true
		local cooldownwait = 0.5

		do
			local UIS = game:GetService("UserInputService")
			local CF = CFrame.new
			local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom

			UIS.InputBegan:Connect(function(input, typing)
				if typing then return end
				if input.KeyCode == Keybind then
					if not cooldown then return end
					pcall(function()
						cooldown = false
						local lever = false
						local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
						for _,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
							if object.Name == "LeverForGate" then
								lever = object
							end
						end
						if LatestRoom.Value == 50 and CanSkipRoom_50 == true then
							CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
							game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
						else
							if lever and CanPullTheLevers == true then
								game.Players.LocalPlayer.Character:PivotTo(CF(lever.Main.Position))
								task.wait(.3)
								fireproximityprompt(lever.ActivateEventPrompt)
								task.wait(.3)
								game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
							end
							game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
						end
						task.wait(.45)
						CurrentDoor.ClientOpen:FireServer()
						task.wait(cooldownwait)
						cooldown = true
					end)
				end
			end)
		end
	end)

	MainSection:NewToggle("Get Key (Z)", "RAAAAHHHHHH", function(state)
		local Keybind = Enum.KeyCode.Z

		local UIS = game:GetService("UserInputService")
		local CF = CFrame.new
		local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom

		UIS.InputBegan:Connect(function(input, typing)
			if typing then return end
			if input.KeyCode == Keybind then
				pcall(function()
					local key = false
					local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
					for i,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
						if object.Name == "KeyObtain" then
							key = object
						end
					end
					if LatestRoom.Value == 50 then
						CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
						game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
					else
						if key then
							game.Players.LocalPlayer.Character:PivotTo(CF(key.Hitbox.Position))
							task.wait(.3)
							fireproximityprompt(key.ModulePrompt)
							task.wait(.3)
							game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
							task.wait(.3)
                    		fireproximityprompt(CurrentDoor.Lock.UnlockPrompt)
						end
					end
				end)
			end
		end)
	end)

	MainSection:NewButton("Complete Breaker Box (PATCHED!)", "RAAAAHHHHHH", function(state)
		Callback = function()
			local Event = game:GetService("ReplicatedStorage").Bricks.EBF
			Event:FireServer()
        	end 
	end)
	MainSection:NewButton("Steal Gold (Teleports)", "RAAAAHHHHHH", function(state)

		local UIS = game:GetService("UserInputService")
		local CF = CFrame.new
		local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom

		UIS.InputBegan:Connect(function(input, typing)
			if typing then return end
			while true do
				pcall(function()
					task.wait(.01)
					local GoldPile = false
					local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
					for i,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
						if object.Name == "GoldPile" then
							GoldPile = object
						end
					end
					if LatestRoom.Value == 50 then
						CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
						game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
					else
						if GoldPile then
							game.Players.LocalPlayer.Character:PivotTo(CF(GoldPile.Hitbox.Position))
							task.wait(.3)
							fireproximityprompt(GoldPile.LootPrompt)
						end
					end
				end)
			end
		end)
	end)

	MainSection:NewToggle("Skip Level (H)", "MMMMM", function(t)
		if t then
			_G.OPI = true
			game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Skip Level exploit is on!"; Duration=5;})
		else
			_G.OPI = false
		end

		local Keybind = Enum.KeyCode.H

		local UIS = game:GetService("UserInputService")
		local CF = CFrame.new
		local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
		local CanPullTheLevers = true

		UIS.InputBegan:Connect(function(input, typing)
			if typing then return end
			if input.KeyCode == Keybind and _G.OPI == true then
				pcall(function()
					local key = false
					local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
					for i,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
						if object.Name == "KeyObtain" then
							key = object
						end
					end
					if LatestRoom.Value == 50 then
						CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
						game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
					else
						if key then
							game.Players.LocalPlayer.Character:PivotTo(CF(key.Hitbox.Position))
							task.wait(.3)
							fireproximityprompt(key.ModulePrompt)
							task.wait(.3)
							game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
							task.wait(.3)
							fireproximityprompt(CurrentDoor.Lock.UnlockPrompt)
						end
						game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
					end
					task.wait(.2)
					CurrentDoor.ClientOpen:FireServer()
				end)
			end
		end)
	end)

    MainSection:NewToggle("Super-Speed", "Sets Humanoid Speed To 50", function(state)
		if state then
			_G.UO = true
			game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Super speed exploit is on!"; Duration=5;})
			while true do
				game:GetService("RunService").RenderStepped:wait()
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
				if _G.UO == false then
					break
				end
			end
		else
			_G.UO = false
			game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Super speed exploit is off!"; Duration=5;})
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
		end
    end)

	MainSection:NewToggle("Remove Fake Doors", "bro", function(state)
		if state then
			_G.UO = true
			game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Door Remover exploit is on!"; Duration=5;})
			while true do
				task.wait(3)
				loadstring(game:HttpGet("https://pastebin.com/raw/ZcNPGJfQ", true))()
				if _G.UO == false then
					break
				end
			end
		else
			_G.UO = false
			game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="exploit is off!"; Duration=5;})
		end
    end)

    MainSection:NewToggle("Event Notifier", "yes", function(state)
        if state then
            _G.llpi = true
        else
            _G.llpi = false
        end
		game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Event Notifier exploit is on!"; Duration=5;})
        local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
        local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart
        LatestRoom.Changed:Connect(function()
            if _G.llpi == true then
                local n = ChaseStart.Value - LatestRoom.Value
                if 0 < n and n < 4 then
                    OrionLib:MakeNotification({
                        Name = "Warning!",
                        Content = "Event in " .. tostring(n) .. " rooms.",
                        Time = 5
                    })
                end
            end
        end)
    end)

    MainSection:NewToggle("Avoid Rush/Ambush", "yes", function(state)
        if state then
            _G.llp = true
        else
            _G.llp = false
        end
            workspace.ChildAdded:Connect(function(inst)
                if inst.Name == "RushMoving" and _G.llp == true then
                    if _G.llp == true then
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Avoiding Rush. Please wait.",
                            Time = 5
                        })
                        local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local con = game:GetService("RunService").Heartbeat:Connect(function()
                            game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                        end)
                        
                        inst.Destroying:Wait()
                        con:Disconnect()
        
                        game.Players.LocalPlayer.Character:MoveTo(OldPos)
                    else
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Rush has spawned, hide!",
                            Time = 5
                        })
                    end
                elseif inst.Name == "AmbushMoving" and _G.llp == true then
                    if _G.llp == true then
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Avoiding Ambush. Please wait.",
                            Time = 5
                        })
                        local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local con = game:GetService("RunService").Heartbeat:Connect(function()
                            game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                        end)
                        
                        inst.Destroying:Wait()
                        con:Disconnect()
                        
                        game.Players.LocalPlayer.Character:MoveTo(OldPos)
                    else
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Ambush has spawned, hide!",
                            Time = 5
                        })
                    end
                end
            end)
    end)

    MainSection:NewToggle("Player Flashlight", "You turn into a flashlight", function(state)
        game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="This is only visible for you!"; Duration=5;})
        if state then
            character = game:GetService("Players").LocalPlayer.Character
            pointLight = Instance.new("PointLight")
            pointLight.Parent = character.HumanoidRootPart
        else
            if pointLight then pointLight:Destroy() end
        end
    end)

    MainSection:NewButton("No Arms", "Removes Arms", function()
        game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="This is visible for everyone!"; Duration=5;})
        character = game:GetService("Players").LocalPlayer.Character
        leftArm = character:FindFirstChild("Left Arm")
        if leftArm then leftArm:Destroy() end
        rightArm = character:FindFirstChild("Right Arm")
        if rightArm then rightArm:Destroy() end
        leftUpperArm = character:FindFirstChild("LeftUpperArm")
        if leftUpperArm then leftUpperArm:Destroy() end
        leftLowerArm = character:FindFirstChild("LeftLowerArm")
        if leftLowerArm then leftLowerArm:Destroy() end
        rightUpperArm = character:FindFirstChild("RightUpperArm")
        if rightUpperArm then rightUpperArm:Destroy() end
        rightLowerArm = character:FindFirstChild("RightLowerArm")
        if rightLowerArm then rightLowerArm:Destroy() end
    end)

	MainSection:NewSlider("Set FPS cap", "Set Your FPS cap", 120, 1, function(s)
        setfpscap(s)
    end)

    MainSection:NewButton("Infinite Yield", "FE Admin Commands", function()
        game.StarterGui:SetCore("SendNotification", {Title="FPK_Cheats"; Text="Infiniteyield is running!"; Duration=5;})
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)

    local ent = Window:NewTab("Entity")
    local EntSection = ent:NewSection("Can't Kill You")

    EntSection:NewButton("Summon Screech", "yes", function()
        require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
        workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
    end)

    EntSection:NewButton("Summon Glitch", "yes", function()
        require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
        workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
    end)

    EntSection:NewButton("Summon Halt", "yes", function()
        require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
        workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
    end)

    EntSection:NewButton("Summon Matcher", "yes", function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        local entity = Creator.createEntity({
            CustomName = "Matcher", -- Custom name of your entity
            Model = "rbxassetid://11402557910", -- Can be GitHub file or rbxassetid
            Speed = 50, -- Percentage, 100 = default Rush speed
            DelayTime = 0, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = false,
            BreakLights = false,
            FlickerLights = {
                true, -- Enabled
                1, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 1,
                WaitTime = 0,
            },
            CamShake = {
                true, -- Enabled
                {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled ('false' if you don't want jumpscare)
                {
                    Image1 = "rbxassetid://11372489796", -- Image1 url
                    Image2 = "rbxassetid://11372489796", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        0, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        0, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled
                        Color3.fromRGB(255, 0, 0), -- Color
                    },
                    Tease = {
                        true, -- Enabled ('false' if you don't want tease)
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"You died to Matcher...", "The lights flicker upon its signal.", "If it does, hide!"}, -- Custom death message (can be as long as you want)
        })

        -- Run the created entity
        Creator.runEntity(entity)
    end)

    EntSection:NewButton("Summon A-60 (Might Kill)", "yes", function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
            -- Create entity
            local entity = Creator.createEntity({
                Model = 11379072534,
                Speed = 200,
                DelayTime = 3,
                HeightOffset = 0,
                CanKill = false,
                BreakLights = true,
                FlickerLights = {
                    true,
                    2,
                },
                Cycles = {
                    Min = 1,
                    Max = 2,
                    WaitTime = 0.05,
                },
                CamShake = {
                    true,
                    {30, 30, 0.1, 1},
                    50,
                },
                        Jumpscare = {
            false, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11394048190", -- Image1 url
                Image2 = "rbxassetid://11394048190", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 0, 0), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 1,
                },
            },
        },
                CustomDialog = {"You died to an enitity designated as A-60", "It can Apear at any moment, a loud scream will anounce its presence", "When you hear it spawn you must stay out of its reach as soon as possible", "It knows exactly where you are so hiding in different places will not work.."}
            })
    
            -----[[ Advanced ]]-----
            entity.Debug.OnEntitySpawned = function(entityModel)
                
            end
    
            entity.Debug.OnEntityDespawned = function(entityModel)
                if getgenv().death == false then
                getgenv().Title = "Out of many Rebounds" --Title Here
                getgenv().Description = "Might Come back or not" --Description Here
                getgenv().Reason = "Encounter and survive the rare Entity called A-60" --Reason Here
                getgenv().BadgeId = 2129181688 --Replace Number with Your Badge ID
                getgenv().Category = 10 --You can replace the Category or dont
    
                local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
                local Achievements = debug.getupvalue(Unlock, 1)
                for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
                    v.Title = getgenv().Title
                    v.Desc = getgenv().Description
                    v.Reason = getgenv().Reason
                    v.BadgeId = getgenv().BadgeId
                    v.Category = getgenv().Category
                end
                Unlock(nil,"Join")
                end
            end
    
            entity.Debug.OnEntityStartMoving = function(entityModel)
                
            end
    
            entity.Debug.OnEntityFinishedRebound = function(entityModel)
                
            end
    
            entity.Debug.OnDeath = function()
            getgenv().death = true
                getgenv().Title = "Out of many Rebounds" --Title Here
                getgenv().Description = "Might Come back and did" --Description Here
                getgenv().Reason = "Encounter and dont survive the rare Entity called A-60" --Reason Here
                getgenv().BadgeId = 2129181688 --Replace Number with Your Badge ID
                getgenv().Category = 10 --You can replace the Category or dont
    
                local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
                local Achievements = debug.getupvalue(Unlock, 1)
                for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
                    v.Title = getgenv().Title
                    v.Desc = getgenv().Description
                    v.Reason = getgenv().Reason
                    v.BadgeId = getgenv().BadgeId
                    v.Category = getgenv().Category
                end
                Unlock(nil,"Join")
            end
            ---------------------------
    
            -- Run the created entity
            Creator.runEntity(entity)
    end)


    EntSection:NewButton("Summon Rebound", "yes", function()

        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity

        game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(102, 255, 250)
        game.Lighting.MainColorCorrection.Contrast = 1
        local tween = game:GetService("TweenService")
        tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
        local TweenService = game:GetService("TweenService")
        local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(3),{TintColor = Color3.fromRGB(255, 255, 255)})
        TW:Play()

        local entity = Creator.createEntity({
            CustomName = "Rebound", -- Custom name of your entity
            Model = "rbxassetid://11401769490", -- Can be GitHub file or rbxassetid
            Speed = 150, -- Percentage, 100 = default Rush speed
            DelayTime = 3, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = false,
            BreakLights = false,
            FlickerLights = {
                true, -- Enabled
                2.5, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 6,
                WaitTime = 7,
            },
            CamShake = {
                true, -- Enabled
                {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled ('false' if you don't want jumpscare)
                {
                    Image1 = "rbxassetid://11372489796", -- Image1 url
                    Image2 = "rbxassetid://11372489796", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        0, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        0, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled
                        Color3.fromRGB(255, 0, 0), -- Color
                    },
                    Tease = {
                        true, -- Enabled ('false' if you don't want tease)
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"You died to Rebound...", "The lights flicker upon its scream.", "It is also tricky, as it rebounds.", "You need to hide to around 6 times.", "Til it never comes back."}, -- Custom death message (can be as long as you want)
        })

        -- Run the created entity
        Creator.runEntity(entity)

    end)

    EntSection:NewButton("Summon Specimen2 | Will chase slowly", "yes", function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        local entity = Creator.createEntity({
            Model = "https://github.com/fnaclol/sussy-bois/raw/main/Specimen2.rbxm",
            Speed = 30,
            DelayTime = 0,
            HeightOffset = 0,
            CanKill = false,
            BreakLights = false,
            FlickerLights = {
                false,
                100,
            },
            Cycles = {
                Min = 1,
                Max = 1,
                WaitTime = 0.1,
            },
            CamShake = {
                false,
                {5, 15, 0.1, 1},
                100,
            },
            CustomDialog = {"You died to whom you call Specimen2", "Specimen2 will spawn every 1 second as to give it a look of it chasing you", "Specimen2 is also 10% faster then you", "Just run from him, he is slow but will get you if you slack ", "You did well."}
        })

        -- Run the created entity
        Creator.runEntity(entity)
    end)

    EntSection:NewButton("Summon Rush (No Sound!)", "yes", function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
        local entity = Creator.createEntity({
            CustomName = "Rush", -- Custom name of your entity
            Model = "https://github.com/RegularVynixu/Utilities/blob/main/Doors%20Entity%20Spawner/Models/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 100, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = false,
            BreakLights = true,
            FlickerLights = {
                true, -- Enabled
                1.5, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 1,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled
                {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                true, -- Enabled ('false' if you don't want jumpscare)
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        11395890995, -- SoundId
                        { Volume = 1 }, -- Sound properties
                    },
                    Sound2 = {
                        11395890995, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled ('false' if you don't want tease)
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"You died to rush", "Just hide okay?", "Sorry I don't get payed enough", "So um yeah hah survive next-time."}, -- Custom death message (can be as long as you want)
        })

        Creator.runEntity(entity)
    end)

    local ite = Window:NewTab("Items")
    local iteSection = ite:NewSection("Unlock Store Items:")

    iteSection:NewButton("M249", "yes", function()
        local M2 = game:GetService("Players")["David_prodoapex"].PlayerGui.MainUI.ItemShop.Items["ItemShop_M249"]
        M2.Visible = true
    end)

    local iteSection = ite:NewSection("Give Items:")

    iteSection:NewButton("Revolver", "yes", function()
        local shadow=game:GetObjects("rbxassetid://1555932744")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=9982615727'
        local track
        
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
        
        end)
        
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
    end)
    
    iteSection:NewButton("Crucifix", "yes", function()
        local shadow=game:GetObjects("rbxassetid://11480603603")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=9982615727'
        local track
        
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
        
        end)
        
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
    end)

    iteSection:NewButton("HandGun", "yes", function()
        local shadow=game:GetObjects("rbxassetid://10965551395")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=9982615727'
        local track
        
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
        
        end)
        
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
    end)

    iteSection:NewButton("Sword", "yes", function()
        local shadow=game:GetObjects("rbxassetid://47433")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=9982615727'
        local track
        
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
        
        end)
        
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
    end)

    iteSection:NewButton("Laser Gun", "yes", function()
        local shadow=game:GetObjects("rbxassetid://6880366374")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=9982615727'
        local track
        
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
        
        end)
        
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
    end)

    iteSection:NewButton("Flashlight", "yes", function()
        local shadow=game:GetObjects("rbxassetid://6219027765")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=9982615727'
        local track
        
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
        
        end)
        
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
    end)
	
    iteSection:NewButton("Get BTools", "Gives You Mod Tools", function()
        backpack = game:GetService("Players").LocalPlayer.Backpack

        hammer = Instance.new("HopperBin")
        hammer.Name = "Hammer"
        hammer.BinType = 4
        hammer.Parent = backpack
        
        cloneTool = Instance.new("HopperBin")
        cloneTool.Name = "Clone"
        cloneTool.BinType = 3
        cloneTool.Parent = backpack
        
        grabTool = Instance.new("HopperBin")
        grabTool.Name = "Grab"
        grabTool.BinType = 2
        grabTool.Parent = backpack
    end)

    --LOCAL PLAYER
    local vis = Window:NewTab("Visuals")
    local visSection = vis:NewSection("Player Chams")

    visSection:NewButton("Apply Player Chams", "ye", function()
        local dwEntities = game:GetService("Players")
	local dwLocalPlayer = dwEntities.LocalPlayer 
	local dwRunService = game:GetService("RunService")

	local settings_tbl = {
	    ESP_Enabled = true,
	    ESP_TeamCheck = false,
	    Chams = true,
	    Chams_Color = Color3.fromRGB(0,0,255),
	    Chams_Transparency = 0.1,
	    Chams_Glow_Color = Color3.fromRGB(255,0,0)
	}

	function destroy_chams(char)

	    for k,v in next, char:GetChildren() do 

		if v:IsA("BasePart") and v.Transparency ~= 1 then

		    if v:FindFirstChild("Glow") and 
		    v:FindFirstChild("Chams") then

			v.Glow:Destroy()
			v.Chams:Destroy() 

		    end 

		end 

	    end 

	end

	dwRunService.Heartbeat:Connect(function()

	    if settings_tbl.ESP_Enabled then

		for k,v in next, dwEntities:GetPlayers() do 

		    if v ~= dwLocalPlayer then

			if v.Character and
			v.Character:FindFirstChild("HumanoidRootPart") and 
			v.Character:FindFirstChild("Humanoid") and 
			v.Character:FindFirstChild("Humanoid").Health ~= 0 then

			    if settings_tbl.ESP_TeamCheck == false then

				local char = v.Character 

				for k,b in next, char:GetChildren() do 

				    if b:IsA("BasePart") and 
				    b.Transparency ~= 1 then

					if settings_tbl.Chams then

					    if not b:FindFirstChild("Glow") and
					    not b:FindFirstChild("Chams") then

						local chams_box = Instance.new("BoxHandleAdornment", b)
						chams_box.Name = "Chams"
						chams_box.AlwaysOnTop = true 
						chams_box.ZIndex = 4 
						chams_box.Adornee = b 
						chams_box.Color3 = settings_tbl.Chams_Color
						chams_box.Transparency = settings_tbl.Chams_Transparency
						chams_box.Size = b.Size + Vector3.new(0.02, 0.02, 0.02)

						local glow_box = Instance.new("BoxHandleAdornment", b)
						glow_box.Name = "Glow"
						glow_box.AlwaysOnTop = false 
						glow_box.ZIndex = 3 
						glow_box.Adornee = b 
						glow_box.Color3 = settings_tbl.Chams_Glow_Color
						glow_box.Size = chams_box.Size + Vector3.new(0.13, 0.13, 0.13)

					    end

					else

					    destroy_chams(char)

					end

				    end

				end

			    else

				if v.Team == dwLocalPlayer.Team then
				    destroy_chams(v.Character)
				end

			    end

			else

			    destroy_chams(v.Character)

			end

		    end

		end

	    else 

		for k,v in next, dwEntities:GetPlayers() do 

		    if v ~= dwLocalPlayer and 
		    v.Character and 
		    v.Character:FindFirstChild("HumanoidRootPart") and 
		    v.Character:FindFirstChild("Humanoid") and 
		    v.Character:FindFirstChild("Humanoid").Health ~= 0 then

			destroy_chams(v.Character)

		    end

		end

	    end

	end)
    end)

    visSection:NewButton("Disable Player Chams", "ye", function()
        local dwEntities = game:GetService("Players")
	local dwLocalPlayer = dwEntities.LocalPlayer 
	local dwRunService = game:GetService("RunService")

	local settings_tbl = {
	    ESP_Enabled = false,
	    ESP_TeamCheck = false,
	    Chams = false,
	    Chams_Color = Color3.fromRGB(0,0,255),
	    Chams_Transparency = 0.1,
	    Chams_Glow_Color = Color3.fromRGB(255,0,0)
	}

	function destroy_chams(char)

	    for k,v in next, char:GetChildren() do 

		if v:IsA("BasePart") and v.Transparency ~= 1 then

		    if v:FindFirstChild("Glow") and 
		    v:FindFirstChild("Chams") then

			v.Glow:Destroy()
			v.Chams:Destroy() 

		    end 

		end 

	    end 

	end

	dwRunService.Heartbeat:Connect(function()

	    if settings_tbl.ESP_Enabled then

		for k,v in next, dwEntities:GetPlayers() do 

		    if v ~= dwLocalPlayer then

			if v.Character and
			v.Character:FindFirstChild("HumanoidRootPart") and 
			v.Character:FindFirstChild("Humanoid") and 
			v.Character:FindFirstChild("Humanoid").Health ~= 0 then

			    if settings_tbl.ESP_TeamCheck == false then

				local char = v.Character 

				for k,b in next, char:GetChildren() do 

				    if b:IsA("BasePart") and 
				    b.Transparency ~= 1 then

					if settings_tbl.Chams then

					    if not b:FindFirstChild("Glow") and
					    not b:FindFirstChild("Chams") then

						local chams_box = Instance.new("BoxHandleAdornment", b)
						chams_box.Name = "Chams"
						chams_box.AlwaysOnTop = true 
						chams_box.ZIndex = 4 
						chams_box.Adornee = b 
						chams_box.Color3 = settings_tbl.Chams_Color
						chams_box.Transparency = settings_tbl.Chams_Transparency
						chams_box.Size = b.Size + Vector3.new(0.02, 0.02, 0.02)

						local glow_box = Instance.new("BoxHandleAdornment", b)
						glow_box.Name = "Glow"
						glow_box.AlwaysOnTop = false 
						glow_box.ZIndex = 3 
						glow_box.Adornee = b 
						glow_box.Color3 = settings_tbl.Chams_Glow_Color
						glow_box.Size = chams_box.Size + Vector3.new(0.13, 0.13, 0.13)

					    end

					else

					    destroy_chams(char)

					end

				    end

				end

			    else

				if v.Team == dwLocalPlayer.Team then
				    destroy_chams(v.Character)
				end

			    end

			else

			    destroy_chams(v.Character)

			end

		    end

		end

	    else 

		for k,v in next, dwEntities:GetPlayers() do 

		    if v ~= dwLocalPlayer and 
		    v.Character and 
		    v.Character:FindFirstChild("HumanoidRootPart") and 
		    v.Character:FindFirstChild("Humanoid") and 
		    v.Character:FindFirstChild("Humanoid").Health ~= 0 then

			destroy_chams(v.Character)

		    end

		end

	    end

	end)
    end)
	
    visSection:NewButton("Apply Name Esp", "okie", function()
        local esp_settings = { ---- table for esp settings 
            textsize = 10,
            colour = 255,255,255
        }
        
        local gui = Instance.new("BillboardGui")
        local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel
        
        
        
        gui.Name = "Cracked esp"; ---- properties of the esp
        gui.ResetOnSpawn = false
        gui.AlwaysOnTop = true;
        gui.LightInfluence = 1;
        gui.Size = UDim2.new(1.75, 0, 1.75, 0);
        esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        esp.Text = ""
        esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
        esp.BorderSizePixel = 4;
        esp.BorderColor3 = Color3.new(esp_settings.colour)
        esp.BorderSizePixel = 0
        esp.Font = "GothamSemibold"
        esp.TextSize = esp_settings.textsize
        esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
        
        game:GetService("RunService").RenderStepped:Connect(function() ---- loops faster than a while loop :)
            for i,v in pairs (game:GetService("Players"):GetPlayers()) do
                if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then -- craeting checks for team check, local player etc
                    esp.Text = " "..v.Name.." "
                    gui:Clone().Parent = v.Character.Head
                end
            end
        end)
    end)
	
    visSection:NewButton("Disable Name Esp", "okie", function()
        local esp_settings = { ---- table for esp settings 
            textsize = 0,
            colour = 255,255,255
        }
        
        local gui = Instance.new("BillboardGui")
        local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel
        
        
        
        gui.Name = "Cracked esp"; ---- properties of the esp
        gui.ResetOnSpawn = false
        gui.AlwaysOnTop = true;
        gui.LightInfluence = 1;
        gui.Size = UDim2.new(0, 0, 0, 0);
        esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        esp.Text = ""
        esp.Size = UDim2.new(0.000, 0.000, 0.000, 0.000);
        esp.BorderSizePixel = 0;
        esp.BorderColor3 = Color3.new(esp_settings.colour)
        esp.BorderSizePixel = 0
        esp.Font = "GothamSemibold"
        esp.TextSize = esp_settings.textsize
        esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
        
        game:GetService("RunService").RenderStepped:Connect(function() ---- loops faster than a while loop :)
            for i,v in pairs (game:GetService("Players"):GetPlayers()) do
                if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then -- craeting checks for team check, local player etc
                    esp.Text = " "..v.Name.." "
                    gui:Clone().Parent = v.Character.Head
                end
            end
        end)
    end)
	
    visSection:NewLabel("Key Chams")
	
    visSection:NewButton("Apply Key Chams", "RAAAAHHHHHH", function(state)
        local KeyChams = {}    
        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = true
            Cham.RobloxLocked = true
            return Cham
        end
        
        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "KeyObtain" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "KeyObtain" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)
    end)
	
    visSection:NewButton("Disable Key Chams", "RAAAAHHHHHH", function(state)
        local KeyChams = {}    
        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = false
            Cham.RobloxLocked = true
            return Cham
        end
        
        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "KeyObtain" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "KeyObtain" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)
    end)
	
    visSection:NewLabel("Book Chams")
	
    visSection:NewButton("Apply Book Chams", "RAAAAHHHHHH", function(state)
        local KeyChams = {}    
        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = true
            Cham.RobloxLocked = true
            return Cham
        end
        
        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "LiveHintBook" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "LiveHintBook" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)
    end)
	
    visSection:NewButton("Disable Book Chams", "RAAAAHHHHHH", function(state)
        local KeyChams = {}    
        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = false
            Cham.RobloxLocked = true
            return Cham
        end
        
        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "LiveHintBook" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "LiveHintBook" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)
    end)
	
    visSection:NewLabel("Lever Chams")
	
    visSection:NewButton("Apply Lever Chams", "RAAAAHHHHHH", function(state)
        local KeyChams = {}    
        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = true
            Cham.RobloxLocked = true
            return Cham
        end
        
        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "LeverForGate" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "LeverForGate" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)
    end)
	
    visSection:NewButton("Disable Lever Chams", "RAAAAHHHHHH", function(state)
        local KeyChams = {}    
        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = false
            Cham.RobloxLocked = true
            return Cham
        end
        
        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "LeverForGate" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "LeverForGate" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)
    end)

    --Other
    local Other = Window:NewTab("Other")
    local OtherSection = Other:NewSection("Other")

    OtherSection:NewButton("Bypassed Fly", "bird mode", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))() 

        Fly(true)
    end)

    OtherSection:NewButton("Load Dex V3", "Loads Dex V3", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
    end)

    local Teleports = Window:NewTab("Teleports")
    local TeleportsSection = Teleports:NewSection("Player Teleports")
    
    TeleportsSection:NewTextBox("Player Username", "Input Player Name", function(txt)
        _G.txte = txt
    end)
    
    TeleportsSection:NewButton("TP", "Teleport To Player", function(txt)
        targetUsername = _G.txte
        players = game:GetService("Players")
        targetPlayer = players:FindFirstChild(targetUsername)
        players.LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
    end)
    
    TeleportsSection:NewToggle("Stay On Of Player", "Teleport To Player Inf", function(t)
        if t then
             _G.onu = true --Set to false if you want to turn it off

            while wait() do
            
                if _G.onu == true then
                    targetUsername = _G.txte
                    players = game:GetService("Players")
                    targetPlayer = players:FindFirstChild(targetUsername)
                    players.LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
                end
            end
        else
            _G.onu = false
        end
    end)
    
    TeleportsSection:NewButton("Fling Player", "Flings Player", function(txt)
        local Settings = {
           Target = _G.txte -- Target Name (Not display name)
        }
        
        -- Objects
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        
        local LocalPlayer = Players.LocalPlayer
        local Target = Players:FindFirstChild(Settings.Target)
        
        local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
        BodyAngularVelocity.AngularVelocity = Vector3.new(10^6, 10^6, 10^6)
        BodyAngularVelocity.MaxTorque = Vector3.new(10^6, 10^6, 10^6)
        BodyAngularVelocity.P = 10^6
        
        -- Start
        if not Target then return end
        BodyAngularVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        
        while Target.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart do
           RunService.RenderStepped:Wait()
           LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * LocalPlayer.Character.HumanoidRootPart.CFrame.Rotation
           LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new()
        end
           
        BodyAngularVelocity.Parent = nil
    end)
    
    TeleportsSection:NewLabel("World Teleports")
    
    TeleportsSection:NewButton("TP to Lobby", "Teleport To Lobby", function(txt)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(58.3169441, 41.8983574, -2.42302418, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end)
    
    local World = Window:NewTab("World")
    local WorldSection = World:NewSection("World")
    
	WorldSection:NewButton("Fullbright", "YEAH...", function(s)
		loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
	end)

    WorldSection:NewToggle("Disable Render", "Disables Rendering", function(state)
        if state then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end)
    
    local Hub = Window:NewTab("Hub")
    local HubSection = Hub:NewSection("Hub")
    
    HubSection:NewKeybind("Set Hide Keybind", "Sets a keybind to hide the gui", Enum.KeyCode.F, function()
	    Library:ToggleUI()
    end)
    
end
