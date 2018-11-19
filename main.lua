-- Log "Hello, World!".
print("Hello, World!")

-- Make the background white.
display.setDefault("background", 1, 1, 1)

-- Create a rectangle on each side of the screen.
local rectA = display.newRect(
    display.contentCenterX - display.contentCenterX / 4,
    display.contentCenterY,
    display.contentWidth / 15,
    display.contentWidth / 15
)

local rectB = display.newRect(
    display.contentCenterX + display.contentCenterX / 4,
    display.contentCenterY,
    display.contentWidth / 15,
    display.contentWidth / 15
)

-- Make one blue and the other green.
rectA.fill = {0, 0.5, 1}
rectB.fill = {0, 1, 0.5}

-- Define a handler for key events.
local function onKeyEvent(event)
    local x = rectA.x
    local y = rectA.y

    -- Ignore if the key is being released.
    if (event.phase == "down") then
        if (event.keyName == "up") then
            y = y - rectA.height
        elseif (event.keyName == "down") then
            y = y + rectA.height
        elseif (event.keyName == "left") then
            x = x - rectA.width
        elseif (event.keyName == "right") then
            x = x + rectA.width
        end
    end

    -- Transition the rectangle to a new position.
    transition.to(rectA, {time=100, transition=easing.inOutSine, y=y, x=x})
 
    -- This function should not override the OS's own key handler.
    return false
end

-- Add an event listener for key events.
Runtime:addEventListener("key", onKeyEvent)
