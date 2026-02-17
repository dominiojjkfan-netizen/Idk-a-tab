-- Enhanced Example Usage

local UILibrary = require(script.Parent:WaitForChild("UILibrary"))

-- Create main window
local window = UILibrary.createWindow("My UI Library", 600, 500)

-- Create sections
window:createSection("Settings")

-- Create buttons
window:createButton("Click Me!", function()
    print("Button clicked!")
end, Color3.fromRGB(66, 135, 245))

-- Create toggle
window:createToggle("Enable Feature", true, function(state)
    print("Toggle state:", state)
end)

-- Create slider
window:createSlider("Volume", 0, 100, 50, function(value)
    print("Slider value:", value)
end)

-- Create dropdown
window:createDropdown("Select Option", {"Option 1", "Option 2", "Option 3"}, function(selected)
    print("Selected:", selected)
end)

-- Create text input
window:createTextInput("Enter text here…", function(text)
    print("Text entered:", text)
end)

-- Create label
window:createLabel("This is a paragraph/label element that can display information to the user.")

-- Create keybind
window:createKeybind("Open Menu", function(keyCode)
    print("Keybind set to:", keyCode)
end)