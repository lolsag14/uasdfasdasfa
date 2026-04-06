-- NEVERLOSE UI - ПРАВИЛЬНАЯ ВЕРСИЯ
-- 2 колонки контента (Left/Right), компактные элементы

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local UI = {}
UI.Themes = {
    Background = Color3.fromRGB(15, 15, 18),
    Sidebar = Color3.fromRGB(20, 20, 24),
    Section = Color3.fromRGB(10, 10, 16),
    Accent = Color3.fromRGB(0, 172, 255),
    Stroke = Color3.fromRGB(28, 28, 32),
    Text = Color3.fromRGB(200, 200, 210)
}

local function Tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad), props):Play()
end

function UI:CreateWindow(config)
    local Window = {}
    
    local old = CoreGui:FindFirstChild("NeverloseUI")
    if old then old:Destroy() end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NeverloseUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main
    local Main = Instance.new("Frame")
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = UI.Themes.Background
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, -450, 0.5, -300)
    Main.Size = UDim2.new(0, 900, 0, 600)
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 4)
    
    -- Shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Parent = Main
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -15, 0, -15)
    Shadow.Size = UDim2.new(1, 30, 1, 30)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.4
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    -- Header
    local Header = Instance.new("Frame")
    Header.Parent = Main
    Header.BackgroundTransparency = 1
    Header.Size = UDim2.new(1, 0, 0, 70)
    
    local Title = Instance.new("TextLabel")
    Title.Parent = Header
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 25, 0, 15)
    Title.Size = UDim2.new(0, 400, 0, 28)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Name or "Universal Silent Aim"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 22
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Parent = Header
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 25, 0, 45)
    Subtitle.Size = UDim2.new(0, 300, 0, 16)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = config.LoadingSubtitle or "by Praroditel"
    Subtitle.TextColor3 = Color3.fromRGB(120, 120, 130)
    Subtitle.TextSize = 12
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Accent line
    local Line = Instance.new("Frame")
    Line.Parent = Main
    Line.BackgroundColor3 = UI.Themes.Accent
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 0, 70)
    Line.Size = UDim2.new(1, 0, 0, 2)
    
    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = UI.Themes.Sidebar
    Sidebar.BorderSizePixel = 0
    Sidebar.Position = UDim2.new(0, 0, 0, 72)
    Sidebar.Size = UDim2.new(0, 200, 1, -72)
    
    local TabList = Instance.new("UIListLayout")
    TabList.Parent = Sidebar
    TabList.Padding = UDim.new(0, 3)
    TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    Instance.new("UIPadding", Sidebar).PaddingTop = UDim.new(0, 10)
    
    -- User info
    local UserFrame = Instance.new("Frame")
    UserFrame.Parent = Sidebar
    UserFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0, 8, 1, -70)
    UserFrame.Size = UDim2.new(1, -16, 0, 62)
    UserFrame.ZIndex = 10
    Instance.new("UICorner", UserFrame).CornerRadius = UDim.new(0, 6)
    
    local Avatar = Instance.new("ImageLabel")
    Avatar.Parent = UserFrame
    Avatar.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Avatar.BorderSizePixel = 0
    Avatar.Position = UDim2.new(0, 10, 0.5, -20)
    Avatar.Size = UDim2.new(0, 40, 0, 40)
    Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)
    pcall(function()
        Avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    end)
    
    local Username = Instance.new("TextLabel")
    Username.Parent = UserFrame
    Username.BackgroundTransparency = 1
    Username.Position = UDim2.new(0, 56, 0, 10)
    Username.Size = UDim2.new(1, -66, 0, 16)
    Username.Font = Enum.Font.GothamSemibold
    Username.Text = LocalPlayer.Name
    Username.TextColor3 = Color3.fromRGB(210, 210, 220)
    Username.TextSize = 13
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.TextTruncate = Enum.TextTruncate.AtEnd
    
    local Status = Instance.new("TextLabel")
    Status.Parent = UserFrame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 56, 0, 30)
    Status.Size = UDim2.new(1, -66, 0, 14)
    Status.Font = Enum.Font.Gotham
    Status.Text = "Premium User"
    Status.TextColor3 = UI.Themes.Accent
    Status.TextSize = 10
    Status.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Content area
    local ContentArea = Instance.new("Frame")
    ContentArea.Parent = Main
    ContentArea.BackgroundTransparency = 1
    ContentArea.Position = UDim2.new(0, 200, 0, 72)
    ContentArea.Size = UDim2.new(1, -200, 1, -72)
    
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
    
    function Window:CreateTab(name, icon)
        local Tab = {}
        
        -- Tab button
        local TabBtn = Instance.new("TextButton")
        TabBtn.Name = name
        TabBtn.Parent = Sidebar
        TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        TabBtn.BorderSizePixel = 0
        TabBtn.Size = UDim2.new(0, 184, 0, 38)
        TabBtn.Font = Enum.Font.GothamSemibold
        TabBtn.Text = name
        TabBtn.TextColor3 = Color3.fromRGB(140, 140, 150)
        TabBtn.TextSize = 13
        TabBtn.AutoButtonColor = false
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 4)
        
        -- Tab content (2 columns)
        local TabContent = Instance.new("Frame")
        TabContent.Name = name .. "Content"
        TabContent.Parent = ContentArea
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false
        
        -- Left column
        local Left = Instance.new("ScrollingFrame")
        Left.Name = "Left"
        Left.Parent = TabContent
        Left.Active = true
        Left.BackgroundTransparency = 1
        Left.BorderSizePixel = 0
        Left.Position = UDim2.new(0, 10, 0, 10)
        Left.Size = UDim2.new(0.5, -15, 1, -20)
        Left.CanvasSize = UDim2.new(0, 0, 0, 0)
        Left.ScrollBarThickness = 3
        Left.ScrollBarImageColor3 = UI.Themes.Accent
        
        local LeftList = Instance.new("UIListLayout")
        LeftList.Parent = Left
        LeftList.Padding = UDim.new(0, 8)
        LeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Left.CanvasSize = UDim2.new(0, 0, 0, LeftList.AbsoluteContentSize.Y + 10)
        end)
        
        -- Right column
        local Right = Instance.new("ScrollingFrame")
        Right.Name = "Right"
        Right.Parent = TabContent
        Right.Active = true
        Right.BackgroundTransparency = 1
        Right.BorderSizePixel = 0
        Right.Position = UDim2.new(0.5, 5, 0, 10)
        Right.Size = UDim2.new(0.5, -15, 1, -20)
        Right.CanvasSize = UDim2.new(0, 0, 0, 0)
        Right.ScrollBarThickness = 3
        Right.ScrollBarImageColor3 = UI.Themes.Accent
        
        local RightList = Instance.new("UIListLayout")
        RightList.Parent = Right
        RightList.Padding = UDim.new(0, 8)
        RightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Right.CanvasSize = UDim2.new(0, 0, 0, RightList.AbsoluteContentSize.Y + 10)
        end)
        
        -- Tab click
        TabBtn.MouseButton1Click:Connect(function()
            for _, tab in pairs(Window.Tabs) do
                tab.Content.Visible = false
                Tween(tab.Button, {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 30),
                    TextColor3 = Color3.fromRGB(140, 140, 150)
                }, 0.2)
            end
            
            TabContent.Visible = true
            Tween(TabBtn, {
                BackgroundColor3 = UI.Themes.Accent,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0.2)
        end)
        
        Tab.Button = TabBtn
        Tab.Content = TabContent
        Tab.Left = Left
        Tab.Right = Right
        
        -- Helper to get parent
        local function GetParent(side)
            return side == "left" and Left or Right
        end
        
        -- UI Elements
        function Tab:CreateSection(name)
            local Section = Instance.new("TextLabel")
            Section.Name = name
            Section.Parent = Left  -- Добавляем в Left по умолчанию
            Section.BackgroundTransparency = 1
            Section.Size = UDim2.new(1, 0, 0, 30)
            Section.Font = Enum.Font.GothamBold
            Section.Text = name
            Section.TextColor3 = Color3.fromRGB(210, 210, 220)
            Section.TextSize = 14
            Section.TextXAlignment = Enum.TextXAlignment.Left
            
            local Line = Instance.new("Frame")
            Line.Parent = Section
            Line.BackgroundColor3 = UI.Themes.Accent
            Line.BorderSizePixel = 0
            Line.Position = UDim2.new(0, 0, 1, -2)
            Line.Size = UDim2.new(1, 0, 0, 2)
            
            return Section
        end
        
        function Tab:CreateToggle(config)
            local parent = GetParent(config.Parent or "left")
            
            local Toggle = Instance.new("Frame")
            Toggle.Name = config.Name
            Toggle.Parent = parent
            Toggle.BackgroundTransparency = 1
            Toggle.Size = UDim2.new(1, 0, 0, 24)
            
            local Label = Instance.new("TextLabel")
            Label.Parent = Toggle
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, -35, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            -- Простой чекбокс (не круглый)
            local Box = Instance.new("Frame")
            Box.Parent = Toggle
            Box.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
            Box.BorderSizePixel = 0
            Box.Position = UDim2.new(1, -22, 0.5, -9)
            Box.Size = UDim2.new(0, 18, 0, 18)
            Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 2)
            
            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = Color3.fromRGB(50, 50, 58)
            BoxStroke.Thickness = 1
            BoxStroke.Parent = Box
            
            local Check = Instance.new("ImageLabel")
            Check.Parent = Box
            Check.BackgroundTransparency = 1
            Check.Size = UDim2.new(1, 0, 1, 0)
            Check.Image = "rbxassetid://3926305904"
            Check.ImageRectOffset = Vector2.new(312, 4)
            Check.ImageRectSize = Vector2.new(24, 24)
            Check.ImageColor3 = UI.Themes.Accent
            Check.Visible = false
            
            local State = config.CurrentValue or false
            
            local function Update()
                if State then
                    Check.Visible = true
                    Box.BackgroundColor3 = Color3.fromRGB(12, 18, 66)
                    Label.TextTransparency = 0
                else
                    Check.Visible = false
                    Box.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
                    Label.TextTransparency = 0.3
                end
            end
            
            Update()
            
            local Btn = Instance.new("TextButton")
            Btn.Parent = Toggle
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
            local parent = GetParent(config.Parent or "left")
            
            local Slider = Instance.new("Frame")
            Slider.Name = config.Name
            Slider.Parent = parent
            Slider.BackgroundTransparency = 1
            Slider.Size = UDim2.new(1, 0, 0, 50)
            
            local Label = Instance.new("TextLabel")
            Label.Parent = Slider
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 0, 0, 4)
            Label.Size = UDim2.new(0.6, 0, 0, 16)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Parent = Slider
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Position = UDim2.new(0.6, 0, 0, 4)
            ValueLabel.Size = UDim2.new(0.4, 0, 0, 16)
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextColor3 = UI.Themes.Accent
            ValueLabel.TextSize = 12
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            
            local SliderBG = Instance.new("Frame")
            SliderBG.Parent = Slider
            SliderBG.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
            SliderBG.BorderSizePixel = 0
            SliderBG.Position = UDim2.new(0, 0, 1, -16)
            SliderBG.Size = UDim2.new(1, 0, 0, 5)
            Instance.new("UICorner", SliderBG).CornerRadius = UDim.new(1, 0)
            
            local Fill = Instance.new("Frame")
            Fill.Parent = SliderBG
            Fill.BackgroundColor3 = UI.Themes.Accent
            Fill.BorderSizePixel = 0
            Fill.Size = UDim2.new(0.5, 0, 1, 0)
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            
            local Drag = Instance.new("Frame")
            Drag.Parent = SliderBG
            Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Drag.BorderSizePixel = 0
            Drag.Position = UDim2.new(0.5, -5, 0.5, -5)
            Drag.Size = UDim2.new(0, 10, 0, 10)
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
                Drag.Position = UDim2.new(Percent, -5, 0.5, -5)
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
            local parent = GetParent(config.Parent or "left")
            
            local Drop = Instance.new("Frame")
            Drop.Name = config.Name
            Drop.Parent = parent
            Drop.BackgroundTransparency = 1
            Drop.Size = UDim2.new(1, 0, 0, 40)
            
            local Label = Instance.new("TextLabel")
            Label.Parent = Drop
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(0.4, 0, 0, 16)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local Btn = Instance.new("TextButton")
            Btn.Parent = Drop
            Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
            Btn.BorderSizePixel = 0
            Btn.Position = UDim2.new(0.42, 0, 0, 0)
            Btn.Size = UDim2.new(0.58, 0, 0, 24)
            Btn.Font = Enum.Font.Gotham
            Btn.Text = (config.CurrentOption and config.CurrentOption[1]) or "Select"
            Btn.TextColor3 = Color3.fromRGB(180, 180, 190)
            Btn.TextSize = 11
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 3)
            
            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Color = Color3.fromRGB(50, 50, 58)
            BtnStroke.Thickness = 0.5
            BtnStroke.Parent = Btn
            
            local List = Instance.new("Frame")
            List.Parent = ScreenGui
            List.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            List.BorderSizePixel = 0
            List.Size = UDim2.new(0, 180, 0, 0)
            List.Visible = false
            List.ZIndex = 100
            Instance.new("UICorner", List).CornerRadius = UDim.new(0, 4)
            
            local ListLayout = Instance.new("UIListLayout")
            ListLayout.Parent = List
            ListLayout.Padding = UDim.new(0, 2)
            
            Instance.new("UIPadding", List).PaddingTop = UDim.new(0, 4)
            Instance.new("UIPadding", List).PaddingBottom = UDim.new(0, 4)
            Instance.new("UIPadding", List).PaddingLeft = UDim.new(0, 4)
            Instance.new("UIPadding", List).PaddingRight = UDim.new(0, 4)
            
            local CurrentOption = config.CurrentOption or {""}
            
            local function UpdateList()
                for _, child in pairs(List:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                
                for _, option in pairs(config.Options or {}) do
                    local OptBtn = Instance.new("TextButton")
                    OptBtn.Name = option
                    OptBtn.Parent = List
                    OptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
                    OptBtn.BorderSizePixel = 0
                    OptBtn.Size = UDim2.new(1, -8, 0, 28)
                    OptBtn.Font = Enum.Font.Gotham
                    OptBtn.Text = option
                    OptBtn.TextColor3 = Color3.fromRGB(190, 190, 200)
                    OptBtn.TextSize = 11
                    OptBtn.AutoButtonColor = false
                    Instance.new("UICorner", OptBtn).CornerRadius = UDim.new(0, 3)
                    
                    OptBtn.MouseEnter:Connect(function()
                        Tween(OptBtn, {BackgroundColor3 = UI.Themes.Accent}, 0.15)
                    end)
                    
                    OptBtn.MouseLeave:Connect(function()
                        Tween(OptBtn, {BackgroundColor3 = Color3.fromRGB(28, 28, 34)}, 0.15)
                    end)
                    
                    OptBtn.MouseButton1Click:Connect(function()
                        Btn.Text = option
                        CurrentOption = {option}
                        List.Visible = false
                        if config.Callback then config.Callback({option}) end
                    end)
                end
                
                List.Size = UDim2.new(0, 180, 0, math.min(#config.Options * 30 + 8, 220))
            end
            
            UpdateList()
            
            Btn.MouseButton1Click:Connect(function()
                List.Visible = not List.Visible
                if List.Visible then
                    local BtnPos = Btn.AbsolutePosition
                    List.Position = UDim2.new(0, BtnPos.X, 0, BtnPos.Y + 26)
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
            local parent = GetParent(config.Parent or "left")
            
            local Btn = Instance.new("TextButton")
            Btn.Name = config.Name
            Btn.Parent = parent
            Btn.BackgroundColor3 = UI.Themes.Accent
            Btn.BorderSizePixel = 0
            Btn.Size = UDim2.new(1, 0, 0, 36)
            Btn.Font = Enum.Font.GothamBold
            Btn.Text = config.Name
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextSize = 13
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
            
            Btn.MouseEnter:Connect(function()
                Tween(Btn, {BackgroundColor3 = Color3.fromRGB(10, 150, 220)}, 0.15)
            end)
            
            Btn.MouseLeave:Connect(function()
                Tween(Btn, {BackgroundColor3 = UI.Themes.Accent}, 0.15)
            end)
            
            Btn.MouseButton1Click:Connect(function()
                if config.Callback then config.Callback() end
            end)
        end
        
        function Tab:CreateLabel(text)
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Left
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, 0, 0, 20)
            Label.Font = Enum.Font.ArialBold
            Label.Text = text
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 11
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.5
            
            return Label
        end
        
        function Tab:CreateKeybind(config)
            local parent = GetParent(config.Parent or "left")
            
            local Key = Instance.new("Frame")
            Key.Name = config.Name
            Key.Parent = parent
            Key.BackgroundTransparency = 1
            Key.Size = UDim2.new(1, 0, 0, 32)
            
            local Label = Instance.new("TextLabel")
            Label.Parent = Key
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(0.5, 0, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local KeyBtn = Instance.new("TextButton")
            KeyBtn.Parent = Key
            KeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
            KeyBtn.BorderSizePixel = 0
            KeyBtn.Position = UDim2.new(0.52, 0, 0.5, -12)
            KeyBtn.Size = UDim2.new(0.48, 0, 0, 24)
            KeyBtn.Font = Enum.Font.Gotham
            KeyBtn.Text = config.CurrentKeybind or "None"
            KeyBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
            KeyBtn.TextSize = 11
            KeyBtn.AutoButtonColor = false
            Instance.new("UICorner", KeyBtn).CornerRadius = UDim.new(0, 3)
            
            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Color = Color3.fromRGB(50, 50, 58)
            BtnStroke.Thickness = 0.5
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
            local parent = GetParent(config.Parent or "left")
            
            local Para = Instance.new("Frame")
            Para.Name = config.Title
            Para.Parent = parent
            Para.BackgroundTransparency = 1
            Para.Size = UDim2.new(1, 0, 0, 60)
            
            local Title = Instance.new("TextLabel")
            Title.Parent = Para
            Title.BackgroundTransparency = 1
            Title.Size = UDim2.new(1, 0, 0, 18)
            Title.Font = Enum.Font.GothamBold
            Title.Text = config.Title
            Title.TextColor3 = Color3.fromRGB(200, 200, 210)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left
            
            local Content = Instance.new("TextLabel")
            Content.Parent = Para
            Content.BackgroundTransparency = 1
            Content.Position = UDim2.new(0, 0, 0, 22)
            Content.Size = UDim2.new(1, 0, 1, -22)
            Content.Font = Enum.Font.Gotham
            Content.Text = config.Content
            Content.TextColor3 = Color3.fromRGB(150, 150, 160)
            Content.TextSize = 11
            Content.TextXAlignment = Enum.TextXAlignment.Left
            Content.TextYAlignment = Enum.TextYAlignment.Top
            Content.TextWrapped = true
        end
        
        function Tab:CreateInput(config)
            local parent = GetParent(config.Parent or "left")
            
            local Input = Instance.new("Frame")
            Input.Name = config.Name
            Input.Parent = parent
            Input.BackgroundTransparency = 1
            Input.Size = UDim2.new(1, 0, 0, 50)
            
            local Label = Instance.new("TextLabel")
            Label.Parent = Input
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0, 0, 0, 4)
            Label.Size = UDim2.new(1, 0, 0, 16)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local Box = Instance.new("TextBox")
            Box.Parent = Input
            Box.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
            Box.BorderSizePixel = 0
            Box.Position = UDim2.new(0, 0, 0, 24)
            Box.Size = UDim2.new(1, 0, 0, 22)
            Box.Font = Enum.Font.Gotham
            Box.PlaceholderText = config.PlaceholderText or ""
            Box.Text = ""
            Box.TextColor3 = Color3.fromRGB(190, 190, 200)
            Box.TextSize = 11
            Box.ClearTextOnFocus = false
            Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 3)
            
            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = Color3.fromRGB(50, 50, 58)
            BoxStroke.Thickness = 0.5
            BoxStroke.Parent = Box
            
            local Padding = Instance.new("UIPadding")
            Padding.Parent = Box
            Padding.PaddingLeft = UDim.new(0, 6)
            
            Box.FocusLost:Connect(function()
                if config.Callback then config.Callback(Box.Text) end
            end)
            
            return {
                Set = function(text)
                    Box.Text = text
                end,
                CurrentValue = Box.Text
            }
        end
        
        function Tab:CreateColorPicker(config)
            local parent = GetParent(config.Parent or "left")
            
            local Picker = Instance.new("Frame")
            Picker.Name = config.Name
            Picker.Parent = parent
            Picker.BackgroundTransparency = 1
            Picker.Size = UDim2.new(1, 0, 0, 28)
            
            local Label = Instance.new("TextLabel")
            Label.Parent = Picker
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(0.7, 0, 1, 0)
            Label.Font = Enum.Font.ArialBold
            Label.Text = config.Name
            Label.TextColor3 = UI.Themes.Text
            Label.TextSize = 12
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0.3
            
            local Color = Instance.new("Frame")
            Color.Parent = Picker
            Color.BackgroundColor3 = config.Color or Color3.fromRGB(255, 255, 255)
            Color.BorderSizePixel = 0
            Color.Position = UDim2.new(1, -26, 0.5, -10)
            Color.Size = UDim2.new(0, 24, 0, 20)
            Instance.new("UICorner", Color).CornerRadius = UDim.new(0, 3)
            
            local ColorStroke = Instance.new("UIStroke")
            ColorStroke.Color = Color3.fromRGB(50, 50, 58)
            ColorStroke.Thickness = 1
            ColorStroke.Parent = Color
            
            return {
                Set = function(color)
                    Color.BackgroundColor3 = color
                    if config.Callback then config.Callback(color) end
                end
            }
        end
        
        table.insert(Window.Tabs, Tab)
        
        if #Window.Tabs == 1 then
            Tween(TabBtn, {
                BackgroundColor3 = UI.Themes.Accent,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0)
            TabContent.Visible = true
        end
        
        return Tab
    end
    
    function Window:Notify(config)
        local Notif = Instance.new("Frame")
        Notif.Parent = ScreenGui
        Notif.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
        Notif.BorderSizePixel = 0
        Notif.Position = UDim2.new(1, -340, 1, 10)
        Notif.Size = UDim2.new(0, 330, 0, 80)
        Notif.ZIndex = 200
        Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 6)
        
        local Accent = Instance.new("Frame")
        Accent.Parent = Notif
        Accent.BackgroundColor3 = UI.Themes.Accent
        Accent.BorderSizePixel = 0
        Accent.Size = UDim2.new(0, 4, 1, 0)
        
        local Title = Instance.new("TextLabel")
        Title.Parent = Notif
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0, 12, 0, 8)
        Title.Size = UDim2.new(1, -24, 0, 20)
        Title.Font = Enum.Font.GothamBold
        Title.Text = config.Title
        Title.TextColor3 = Color3.fromRGB(220, 220, 230)
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Left
        
        local Content = Instance.new("TextLabel")
        Content.Parent = Notif
        Content.BackgroundTransparency = 1
        Content.Position = UDim2.new(0, 12, 0, 32)
        Content.Size = UDim2.new(1, -24, 1, -40)
        Content.Font = Enum.Font.Gotham
        Content.Text = config.Content
        Content.TextColor3 = Color3.fromRGB(170, 170, 180)
        Content.TextSize = 12
        Content.TextXAlignment = Enum.TextXAlignment.Left
        Content.TextWrapped = true
        
        Tween(Notif, {Position = UDim2.new(1, -340, 1, -90)}, 0.3)
        
        task.delay(config.Duration or 3, function()
            Tween(Notif, {Position = UDim2.new(1, -340, 1, 10)}, 0.3)
            task.wait(0.3)
            Notif:Destroy()
        end)
    end
    
    return Window
end

return UI
