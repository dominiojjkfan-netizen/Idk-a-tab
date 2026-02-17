-- UILibrary.lua

local UILibrary = {}

function UILibrary.newWindow(title)
    local window = Instance.new('ScreenGui')
    local frame = Instance.new('Frame')
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.Parent = window

    -- Add title
    local titleLabel = Instance.new('TextLabel')
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Text = title
    titleLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    titleLabel.Parent = frame

    -- Draggable
    local dragging = false
    local dragInput, startPos
    titleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            startPos = input.Position
            dragInput = input
        end
    end)

    titleLabel.InputEnded:Connect(function()
        dragging = false
    end)

    game:GetService('UserInputService').InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startPos
            frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset + delta.X, frame.Position.Y.Scale, frame.Position.Y.Offset + delta.Y)
        end
    end)

    return window
end

function UILibrary.newTab(window, title)
    local tabButton = Instance.new('TextButton')
    tabButton.Size = UDim2.new(0.1, 0, 0, 30)
    tabButton.Text = title
    tabButton.Parent = window
end

function UILibrary.newButton(parent, title, callback)
    local button = Instance.new('TextButton')
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Text = title
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
end

function UILibrary.newToggle(parent, title, initialValue, callback)
    local toggle = Instance.new('TextButton')
    toggle.Size = UDim2.new(0, 100, 0, 50)
    toggle.Text = title .. ': ' .. tostring(initialValue)
    toggle.Parent = parent
    
toggle.MouseButton1Click:Connect(function() 
        initialValue = not initialValue 
        toggle.Text = title .. ': ' .. tostring(initialValue)
        callback(initialValue) 
    end)
end

function UILibrary.newSlider(parent, title, min, max, callback)
    local slider = Instance.new('Frame')
    slider.Size = UDim2.new(0, 300, 0, 50)
    slider.Parent = parent

    local label = Instance.new('TextLabel')
    label.Text = title .. ': ' .. min
    label.Parent = slider

    local bar = Instance.new('Frame')
    bar.Size = UDim2.new(1, 0, 0, 10)
    bar.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    bar.Parent = slider

    local knob = Instance.new('Frame')
    knob.Size = UDim2.new(0, 10, 0, 10)
    knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    knob.Parent = bar

    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            while input.UserInputState == Enum.UserInputState.Begin do
                local value = math.clamp(math.floor((knob.Position.X.Scale + input.Position.X) / bar.Size.X.Scale * (max-min) + min), min, max)
                label.Text = title .. ': ' .. value
                callback(value)
                wait()
            end
        end
    end)
end

function UILibrary.newDropdown(parent, title, items, callback)
    local dropdown = Instance.new('Frame')
    dropdown.Size = UDim2.new(0, 100, 0, 50)
    dropdown.Parent = parent

    local label = Instance.new('TextLabel')
    label.Text = title
    label.Parent = dropdown

    -- Additional dropdown logic goes here --
end

function UILibrary.newLabel(parent, title)
    local label = Instance.new('TextLabel')
    label.Text = title
    label.Parent = parent
end

function UILibrary.newKeybind(parent, title, callback)
    local keybindButton = Instance.new('TextButton')
    keybindButton.Size = UDim2.new(0, 100, 0, 50)
    keybindButton.Text = title .. ': Press any key'
    keybindButton.Parent = parent

    keybindButton.MouseButton1Click:Connect(function()
        game:GetService('UserInputService').InputBegan:Wait()
        keybindButton.Text = title .. ': Bind set'
        callback()
    end)
end

return UILibrary