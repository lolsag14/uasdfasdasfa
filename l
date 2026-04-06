local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SoftUI = {}

local function Tween(obj, props, duration)
    TweenService:Create(obj, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
end

function SoftUI:CreateWindow(config)
    local Window = {}
    
    -- Main ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SoftUI"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, -375, 0.5, -250)
    Main.Size = UDim2.new(0, 750, 0, 500)
    Main.ClipsDescendants = true
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 14)
    MainCorner.Parent = Main
    
    -- Shadow effect
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = Main
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -18, 0, -18)
    Shadow.Size = UDim2.new(1, 36, 1, 36)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.4
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 65)
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 14)
    TopBarCorner.Parent = TopBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 25, 0, 0)
    Title.Size = UDim2.new(0, 400, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Name or "Soft UI"
    Title.TextColor3 = Color3.fromRGB(245, 245, 250)
    Title.TextSize = 19
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Parent = TopBar
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 25, 0, 32)
    Subtitle.Size = UDim2.new(0, 400, 0, 20)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = config.LoadingSubtitle or "v1.0"
    Subtitle.TextColor3 = Color3.fromRGB(140, 140, 160)
    Subtitle.TextSize = 13
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Accent Bar
    local AccentBar = Instance.new("Frame")
    AccentBar.Name = "AccentBar"
    AccentBar.Parent = TopBar
    AccentBar.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    AccentBar.BorderSizePixel = 0
    AccentBar.Position = UDim2.new(0, 0, 1, -3)
    AccentBar.Size = UDim2.new(1, 0, 0, 3)
    
    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Sidebar.BorderSizePixel = 0
    Sidebar.Position = UDim2.new(0, 0, 0, 65)
    Sidebar.Size = UDim2.new(0, 190, 1, -65)
    
    local SidebarList = Instance.new("UIListLayout")
    SidebarList.Parent = Sidebar
    SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
    SidebarList.Padding = UDim.new(0, 6)
    SidebarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local SidebarPadding = Instance.new("UIPadding")
    SidebarPadding.Parent = Sidebar
    SidebarPadding.PaddingTop = UDim.new(0, 12)
    
    -- User Info Frame (at bottom of sidebar)
    local UserFrame = Instance.new("Frame")
    UserFrame.Name = "UserFrame"
    UserFrame.Parent = Sidebar
    UserFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0, 10, 1, -75)
    UserFrame.Size = UDim2.new(1, -20, 0, 65)
    UserFrame.ZIndex = 10
    
    local UserFrameCorner = Instance.new("UICorner")
    UserFrameCorner.CornerRadius = UDim.new(0, 10)
    UserFrameCorner.Parent = UserFrame
    
    -- User Avatar
    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.Parent = UserFrame
    Avatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    Avatar.BorderSizePixel = 0
    Avatar.Position = UDim2.new(0, 12, 0.5, -22)
    Avatar.Size = UDim2.new(0, 44, 0, 44)
    
    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = Avatar
    
    pcall(function()
        Avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    
    -- Username
    local Username = Instance.new("TextLabel")
    Username.Name = "Username"
    Username.Parent = UserFrame
    Username.BackgroundTransparency = 1
    Username.Position = UDim2.new(0, 62, 0, 12)
    Username.Size = UDim2.new(1, -72, 0, 18)
    Username.Font = Enum.Font.GothamSemibold
    Username.Text = LocalPlayer.Name
    Username.TextColor3 = Color3.fromRGB(220, 220, 230)
    Username.TextSize = 14
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.TextTruncate = Enum.TextTruncate.AtEnd
    
    -- User Status
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Parent = UserFrame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 62, 0, 32)
    Status.Size = UDim2.new(1, -72, 0, 16)
    Status.Font = Enum.Font.Gotham
    Status.Text = "Premium User"
    Status.TextColor3 = Color3.fromRGB(99, 102, 241)
    Status.TextSize = 11
    Status.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Content Area
    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = Main
    ContentArea.BackgroundTransparency = 1
    ContentArea.Position = UDim2.new(0, 190, 0, 65)
    ContentArea.Size = UDim2.new(1, -190, 1, -65)
    
    -- Make draggable
    local dragging, dragInput, dragStart, startPos
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Tween(Main, {
                Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            }, 0)
        end
    end)
    
    Window.Tabs = {}
    Window.CurrentTab = nil
    
    function Window:CreateTab(name, icon)
        local Tab = {}
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Parent = Sidebar
        TabButton.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 170, 0, 48)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = "  " .. name
        TabButton.TextColor3 = Color3.fromRGB(160, 160, 175)
        TabButton.TextSize = 14
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        TabButton.AutoButtonColor = false
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 10)
        TabCorner.Parent = TabButton
        
        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name .. "Content"
        TabContent.Parent = ContentArea
        TabContent.Active = true
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Position = UDim2.new(0, 18, 0, 18)
        TabContent.Size = UDim2.new(1, -36, 1, -36)
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.ScrollBarThickness = 5
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(99, 102, 241)
        TabContent.Visible = false
        
        local ContentList = Instance.new("UIListLayout")
        ContentList.Parent = TabContent
        ContentList.SortOrder = Enum.SortOrder.LayoutOrder
        ContentList.Padding = UDim.new(0, 14)
        
        ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 25)
        end)
        
        -- Tab click handler
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(Window.Tabs) do
                tab.Content.Visible = false
                Tween(tab.Button, {
                    BackgroundColor3 = Color3.fromRGB(28, 28, 35),
                    TextColor3 = Color3.fromRGB(160, 160, 175)
                }, 0.2)
            end
            
            TabContent.Visible = true
            Tween(TabButton, {
                BackgroundColor3 = Color3.fromRGB(99, 102, 241),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0.2)
            
            Window.CurrentTab = Tab
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        
        -- UI Elements
        function Tab:CreateSection(name)
            local Section = Instance.new("TextLabel")
            Section.Name = name
            Section.Parent = TabContent
            Section.BackgroundTransparency = 1
            Section.Size = UDim2.new(1, 0, 0, 40)
            Section.Font = Enum.Font.GothamBold
            Section.Text = name
            Section.TextColor3 = Color3.fromRGB(230, 230, 240)
            Section.TextSize = 17
            Section.TextXAlignment = Enum.TextXAlignment.Left
            
            local Divider = Instance.new("Frame")
            Divider.Name = "Divider"
            Divider.Parent = Section
            Divider.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
            Divider.BorderSizePixel = 0
            Divider.Position = UDim2.new(0, 0, 1, -2)
            Divider.Size = UDim2.new(1, 0, 0, 2)
            
            local DividerCorner = Instance.new("UICorner")
            DividerCorner.CornerRadius = UDim.new(1, 0)
            DividerCorner.Parent = Divider
            
            return Section
        end
        
        function Tab:CreateToggle(config)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = config.Name
            ToggleFrame.Parent = TabContent
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Size = UDim2.new(1, 0, 0, 50)
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 10)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "Label"
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Position = UDim2.new(0, 18, 0, 0)
            ToggleLabel.Size = UDim2.new(1, -80, 1, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = config.Name
            ToggleLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleBG = Instance.new("Frame")
            ToggleBG.Name = "ToggleBG"
            ToggleBG.Parent = ToggleFrame
            ToggleBG.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            ToggleBG.BorderSizePixel = 0
            ToggleBG.Position = UDim2.new(1, -60, 0.5, -14)
            ToggleBG.Size = UDim2.new(0, 45, 0, 28)
            
            local ToggleBGCorner = Instance.new("UICorner")
            ToggleBGCorner.CornerRadius = UDim.new(1, 0)
            ToggleBGCorner.Parent = ToggleBG
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Name = "Circle"
            ToggleCircle.Parent = ToggleBG
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
            ToggleCircle.BorderSizePixel = 0
            ToggleCircle.Position = UDim2.new(0, 3, 0.5, -10)
            ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = ToggleCircle
            
            local State = config.CurrentValue or false
            
            local function UpdateToggle()
                if State then
                    Tween(ToggleBG, {BackgroundColor3 = Color3.fromRGB(99, 102, 241)}, 0.2)
                    Tween(ToggleCircle, {
                        Position = UDim2.new(1, -23, 0.5, -10),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    }, 0.2)
                else
                    Tween(ToggleBG, {BackgroundColor3 = Color3.fromRGB(45, 45, 55)}, 0.2)
                    Tween(ToggleCircle, {
                        Position = UDim2.new(0, 3, 0.5, -10),
                        BackgroundColor3 = Color3.fromRGB(180, 180, 190)
                    }, 0.2)
                end
            end
            
            UpdateToggle()
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "Button"
            ToggleButton.Parent = ToggleFrame
            ToggleButton.BackgroundTransparency = 1
            ToggleButton.Size = UDim2.new(1, 0, 1, 0)
            ToggleButton.Text = ""
            
            ToggleButton.MouseButton1Click:Connect(function()
                State = not State
                UpdateToggle()
                if config.Callback then
                    config.Callback(State)
                end
            end)
            
            return {
                Set = function(val)
                    State = val
                    UpdateToggle()
                    if config.Callback then
                        config.Callback(val)
                    end
                end
            }
        end
        
        function Tab:CreateSlider(config)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = config.Name
            SliderFrame.Parent = TabContent
            SliderFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Size = UDim2.new(1, 0, 0, 70)
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 10)
            SliderCorner.Parent = SliderFrame
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Name = "Label"
            SliderLabel.Parent = SliderFrame
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Position = UDim2.new(0, 18, 0, 12)
            SliderLabel.Size = UDim2.new(0.6, 0, 0, 22)
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.Text = config.Name
            SliderLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
            SliderLabel.TextSize = 14
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local SliderValue = Instance.new("TextLabel")
            SliderValue.Name = "Value"
            SliderValue.Parent = SliderFrame
            SliderValue.BackgroundTransparency = 1
            SliderValue.Position = UDim2.new(0.6, 0, 0, 12)
            SliderValue.Size = UDim2.new(0.4, -18, 0, 22)
            SliderValue.Font = Enum.Font.GothamBold
            SliderValue.TextColor3 = Color3.fromRGB(99, 102, 241)
            SliderValue.TextSize = 14
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right
            
            local SliderBG = Instance.new("Frame")
            SliderBG.Name = "SliderBG"
            SliderBG.Parent = SliderFrame
            SliderBG.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            SliderBG.BorderSizePixel = 0
            SliderBG.Position = UDim2.new(0, 18, 1, -22)
            SliderBG.Size = UDim2.new(1, -36, 0, 7)
            
            local SliderBGCorner = Instance.new("UICorner")
            SliderBGCorner.CornerRadius = UDim.new(1, 0)
            SliderBGCorner.Parent = SliderBG
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Name = "Fill"
            SliderFill.Parent = SliderBG
            SliderFill.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
            SliderFill.BorderSizePixel = 0
            SliderFill.Size = UDim2.new(0.5, 0, 1, 0)
            
            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = UDim.new(1, 0)
            FillCorner.Parent = SliderFill
            
            local SliderDrag = Instance.new("Frame")
            SliderDrag.Name = "Drag"
            SliderDrag.Parent = SliderBG
            SliderDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderDrag.BorderSizePixel = 0
            SliderDrag.Position = UDim2.new(0.5, -7, 0.5, -7)
            SliderDrag.Size = UDim2.new(0, 14, 0, 14)
            SliderDrag.ZIndex = 2
            
            local DragCorner = Instance.new("UICorner")
            DragCorner.CornerRadius = UDim.new(1, 0)
            DragCorner.Parent = SliderDrag
            
            local Value = config.CurrentValue or config.Range[1]
            local Dragging = false
            
            local function UpdateSlider(val)
                Value = math.clamp(val, config.Range[1], config.Range[2])
                if config.Increment then
                    Value = math.floor(Value / config.Increment) * config.Increment
                end
                
                local Percent = (Value - config.Range[1]) / (config.Range[2] - config.Range[1])
                SliderFill.Size = UDim2.new(Percent, 0, 1, 0)
                SliderDrag.Position = UDim2.new(Percent, -7, 0.5, -7)
                SliderValue.Text = tostring(Value) .. (config.Suffix or "")
                
                if config.Callback then
                    config.Callback(Value)
                end
            end
            
            UpdateSlider(Value)
            
            SliderBG.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                    local MouseX = UserInputService:GetMouseLocation().X
                    local Percent = math.clamp((MouseX - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
                    UpdateSlider(config.Range[1] + (config.Range[2] - config.Range[1]) * Percent)
                end
            end)
            
            SliderBG.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local MouseX = UserInputService:GetMouseLocation().X
                    local Percent = math.clamp((MouseX - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
                    UpdateSlider(config.Range[1] + (config.Range[2] - config.Range[1]) * Percent)
                end
            end)
            
            return {
                Set = function(val)
                    UpdateSlider(val)
                end
            }
        end
        
        function Tab:CreateDropdown(config)
            local DropFrame = Instance.new("Frame")
            DropFrame.Name = config.Name
            DropFrame.Parent = TabContent
            DropFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            DropFrame.BorderSizePixel = 0
            DropFrame.Size = UDim2.new(1, 0, 0, 50)
            
            local DropCorner = Instance.new("UICorner")
            DropCorner.CornerRadius = UDim.new(0, 10)
            DropCorner.Parent = DropFrame
            
            local DropLabel = Instance.new("TextLabel")
            DropLabel.Name = "Label"
            DropLabel.Parent = DropFrame
            DropLabel.BackgroundTransparency = 1
            DropLabel.Position = UDim2.new(0, 18, 0, 0)
            DropLabel.Size = UDim2.new(0.4, 0, 1, 0)
            DropLabel.Font = Enum.Font.Gotham
            DropLabel.Text = config.Name
            DropLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
            DropLabel.TextSize = 14
            DropLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local DropButton = Instance.new("TextButton")
            DropButton.Name = "Button"
            DropButton.Parent = DropFrame
            DropButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            DropButton.BorderSizePixel = 0
            DropButton.Position = UDim2.new(0.45, 0, 0.5, -16)
            DropButton.Size = UDim2.new(0.55, -18, 0, 32)
            DropButton.Font = Enum.Font.Gotham
            DropButton.Text = (config.CurrentOption and config.CurrentOption[1]) or "Select"
            DropButton.TextColor3 = Color3.fromRGB(190, 190, 200)
            DropButton.TextSize = 13
            DropButton.AutoButtonColor = false
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = DropButton
            
            local DropList = Instance.new("Frame")
            DropList.Name = "List"
            DropList.Parent = ScreenGui
            DropList.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            DropList.BorderSizePixel = 0
            DropList.Size = UDim2.new(0, 220, 0, 0)
            DropList.Visible = false
            DropList.ZIndex = 100
            
            local ListCorner = Instance.new("UICorner")
            ListCorner.CornerRadius = UDim.new(0, 10)
            ListCorner.Parent = DropList
            
            local ListLayout = Instance.new("UIListLayout")
            ListLayout.Parent = DropList
            ListLayout.Padding = UDim.new(0, 4)
            
            local ListPadding = Instance.new("UIPadding")
            ListPadding.Parent = DropList
            ListPadding.PaddingTop = UDim.new(0, 6)
            ListPadding.PaddingBottom = UDim.new(0, 6)
            ListPadding.PaddingLeft = UDim.new(0, 6)
            ListPadding.PaddingRight = UDim.new(0, 6)
            
            local CurrentOption = config.CurrentOption or {""}
            
            local function UpdateList()
                for _, child in pairs(DropList:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end
                
                for _, option in pairs(config.Options or {}) do
                    local OptButton = Instance.new("TextButton")
                    OptButton.Name = option
                    OptButton.Parent = DropList
                    OptButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
                    OptButton.BorderSizePixel = 0
                    OptButton.Size = UDim2.new(1, -12, 0, 36)
                    OptButton.Font = Enum.Font.Gotham
                    OptButton.Text = option
                    OptButton.TextColor3 = Color3.fromRGB(210, 210, 220)
                    OptButton.TextSize = 13
                    OptButton.AutoButtonColor = false
                    
                    local OptCorner = Instance.new("UICorner")
                    OptCorner.CornerRadius = UDim.new(0, 6)
                    OptCorner.Parent = OptButton
                    
                    OptButton.MouseEnter:Connect(function()
                        Tween(OptButton, {BackgroundColor3 = Color3.fromRGB(99, 102, 241)}, 0.15)
                    end)
                    
                    OptButton.MouseLeave:Connect(function()
                        Tween(OptButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.15)
                    end)
                    
                    OptButton.MouseButton1Click:Connect(function()
                        DropButton.Text = option
                        CurrentOption = {option}
                        DropList.Visible = false
                        if config.Callback then
                            config.Callback({option})
                        end
                    end)
                end
                
                DropList.Size = UDim2.new(0, 220, 0, math.min(#config.Options * 40 + 12, 280))
            end
            
            UpdateList()
            
            DropButton.MouseButton1Click:Connect(function()
                DropList.Visible = not DropList.Visible
                if DropList.Visible then
                    local BtnPos = DropButton.AbsolutePosition
                    DropList.Position = UDim2.new(0, BtnPos.X, 0, BtnPos.Y + 36)
                end
            end)
            
            return {
                Refresh = function(opts, sel)
                    config.Options = opts
                    UpdateList()
                    if sel and sel[1] then
                        DropButton.Text = sel[1]
                        CurrentOption = sel
                    end
                end,
                CurrentOption = CurrentOption
            }
        end
        
        function Tab:CreateButton(config)
            local ButtonFrame = Instance.new("TextButton")
            ButtonFrame.Name = config.Name
            ButtonFrame.Parent = TabContent
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Size = UDim2.new(1, 0, 0, 50)
            ButtonFrame.Font = Enum.Font.GothamBold
            ButtonFrame.Text = config.Name
            ButtonFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonFrame.TextSize = 15
            ButtonFrame.AutoButtonColor = false
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 10)
            ButtonCorner.Parent = ButtonFrame
            
            ButtonFrame.MouseEnter:Connect(function()
                Tween(ButtonFrame, {BackgroundColor3 = Color3.fromRGB(85, 88, 220)}, 0.15)
            end)
            
            ButtonFrame.MouseLeave:Connect(function()
                Tween(ButtonFrame, {BackgroundColor3 = Color3.fromRGB(99, 102, 241)}, 0.15)
            end)
            
            ButtonFrame.MouseButton1Click:Connect(function()
                Tween(ButtonFrame, {BackgroundColor3 = Color3.fromRGB(75, 78, 200)}, 0.08)
                wait(0.08)
                Tween(ButtonFrame, {BackgroundColor3 = Color3.fromRGB(99, 102, 241)}, 0.12)
                if config.Callback then
                    config.Callback()
                end
            end)
        end
        
        function Tab:CreateKeybind(config)
            local KeyFrame = Instance.new("Frame")
            KeyFrame.Name = config.Name
            KeyFrame.Parent = TabContent
            KeyFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            KeyFrame.BorderSizePixel = 0
            KeyFrame.Size = UDim2.new(1, 0, 0, 50)
            
            local KeyCorner = Instance.new("UICorner")
            KeyCorner.CornerRadius = UDim.new(0, 10)
            KeyCorner.Parent = KeyFrame
            
            local KeyLabel = Instance.new("TextLabel")
            KeyLabel.Name = "Label"
            KeyLabel.Parent = KeyFrame
            KeyLabel.BackgroundTransparency = 1
            KeyLabel.Position = UDim2.new(0, 18, 0, 0)
            KeyLabel.Size = UDim2.new(0.5, 0, 1, 0)
            KeyLabel.Font = Enum.Font.Gotham
            KeyLabel.Text = config.Name
            KeyLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
            KeyLabel.TextSize = 14
            KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local KeyButton = Instance.new("TextButton")
            KeyButton.Name = "Button"
            KeyButton.Parent = KeyFrame
            KeyButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            KeyButton.BorderSizePixel = 0
            KeyButton.Position = UDim2.new(0.55, 0, 0.5, -16)
            KeyButton.Size = UDim2.new(0.45, -18, 0, 32)
            KeyButton.Font = Enum.Font.Gotham
            KeyButton.Text = config.CurrentKeybind or "None"
            KeyButton.TextColor3 = Color3.fromRGB(190, 190, 200)
            KeyButton.TextSize = 13
            KeyButton.AutoButtonColor = false
            
            local KeyCorner2 = Instance.new("UICorner")
            KeyCorner2.CornerRadius = UDim.new(0, 8)
            KeyCorner2.Parent = KeyButton
            
            local Binding = false
            
            KeyButton.MouseButton1Click:Connect(function()
                Binding = true
                KeyButton.Text = "..."
            end)
            
            UserInputService.InputBegan:Connect(function(input, gp)
                if gp then return end
                if Binding and input.UserInputType == Enum.UserInputType.Keyboard then
                    local Key = input.KeyCode.Name
                    KeyButton.Text = Key
                    Binding = false
                    if config.Changed then
                        config.Changed(Key)
                    end
                end
            end)
        end
        
        function Tab:CreateLabel(text)
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = TabContent
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, 0, 0, 28)
            Label.Font = Enum.Font.Gotham
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(180, 180, 195)
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            return Label
        end
        
        function Tab:CreateParagraph(config)
            local ParaFrame = Instance.new("Frame")
            ParaFrame.Name = config.Title
            ParaFrame.Parent = TabContent
            ParaFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            ParaFrame.BorderSizePixel = 0
            ParaFrame.Size = UDim2.new(1, 0, 0, 75)
            
            local ParaCorner = Instance.new("UICorner")
            ParaCorner.CornerRadius = UDim.new(0, 10)
            ParaCorner.Parent = ParaFrame
            
            local ParaTitle = Instance.new("TextLabel")
            ParaTitle.Name = "Title"
            ParaTitle.Parent = ParaFrame
            ParaTitle.BackgroundTransparency = 1
            ParaTitle.Position = UDim2.new(0, 18, 0, 10)
            ParaTitle.Size = UDim2.new(1, -36, 0, 20)
            ParaTitle.Font = Enum.Font.GothamBold
            ParaTitle.Text = config.Title
            ParaTitle.TextColor3 = Color3.fromRGB(220, 220, 230)
            ParaTitle.TextSize = 15
            ParaTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local ParaContent = Instance.new("TextLabel")
            ParaContent.Name = "Content"
            ParaContent.Parent = ParaFrame
            ParaContent.BackgroundTransparency = 1
            ParaContent.Position = UDim2.new(0, 18, 0, 35)
            ParaContent.Size = UDim2.new(1, -36, 1, -45)
            ParaContent.Font = Enum.Font.Gotham
            ParaContent.Text = config.Content
            ParaContent.TextColor3 = Color3.fromRGB(170, 170, 185)
            ParaContent.TextSize = 12
            ParaContent.TextXAlignment = Enum.TextXAlignment.Left
            ParaContent.TextYAlignment = Enum.TextYAlignment.Top
            ParaContent.TextWrapped = true
        end
        
        function Tab:CreateInput(config)
            local InputFrame = Instance.new("Frame")
            InputFrame.Name = config.Name
            InputFrame.Parent = TabContent
            InputFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            InputFrame.BorderSizePixel = 0
            InputFrame.Size = UDim2.new(1, 0, 0, 70)
            
            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 10)
            InputCorner.Parent = InputFrame
            
            local InputLabel = Instance.new("TextLabel")
            InputLabel.Name = "Label"
            InputLabel.Parent = InputFrame
            InputLabel.BackgroundTransparency = 1
            InputLabel.Position = UDim2.new(0, 18, 0, 10)
            InputLabel.Size = UDim2.new(1, -36, 0, 20)
            InputLabel.Font = Enum.Font.Gotham
            InputLabel.Text = config.Name
            InputLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
            InputLabel.TextSize = 14
            InputLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local InputBox = Instance.new("TextBox")
            InputBox.Name = "Box"
            InputBox.Parent = InputFrame
            InputBox.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            InputBox.BorderSizePixel = 0
            InputBox.Position = UDim2.new(0, 18, 0, 36)
            InputBox.Size = UDim2.new(1, -36, 0, 26)
            InputBox.Font = Enum.Font.Gotham
            InputBox.PlaceholderText = config.PlaceholderText or ""
            InputBox.Text = ""
            InputBox.TextColor3 = Color3.fromRGB(210, 210, 220)
            InputBox.TextSize = 13
            InputBox.ClearTextOnFocus = false
            
            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 6)
            BoxCorner.Parent = InputBox
            
            InputBox.FocusLost:Connect(function()
                if config.Callback then
                    config.Callback(InputBox.Text)
                end
            end)
            
            return {
                Set = function(text)
                    InputBox.Text = text
                end,
                CurrentValue = InputBox.Text
            }
        end
        
        function Tab:CreateColorPicker(config)
            local ColorFrame = Instance.new("Frame")
            ColorFrame.Name = config.Name
            ColorFrame.Parent = TabContent
            ColorFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            ColorFrame.BorderSizePixel = 0
            ColorFrame.Size = UDim2.new(1, 0, 0, 50)
            
            local ColorCorner = Instance.new("UICorner")
            ColorCorner.CornerRadius = UDim.new(0, 10)
            ColorCorner.Parent = ColorFrame
            
            local ColorLabel = Instance.new("TextLabel")
            ColorLabel.Name = "Label"
            ColorLabel.Parent = ColorFrame
            ColorLabel.BackgroundTransparency = 1
            ColorLabel.Position = UDim2.new(0, 18, 0, 0)
            ColorLabel.Size = UDim2.new(0.7, 0, 1, 0)
            ColorLabel.Font = Enum.Font.Gotham
            ColorLabel.Text = config.Name
            ColorLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
            ColorLabel.TextSize = 14
            ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local ColorDisplay = Instance.new("Frame")
            ColorDisplay.Name = "Display"
            ColorDisplay.Parent = ColorFrame
            ColorDisplay.BackgroundColor3 = config.Color or Color3.fromRGB(255, 255, 255)
            ColorDisplay.BorderSizePixel = 0
            ColorDisplay.Position = UDim2.new(1, -45, 0.5, -12)
            ColorDisplay.Size = UDim2.new(0, 28, 0, 24)
            
            local DisplayCorner = Instance.new("UICorner")
            DisplayCorner.CornerRadius = UDim.new(0, 6)
            DisplayCorner.Parent = ColorDisplay
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Parent = ColorDisplay
            Stroke.Color = Color3.fromRGB(60, 60, 70)
            Stroke.Thickness = 2
            
            return {
                Set = function(color)
                    ColorDisplay.BackgroundColor3 = color
                    if config.Callback then
                        config.Callback(color)
                    end
                end
            }
        end
        
        table.insert(Window.Tabs, Tab)
        
        if #Window.Tabs == 1 then
            Tween(TabButton, {
                BackgroundColor3 = Color3.fromRGB(99, 102, 241),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0)
            TabContent.Visible = true
            Window.CurrentTab = Tab
        end
        
        return Tab
    end
    
    function Window:Notify(config)
        local NotifFrame = Instance.new("Frame")
        NotifFrame.Name = "Notification"
        NotifFrame.Parent = ScreenGui
        NotifFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        NotifFrame.BorderSizePixel = 0
        NotifFrame.Position = UDim2.new(1, -360, 1, 10)
        NotifFrame.Size = UDim2.new(0, 350, 0, 90)
        NotifFrame.ZIndex = 200
        
        local NotifCorner = Instance.new("UICorner")
        NotifCorner.CornerRadius = UDim.new(0, 12)
        NotifCorner.Parent = NotifFrame
        
        local NotifAccent = Instance.new("Frame")
        NotifAccent.Name = "Accent"
        NotifAccent.Parent = NotifFrame
        NotifAccent.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
        NotifAccent.BorderSizePixel = 0
        NotifAccent.Size = UDim2.new(0, 5, 1, 0)
        
        local NotifTitle = Instance.new("TextLabel")
        NotifTitle.Name = "Title"
        NotifTitle.Parent = NotifFrame
        NotifTitle.BackgroundTransparency = 1
        NotifTitle.Position = UDim2.new(0, 18, 0, 12)
        NotifTitle.Size = UDim2.new(1, -36, 0, 24)
        NotifTitle.Font = Enum.Font.GothamBold
        NotifTitle.Text = config.Title
        NotifTitle.TextColor3 = Color3.fromRGB(230, 230, 240)
        NotifTitle.TextSize = 16
        NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local NotifContent = Instance.new("TextLabel")
        NotifContent.Name = "Content"
        NotifContent.Parent = NotifFrame
        NotifContent.BackgroundTransparency = 1
        NotifContent.Position = UDim2.new(0, 18, 0, 40)
        NotifContent.Size = UDim2.new(1, -36, 1, -52)
        NotifContent.Font = Enum.Font.Gotham
        NotifContent.Text = config.Content
        NotifContent.TextColor3 = Color3.fromRGB(180, 180, 195)
        NotifContent.TextSize = 13
        NotifContent.TextXAlignment = Enum.TextXAlignment.Left
        NotifContent.TextWrapped = true
        
        Tween(NotifFrame, {Position = UDim2.new(1, -360, 1, -100)}, 0.4)
        
        task.delay(config.Duration or 3, function()
            Tween(NotifFrame, {Position = UDim2.new(1, -360, 1, 10)}, 0.3)
            task.wait(0.3)
            NotifFrame:Destroy()
        end)
    end
    
    return Window
end

return SoftUI
