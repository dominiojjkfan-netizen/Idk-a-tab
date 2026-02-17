-- Example Usage of UILibrary

local UILibrary = require(game:GetService("ReplicatedStorage"):WaitForChild("UILibrary"))

local screen = UILibrary:CreateScreen("MainScreen")

screen:CreateLabel({
    Text = "Hello, World!",
    Position = UDim2.new(0.5, -50, 0.5, -20),
    Size = UDim2.new(0, 100, 0, 40)
})

screen:Show()