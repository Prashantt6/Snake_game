-- -- -- Variables
-- -- local number = 69
-- -- local float = 3.14
-- -- local string = "Hello my name is Prashant "
-- -- local boolean = true 
-- -- local nilValue = nil
-- -- print (number)
-- -- print (nilValue) print (100)
-- -- print(string)
-- -- print(number,string)

-- -- -- tables 
-- -- local array = {1,2 ,3 , "four"}
-- -- local dictionary = { name = "Prashant ",age = 19 }

-- -- for i, v in ipair(array) do 
-- --     print(i,v)
-- -- end


-- -- ###### LOVE-2D ###########


-- -- function love.load()
-- --     -- Initialization 
-- --     love.graphics.setBackgroundColor(0.1,0.1,0.2)
-- --     player = { x = 100, y = 100, size = 20}
-- -- end
-- -- function love.update(dt)
-- --     -- Game logic 
-- --     if(love.keyboard.isDown("right")) then
-- --         player.x = player.x + 200*dt
-- --     end 
-- --     if(love.keyboard.isDown("left")) then 
-- --         player.x = player.x - 200*dt
-- --     end
-- --     if(love.keyboard.isDown("up")) then 
-- --         player.y = player.y - 200*dt
-- --     end
-- --     if(love.keyboard.isDown("down")) then 
-- --         player.y = player.y + 200*dt
-- --     end
-- -- end 

-- -- function love.draw()
-- --     -- Drawing the player
-- --     love.graphics.setColor(1,0,0)
-- --     love.graphics.circle("fill", player.x , player.y, player.size)
-- -- end
-- -- function love.draw()
-- --     love.graphics.setColor(0,0,1)
-- --     love.graphics.rectangle("fill", 100 ,100 ,100,80)


-- --     love.graphics.setColor(0.1,1.0,0.1)
-- --     love.graphics.circle("line", player.x, player.y, 50)

-- --     love.graphics.setColor(1,1,1)
-- --     love.graphics.print("Hello this love2D" , 100 ,80)
-- -- end
-- -- function love.keypressed(key)
-- --     if key == "space" then 
-- --         print("Space was pressed")
-- --     elseif key == "escape" then 
-- --         love.event.quit()

-- --     end

-- -- end
-- local circle1 = {x = 100 , y = 100, radius = 30 ,speed = 100}
-- local circle2 = {x = 100 , y = 600, radius = 30 ,speed = 300}
 
-- -- function love.update(dt)
--     -- circle1.x= circle1.x  + circle1.speed*dt

--     -- if circle1.x> love.graphics.getWidth() then 
--     --     circle1.x = -circle1.radius
--     -- end 
--     --  circle2.y= circle2.y  - circle2.speed*dt

--     -- if circle2.y> love.graphics.getWidth() then 
--     --     circle2.y = -circle2.radius
--     -- end 

-- local circle1 = {x = 100 , y = 100, radius = 30 ,speed = 100}
-- local circle2 = {x = 100 , y = 600, radius = 30 ,speed = 300}


-- function love.update(dt)

--     circle1.x = circle1.x + circle1.speed * dt
--     circle2.y = circle2.y - circle2.speed * dt

--      if circle1.x> love.graphics.getWidth() then 
--         circle1.x = -circle1.radius
--     end 
    
--     if circle2.y < -circle2.radius then 
--         circle2.y = love.graphics.getHeight() + circle2.radius
--     end
--     local dx = circle1.x - circle2.x
--     local dy = circle1.y - circle2.y
--     local distance = math.sqrt(dx * dx + dy * dy) 

--     if distance < circle1.radius + circle2.radius then 
--         love.event.quit()
--     end 
-- end 

-- function love.draw() 
--     love.graphics.circle("fill" , circle1.x , circle1.y , circle1.radius)
--     love.graphics.circle("fill", circle2.x, circle2.y, circle2.radius)
-- end
-- -- local image 
-- -- function love.load()
-- --     image = love.graphics.newImage("VK.png")
-- -- end 
-- -- function love.draw()
-- --     love.graphics.draw(image, -10 ,-10)
-- -- end
score = 0
function love.load()
    love.graphics.setBackgroundColor(0, 0, 0)
    snake = { x = 100, y = 100, size = 20 }
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
