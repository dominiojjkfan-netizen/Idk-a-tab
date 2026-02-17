-- Enhanced UILibrary.lua

local UILibrary = {}

-- Create a new UI section
function UILibrary.createSection(name)
    local section = {}  -- Initialize a new section
    section.name = name
    return section
end

-- Improved text input function
function UILibrary.createTextInput(placeholder)
    local input = { placeholder = placeholder, text = "" }
    function input:setText(newText)
        self.text = newText
    end
    return input
end

-- Styling function to apply styles
function UILibrary.applyStyle(element, style)
    for key, value in pairs(style) do
        element[key] = value  -- Apply each style property
    end
end

-- Example usage
local mainSection = UILibrary.createSection("Main Section")
local textInput = UILibrary.createTextInput("Enter your text...")
local style = { color = "#FFFFFF", backgroundColor = "#000000", fontSize = 14 }
UILibrary.applyStyle(textInput, style)

return UILibrary
