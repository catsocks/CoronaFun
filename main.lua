-- Log "Hello, World!".
print("Hello, World!")

-- Make the background white.
display.setDefault("background", 255, 255, 255)

-- Create a retangle in the center of the screen, sized the 15th of the screen
-- width.
local rect = display.newRect(
    display.contentCenterX,
    display.contentCenterY,
    display.contentWidth / 15,
    display.contentWidth / 15
)

-- Make it blue.
rect.fill = {0, 0.5, 1}

-- Define a handler for key events.
local function onKeyEvent(event)
    local x = rect.x
    local y = rect.y

    -- Ignore if the key is being released.
    if (event.phase == "down") then
        if (event.keyName == "up") then
            y = y - rect.height
        elseif (event.keyName == "down") then
            y = y + rect.height
        elseif (event.keyName == "left") then
            x = x - rect.width
        elseif (event.keyName == "right") then
            x = x + rect.width
        end
    end

    -- Transition the rectangle to a new position.
    transition.to(rect, {time=100, transition=easing.inOutSine, y=y, x=x})
 
    -- This function should not override the OS's own key handler.
    return false
end

-- Add an event listener for key events.
Runtime:addEventListener("key", onKeyEvent)
