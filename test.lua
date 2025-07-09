

score = 0
function love.load()
    love.graphics.setBackgroundColor(0, 0, 0)
    snake = { x = 100, y = 100, size = 10 }
    food = {x = 300, y =400, size = 4}
    
end 

function love.update(dt) 
    if love.keyboard.isDown("right") then 
        snake.x = snake.x + 150 * dt
    end
    if love.keyboard.isDown("left") then 
        snake.x = snake.x - 150 * dt
    end
    if love.keyboard.isDown("up") then 
        snake.y = snake.y - 150 * dt
    end
    if love.keyboard.isDown("down") then 
        snake.y = snake.y + 150 * dt
    end

    local dx = snake.x - food.x
    local dy = snake.y - food.y
    local distance = math.sqrt(dx*dx + dy*dy)

    local screenwidth = love.graphics.getWidth()
    local screenheight = love.graphics.getHeight()

    if snake.x  > screenwidth then 
        snake.x = 0
    
    elseif snake.x  < 0 then
        snake.x = screenwidth
    end
    if snake.y  > screenheight then
        snake.y = 0
    elseif snake.y < 0 then
        snake.y = screenheight
    end

    -- local xnewPos = love.window.getPositon() * 0.10

    if distance < snake.size + food.size then 
        -- love.graphics.circle("fill", snake.x-snake.size, snake.y-snake.size, snake.size)
        local foodwidthdistance = love.graphics.getWidth()
        local foodheightdistance = love.graphics.getHeight()
        local randomX = love.math.random()
        local randomY = love.math.random()
    
        snake.size = snake.size + 5
        food.x = foodwidthdistance * randomX
        food.y = foodheightdistance * randomY
        score = score + 2
        
    end

end

function love.draw()
    love.graphics.print("Snake game" , 350 ,10)
    love.graphics.setColor(0,0,1)
    love.graphics.print("Score: ".. score,10,10)
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", snake.x, snake.y, snake.size)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill",food.x, food.y, food.size)
end
