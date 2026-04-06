-- NEVERLOSE STYLE UI LIBRARY
-- Dark, compact, clean design like CS2 cheat menus

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local NeverloseUI = {}
NeverloseUI.Themes = {
    Background = Color3.fromRGB(22, 22, 22),
    Header = Color3.fromRGB(8, 8, 8),
    Sidebar = Color3.fromRGB(14, 14, 14),
    Section = Color3.fromRGB(10, 10, 20),
    MainColor = Color3.fromRGB(0, 172, 255),
    StrokeColor = Color3.fromRGB(28, 28, 28),
    TextColor = Color3.fromRGB(223, 251, 255)
}

local function Tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

function NeverloseUI:CreateWindow(config)
    local Window = {}
    
    -- Destroy old UI
    local old = CoreGui:FindFirstChild("NeverloseUI")
    if old then old:Destroy() end
    
    -- Main ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NeverloseUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = NeverloseUI.Themes.Background
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, -400, 0.5, -300)
    Main.Size = UDim2.new(0, 800, 0, 600)
    Main.ClipsDescendants = false
    
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)
    
    -- Shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = Main
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -15, 0, -15)
    Shadow.Size = UDim2.new(1, 30, 1, 30)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    -- Header
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = Main
    Header.BackgroundColor3 = NeverloseUI.Themes.Header
    Header.BorderSizePixel = 0
    Header.Size = UDim2.new(1, 0, 0, 80)
    Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 6)
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Header
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 20, 0, 10)
    Title.Size = UDim2.new(0, 300, 0, 28)
    Title.Font = Enum.Font.GothamBlack
    Title.Text = config.Name or "NEVERLOSE"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 24
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextStrokeTransparency = 0.8
    Title.TextStrokeColor3 = NeverloseUI.Themes.MainColor
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Parent = Header
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 20, 0, 42)
    Subtitle.Size = UDim2.new(0, 300, 0, 18)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = config.LoadingSubtitle or "by Praroditel"
    Subtitle.TextColor3 = Color3.fromRGB(140, 140, 160)
    Subtitle.TextSize = 13
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Accent line
    local Accent = Instance.new("Frame")
    Accent.Name = "Accent"
    Accent.Parent = Header
    Accent.BackgroundColor3 = NeverloseUI.Themes.MainColor
    Accent.BorderSizePixel = 0
    Accent.Position = UDim2.new(0, 0, 1, -2)
    Accent.Size = UDim2.new(1, 0, 0, 2)
    
    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = NeverloseUI.Themes.Sidebar
    Sidebar.BorderSizePixel = 0
    Sidebar.Position = UDim2.new(0, 0, 0, 80)
    Sidebar.Size = UDim2.new(0, 180, 1, -80)
    
    local SidebarList = Instance.new("UIListLayout")
    SidebarList.Parent = Sidebar
    SidebarList.Padding = UDim.new(0, 8)
    SidebarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    Instance.new("UIPadding", Sidebar).PaddingTop = UDim.new(0, 12)
    
    -- User frame (bottom of sidebar)
    local UserFrame = Instance.new("Frame")
    UserFrame.Name = "UserFrame"
    UserFrame.Parent = Sidebar
    UserFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0, 10, 1, -75)
    UserFrame.Size = UDim2.new(1, -20, 0, 65)
    UserFrame.ZIndex = 10
    Instance.new("UICorner", UserFrame).CornerRadius = UDim.new(0, 8)
    
    -- Avatar
    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.Parent = UserFrame
    Avatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    Avatar.BorderSizePixel = 0
    Avatar.Position = UDim2.new(0, 12, 0.5, -22)
    Avatar.Size = UDim2.new(0, 44, 0, 44)
    Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)
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
    
    -- Status
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Parent = UserFrame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 62, 0, 32)
    Status.Size = UDim2.new(1, -72, 0, 16)
    Status.Font = Enum.Font.Gotham
    Status.Text = "Premium User"
    Status.TextColor3 = NeverloseUI.Themes.MainColor
    Status.TextSize = 11
    Status.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Content area
    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = Main
    ContentArea.BackgroundTransparency = 1
    ContentArea.Position = UDim2.new(0, 180, 0, 80)
    ContentArea.Size = UDim2.new(1, -180, 1, -80)
    
    -- Draggable
    local dragging, dragInput, dragStart, startPos
    
    Header.InputBegan:Connect(function(input)
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
    
    Header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    Window.Tabs = {}
    Window.CurrentTab = nil
    
    function Window:CreateTab(name, icon)
        local Tab = {}
        
        -- Tab button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Parent = Sidebar
        TabButton.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 160, 0, 45)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = "  " .. name
        TabButton.TextColor3 = Color3.fromRGB(160, 160, 175)
        TabButton.TextSize = 14
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        TabButton.AutoButtonColor = false
        Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 8)
        
        -- Tab content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name .. "Content"
        TabContent.Parent = ContentArea
        TabContent.Active = true
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Position = UDim2.new(0, 15, 0, 15)
        TabContent.Size = UDim2.new(1, -30, 1, -30)
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.ScrollBarThickness = 4
        TabContent.ScrollBarImageColor3 = NeverloseUI.Themes.MainColor
        TabContent.Visible = false
        
        local List = Instance.new("UIListLayout")
        List.Parent = TabContent
        List.Padding = UDim.new(0, 10)
        
        List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, List.AbsoluteContentSize.Y + 20)
        end)
        
        -- Tab click
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
                BackgroundColor3 = NeverloseUI.Themes.MainColor,
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
            Section.Size = UDim2.new(1, 0, 0, 35)
            Section.Font = Enum.Font.GothamBold
            Section.Text = name
            Section.TextColor3 = Color3.fromRGB(230, 230, 240)
            Section.TextSize = 16
            Section.TextXAlignment = Enum.TextXAlignment.Left
            
            local Divider = Instance.new("Frame")
            Divider.Name = "Divider"
            Divider.Parent = Section
            Divider.BackgroundColor3 = NeverloseUI.Themes.MainColor
            Divider.BorderSizePixel = 0
            Divider.Position = UDim2.new(0, 0, 1, -2)
            Divider.Size = UDim2.new(1, 0, 0, 2)
            Instance.new("UICorner", Divider).CornerRadius = UDim.new(1, 0)
        end
        
        function Tab:CreateToggle(config)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = config.Name
            ToggleFrame.Parent = TabContent
            ToggleFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Size = UDim2.new(1, 0, 0, 45)
            Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = ToggleFrame
            
            local Label = Instance.new("TextLabel")
            Label.Parent = ToggleFrame
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 15, 0, 0)
            Label.Size = UDim2.new(1, -80, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleBG = Instance.new("Frame")
            ToggleBG.Parent = ToggleFrame
            ToggleBG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            ToggleBG.BorderSizePixel = 0
            ToggleBG.Position = UDim2.new(1, -55, 0.5, -12)
            ToggleBG.Size = UDim2.new(0, 40, 0, 24)
            Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)
            
            local Circle = Instance.new("Frame")
            Circle.Parent = ToggleBG
            Circle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
            Circle.BorderSizePixel = 0
            Circle.Position = UDim2.new(0, 3, 0.5, -9)
            Circle.Size = UDim2.new(0, 18, 0, 18)
            Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)
            
            local State = config.CurrentValue or false
            
            local function Update()
                if State then
                    Tween(ToggleBG, {BackgroundColor3 = Color3.fromRGB(12, 18, 66)}, 0.2)
                    Tween(Circle, {
                        Position = UDim2.new(1, -21, 0.5, -9),
                        BackgroundColor3 = NeverloseUI.Themes.MainColor
                    }, 0.2)
                    Tween(Label, {TextTransparency = 0}, 0.2)
                else
                    Tween(ToggleBG, {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}, 0.2)
                    Tween(Circle, {
                        Position = UDim2.new(0, 3, 0.5, -9),
                        BackgroundColor3 = Color3.fromRGB(180, 180, 190)
                    }, 0.2)
                    Tween(Label, {TextTransparency = 0.3}, 0.2)
                end
            end
            
            Update()
            
            local Btn = Instance.new("TextButton")
            Btn.Parent = ToggleFrame
            Btn.BackgroundTransparency = 1
            Btn.Size = UDim2.new(1, 0, 1, 0)
            Btn.Text = ""
            Btn.MouseButton1Click:Connect(function()
                State = not State
                Update()
                if config.Callback then config.Callback(State) end
            end)
            
            return {
                Set = function(v)
                    State = v
                    Update()
                    if config.Callback then config.Callback(v) end
                end
            }
        end
        
        function Tab:CreateSlider(config)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = config.Name
            SliderFrame.Parent = TabContent
            SliderFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Size = UDim2.new(1, 0, 0, 60)
            Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = SliderFrame
            
            local Label = Instance.new("TextLabel")
            Label.Parent = SliderFrame
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 15, 0, 8)
            Label.Size = UDim2.new(0.6, 0, 0, 18)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Parent = SliderFrame
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Position = UDim2.new(0.6, 0, 0, 8)
            ValueLabel.Size = UDim2.new(0.4, -15, 0, 18)
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextColor3 = NeverloseUI.Themes.MainColor
            ValueLabel.TextSize = 13
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            
            local SliderBG = Instance.new("Frame")
            SliderBG.Parent = SliderFrame
            SliderBG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            SliderBG.BorderSizePixel = 0
            SliderBG.Position = UDim2.new(0, 15, 1, -18)
            SliderBG.Size = UDim2.new(1, -30, 0, 6)
            Instance.new("UICorner", SliderBG).CornerRadius = UDim.new(1, 0)
            
            local Fill = Instance.new("Frame")
            Fill.Parent = SliderBG
            Fill.BackgroundColor3 = NeverloseUI.Themes.MainColor
            Fill.BorderSizePixel = 0
            Fill.Size = UDim2.new(0.5, 0, 1, 0)
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            
            local Drag = Instance.new("Frame")
            Drag.Parent = SliderBG
            Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Drag.BorderSizePixel = 0
            Drag.Position = UDim2.new(0.5, -6, 0.5, -6)
            Drag.Size = UDim2.new(0, 12, 0, 12)
            Drag.ZIndex = 2
            Instance.new("UICorner", Drag).CornerRadius = UDim.new(1, 0)
            
            local Value = config.CurrentValue or config.Range[1]
            local Dragging = false
            
            local function Update(val)
                Value = math.clamp(val, config.Range[1], config.Range[2])
                if config.Increment then
                    Value = math.floor(Value / config.Increment) * config.Increment
                end
                
                local Percent = (Value - config.Range[1]) / (config.Range[2] - config.Range[1])
                Fill.Size = UDim2.new(Percent, 0, 1, 0)
                Drag.Position = UDim2.new(Percent, -6, 0.5, -6)
                ValueLabel.Text = tostring(Value) .. (config.Suffix or "")
                
                if config.Callback then config.Callback(Value) end
            end
            
            Update(Value)
            
            SliderBG.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                    local Mouse = UserInputService:GetMouseLocation()
                    local Percent = math.clamp((Mouse.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
                    Update(config.Range[1] + (config.Range[2] - config.Range[1]) * Percent)
                end
            end)
            
            SliderBG.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local Mouse = UserInputService:GetMouseLocation()
                    local Percent = math.clamp((Mouse.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
                    Update(config.Range[1] + (config.Range[2] - config.Range[1]) * Percent)
                end
            end)
            
            return {Set = function(v) Update(v) end}
        end
        
        function Tab:CreateDropdown(config)
            local DropFrame = Instance.new("Frame")
            DropFrame.Name = config.Name
            DropFrame.Parent = TabContent
            DropFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            DropFrame.BorderSizePixel = 0
            DropFrame.Size = UDim2.new(1, 0, 0, 45)
            Instance.new("UICorner", DropFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = DropFrame
            
            local Label = Instance.new("TextLabel")
            Label.Parent = DropFrame
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 15, 0, 0)
            Label.Size = UDim2.new(0.4, 0, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local Btn = Instance.new("TextButton")
            Btn.Parent = DropFrame
            Btn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            Btn.BorderSizePixel = 0
            Btn.Position = UDim2.new(0.45, 0, 0.5, -14)
            Btn.Size = UDim2.new(0.55, -15, 0, 28)
            Btn.Font = Enum.Font.Gotham
            Btn.Text = (config.CurrentOption and config.CurrentOption[1]) or "Select"
            Btn.TextColor3 = Color3.fromRGB(190, 190, 200)
            Btn.TextSize = 12
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
            
            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Color = NeverloseUI.Themes.StrokeColor
            BtnStroke.Thickness = 0.5
            BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            BtnStroke.Parent = Btn
            
            local DropList = Instance.new("Frame")
            DropList.Name = "List"
            DropList.Parent = ScreenGui
            DropList.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            DropList.BorderSizePixel = 0
            DropList.Size = UDim2.new(0, 200, 0, 0)
            DropList.Visible = false
            DropList.ZIndex = 100
            Instance.new("UICorner", DropList).CornerRadius = UDim.new(0, 6)
            
            local ListLayout = Instance.new("UIListLayout")
            ListLayout.Parent = DropList
            ListLayout.Padding = UDim.new(0, 3)
            
            local ListPadding = Instance.new("UIPadding")
            ListPadding.Parent = DropList
            ListPadding.PaddingTop = UDim.new(0, 5)
            ListPadding.PaddingBottom = UDim.new(0, 5)
            ListPadding.PaddingLeft = UDim.new(0, 5)
            ListPadding.PaddingRight = UDim.new(0, 5)
            
            local CurrentOption = config.CurrentOption or {""}
            
            local function UpdateList()
                for _, child in pairs(DropList:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                
                for _, option in pairs(config.Options or {}) do
                    local OptBtn = Instance.new("TextButton")
                    OptBtn.Name = option
                    OptBtn.Parent = DropList
                    OptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
                    OptBtn.BorderSizePixel = 0
                    OptBtn.Size = UDim2.new(1, -10, 0, 32)
                    OptBtn.Font = Enum.Font.Gotham
                    OptBtn.Text = option
                    OptBtn.TextColor3 = Color3.fromRGB(210, 210, 220)
                    OptBtn.TextSize = 12
                    OptBtn.AutoButtonColor = false
                    Instance.new("UICorner", OptBtn).CornerRadius = UDim.new(0, 4)
                    
                    OptBtn.MouseEnter:Connect(function()
                        Tween(OptBtn, {BackgroundColor3 = NeverloseUI.Themes.MainColor}, 0.15)
                    end)
                    
                    OptBtn.MouseLeave:Connect(function()
                        Tween(OptBtn, {BackgroundColor3 = Color3.fromRGB(28, 28, 35)}, 0.15)
                    end)
                    
                    OptBtn.MouseButton1Click:Connect(function()
                        Btn.Text = option
                        CurrentOption = {option}
                        DropList.Visible = false
                        if config.Callback then config.Callback({option}) end
                    end)
                end
                
                DropList.Size = UDim2.new(0, 200, 0, math.min(#config.Options * 35 + 10, 250))
            end
            
            UpdateList()
            
            Btn.MouseButton1Click:Connect(function()
                DropList.Visible = not DropList.Visible
                if DropList.Visible then
                    local BtnPos = Btn.AbsolutePosition
                    DropList.Position = UDim2.new(0, BtnPos.X, 0, BtnPos.Y + 32)
                end
            end)
            
            return {
                Refresh = function(opts, sel)
                    config.Options = opts
                    UpdateList()
                    if sel and sel[1] then
                        Btn.Text = sel[1]
                        CurrentOption = sel
                    end
                end,
                CurrentOption = CurrentOption
            }
        end
        
        function Tab:CreateButton(config)
            local BtnFrame = Instance.new("TextButton")
            BtnFrame.Name = config.Name
            BtnFrame.Parent = TabContent
            BtnFrame.BackgroundColor3 = NeverloseUI.Themes.MainColor
            BtnFrame.BorderSizePixel = 0
            BtnFrame.Size = UDim2.new(1, 0, 0, 45)
            BtnFrame.Font = Enum.Font.GothamBold
            BtnFrame.Text = config.Name
            BtnFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
            BtnFrame.TextSize = 14
            BtnFrame.AutoButtonColor = false
            Instance.new("UICorner", BtnFrame).CornerRadius = UDim.new(0, 6)
            
            BtnFrame.MouseEnter:Connect(function()
                Tween(BtnFrame, {BackgroundColor3 = Color3.fromRGB(10, 150, 220)}, 0.15)
            end)
            
            BtnFrame.MouseLeave:Connect(function()
                Tween(BtnFrame, {BackgroundColor3 = NeverloseUI.Themes.MainColor}, 0.15)
            end)
            
            BtnFrame.MouseButton1Click:Connect(function()
                Tween(BtnFrame, {BackgroundColor3 = Color3.fromRGB(0, 120, 180)}, 0.08)
                wait(0.08)
                Tween(BtnFrame, {BackgroundColor3 = NeverloseUI.Themes.MainColor}, 0.12)
                if config.Callback then config.Callback() end
            end)
        end
        
        function Tab:CreateLabel(text)
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = TabContent
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, 0, 0, 25)
            Label.Font = Enum.Font.ArialBold
            Label.Text = text
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            return Label
        end
        
        function Tab:CreateKeybind(config)
            local KeyFrame = Instance.new("Frame")
            KeyFrame.Name = config.Name
            KeyFrame.Parent = TabContent
            KeyFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            KeyFrame.BorderSizePixel = 0
            KeyFrame.Size = UDim2.new(1, 0, 0, 45)
            Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = KeyFrame
            
            local Label = Instance.new("TextLabel")
            Label.Parent = KeyFrame
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 15, 0, 0)
            Label.Size = UDim2.new(0.5, 0, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local KeyBtn = Instance.new("TextButton")
            KeyBtn.Parent = KeyFrame
            KeyBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            KeyBtn.BorderSizePixel = 0
            KeyBtn.Position = UDim2.new(0.55, 0, 0.5, -14)
            KeyBtn.Size = UDim2.new(0.45, -15, 0, 28)
            KeyBtn.Font = Enum.Font.Gotham
            KeyBtn.Text = config.CurrentKeybind or "None"
            KeyBtn.TextColor3 = Color3.fromRGB(190, 190, 200)
            KeyBtn.TextSize = 12
            KeyBtn.AutoButtonColor = false
            Instance.new("UICorner", KeyBtn).CornerRadius = UDim.new(0, 4)
            
            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Color = NeverloseUI.Themes.StrokeColor
            BtnStroke.Thickness = 0.5
            BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            BtnStroke.Parent = KeyBtn
            
            local Binding = false
            
            KeyBtn.MouseButton1Click:Connect(function()
                Binding = true
                KeyBtn.Text = "..."
            end)
            
            UserInputService.InputBegan:Connect(function(input, gp)
                if gp then return end
                if Binding and input.UserInputType == Enum.UserInputType.Keyboard then
                    local Key = input.KeyCode.Name
                    KeyBtn.Text = Key
                    Binding = false
                    if config.Changed then config.Changed(Key) end
                end
            end)
        end
        
        function Tab:CreateParagraph(config)
            local ParaFrame = Instance.new("Frame")
            ParaFrame.Name = config.Title
            ParaFrame.Parent = TabContent
            ParaFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            ParaFrame.BorderSizePixel = 0
            ParaFrame.Size = UDim2.new(1, 0, 0, 70)
            Instance.new("UICorner", ParaFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = ParaFrame
            
            local Title = Instance.new("TextLabel")
            Title.Parent = ParaFrame
            Title.BackgroundTransparency = 1
            Title.Position = UDim2.new(0, 15, 0, 8)
            Title.Size = UDim2.new(1, -30, 0, 18)
            Title.Font = Enum.Font.GothamBold
            Title.Text = config.Title
            Title.TextColor3 = Color3.fromRGB(220, 220, 230)
            Title.TextSize = 14
            Title.TextXAlignment = Enum.TextXAlignment.Left
            
            local Content = Instance.new("TextLabel")
            Content.Parent = ParaFrame
            Content.BackgroundTransparency = 1
            Content.Position = UDim2.new(0, 15, 0, 30)
            Content.Size = UDim2.new(1, -30, 1, -38)
            Content.Font = Enum.Font.Gotham
            Content.Text = config.Content
            Content.TextColor3 = Color3.fromRGB(170, 170, 185)
            Content.TextSize = 12
            Content.TextXAlignment = Enum.TextXAlignment.Left
            Content.TextYAlignment = Enum.TextYAlignment.Top
            Content.TextWrapped = true
        end
        
        function Tab:CreateInput(config)
            local InputFrame = Instance.new("Frame")
            InputFrame.Name = config.Name
            InputFrame.Parent = TabContent
            InputFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            InputFrame.BorderSizePixel = 0
            InputFrame.Size = UDim2.new(1, 0, 0, 65)
            Instance.new("UICorner", InputFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = InputFrame
            
            local Label = Instance.new("TextLabel")
            Label.Parent = InputFrame
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 15, 0, 8)
            Label.Size = UDim2.new(1, -30, 0, 18)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local InputBox = Instance.new("TextBox")
            InputBox.Parent = InputFrame
            InputBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            InputBox.BorderSizePixel = 0
            InputBox.Position = UDim2.new(0, 15, 0, 32)
            InputBox.Size = UDim2.new(1, -30, 0, 26)
            InputBox.Font = Enum.Font.Gotham
            InputBox.PlaceholderText = config.PlaceholderText or ""
            InputBox.Text = ""
            InputBox.TextColor3 = Color3.fromRGB(210, 210, 220)
            InputBox.TextSize = 12
            InputBox.ClearTextOnFocus = false
            Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 4)
            
            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = NeverloseUI.Themes.StrokeColor
            BoxStroke.Thickness = 0.5
            BoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            BoxStroke.Parent = InputBox
            
            local Padding = Instance.new("UIPadding")
            Padding.Parent = InputBox
            Padding.PaddingLeft = UDim.new(0, 8)
            
            InputBox.FocusLost:Connect(function()
                if config.Callback then config.Callback(InputBox.Text) end
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
            ColorFrame.BackgroundColor3 = NeverloseUI.Themes.Section
            ColorFrame.BorderSizePixel = 0
            ColorFrame.Size = UDim2.new(1, 0, 0, 45)
            Instance.new("UICorner", ColorFrame).CornerRadius = UDim.new(0, 6)
            
            local Stroke = Instance.new("UIStroke")
            Stroke.Color = NeverloseUI.Themes.StrokeColor
            Stroke.Thickness = 1
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = ColorFrame
            
            local Label = Instance.new("TextLabel")
            Label.Parent = ColorFrame
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 15, 0, 0)
            Label.Size = UDim2.new(0.7, 0, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = NeverloseUI.Themes.TextColor
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local ColorDisplay = Instance.new("Frame")
            ColorDisplay.Parent = ColorFrame
            ColorDisplay.BackgroundColor3 = config.Color or Color3.fromRGB(255, 255, 255)
            ColorDisplay.BorderSizePixel = 0
            ColorDisplay.Position = UDim2.new(1, -40, 0.5, -12)
            ColorDisplay.Size = UDim2.new(0, 28, 0, 24)
            Instance.new("UICorner", ColorDisplay).CornerRadius = UDim.new(0, 4)
            
            local ColorStroke = Instance.new("UIStroke")
            ColorStroke.Color = NeverloseUI.Themes.StrokeColor
            ColorStroke.Thickness = 1
            ColorStroke.Parent = ColorDisplay
            
            return {
                Set = function(color)
                    ColorDisplay.BackgroundColor3 = color
                    if config.Callback then config.Callback(color) end
                end
            }
        end
        
        table.insert(Window.Tabs, Tab)
        
        if #Window.Tabs == 1 then
            Tween(TabButton, {
                BackgroundColor3 = NeverloseUI.Themes.MainColor,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0)
            TabContent.Visible = true
            Window.CurrentTab = Tab
        end
        
        return Tab
    end
    
    function Window:Notify(config)
        local Notif = Instance.new("Frame")
        Notif.Name = "Notification"
        Notif.Parent = ScreenGui
        Notif.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        Notif.BorderSizePixel = 0
        Notif.Position = UDim2.new(1, -350, 1, 10)
        Notif.Size = UDim2.new(0, 340, 0, 85)
        Notif.ZIndex = 200
        Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 8)
        
        local Accent = Instance.new("Frame")
        Accent.Parent = Notif
        Accent.BackgroundColor3 = NeverloseUI.Themes.MainColor
        Accent.BorderSizePixel = 0
        Accent.Size = UDim2.new(0, 4, 1, 0)
        
        local Title = Instance.new("TextLabel")
        Title.Parent = Notif
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0, 15, 0, 10)
        Title.Size = UDim2.new(1, -30, 0, 22)
        Title.Font = Enum.Font.GothamBold
        Title.Text = config.Title
        Title.TextColor3 = Color3.fromRGB(230, 230, 240)
        Title.TextSize = 15
        Title.TextXAlignment = Enum.TextXAlignment.Left
        
        local Content = Instance.new("TextLabel")
        Content.Parent = Notif
        Content.BackgroundTransparency = 1
        Content.Position = UDim2.new(0, 15, 0, 35)
        Content.Size = UDim2.new(1, -30, 1, -45)
        Content.Font = Enum.Font.Gotham
        Content.Text = config.Content
        Content.TextColor3 = Color3.fromRGB(180, 180, 195)
        Content.TextSize = 13
        Content.TextXAlignment = Enum.TextXAlignment.Left
        Content.TextWrapped = true
        
        Tween(Notif, {Position = UDim2.new(1, -350, 1, -95)}, 0.4)
        
        task.delay(config.Duration or 3, function()
            Tween(Notif, {Position = UDim2.new(1, -350, 1, 10)}, 0.3)
            task.wait(0.3)
            Notif:Destroy()
        end)
    end
    
    return Window
end

return NeverloseUI
