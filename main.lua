score = 0

function love.load()
    love.graphics.setBackgroundColor(0, 0, 0)
    snake = {x = 100, y = 100, width = 25, height = 25} 
    food = {x = 300, y = 400, size = 4}
    bigFont = love.graphics.newFont(26) -- 32 is the font size
    smallFont = love.graphics.newFont(18)
end

function love.update(dt)
    -- Movement handling
    local speed = 120 * dt
    if love.keyboard.isDown("right") then 
        snake.x = snake.x + speed
    elseif love.keyboard.isDown("left") then 
        snake.x = snake.x - speed
    elseif love.keyboard.isDown("up") then 
        snake.y = snake.y - speed
    elseif love.keyboard.isDown("down") then 
        snake.y = snake.y + speed
    end

    -- Screen wrap
    local screenW, screenH = love.graphics.getWidth(), love.graphics.getHeight()
    if snake.x > screenW then
        snake.x = 0
    elseif snake.x < 0 then
        snake.x = screenW
    end

    if snake.y > screenH then
        snake.y = 0
    elseif snake.y < 0 then
        snake.y = screenH
    end

    -- Collision detection
    local dx = snake.x - food.x
    local dy = snake.y - food.y
    local distance = math.sqrt(dx * dx + dy * dy)

    if distance < snake.width + food.size then 
        food.x = love.math.random(0, screenW-7)
        food.y = love.math.random(0, screenH-7)
        score = score + 2
    end
end

function love.draw()
    love.graphics.setColor(0.2,0.3,0.6)
    local screenHt = love.graphics.getHeight()
    local screenWt  = love.graphics.getWidth()
    love.graphics.rectangle("fill",0,0,screenWt,7)
    love.graphics.rectangle("fill",0,0,7,screenHt)
    love.graphics.rectangle("fill",screenWt-7,0,7,screenHt)
    love.graphics.rectangle("fill",0,screenHt-7,screenWt,7)

    love.graphics.setColor(1,1,0)
    love.graphics.setFont(bigFont)
    love.graphics.print("Snake game", 350, 10)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(smallFont)
    love.graphics.print("Score: " .. score, 10, 10)

    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", snake.x, snake.y, snake.width, snake.height)

    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", food.x, food.y, food.size)
end
