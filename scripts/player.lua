
player = {x = 0, y = 0, img = nil, onGround = false}

local yvel = 0
local xvel = 0

local jumpVel = 10
local jumpMax = 20

local speed = 5

local max = false

function player:load()
    player.img = love.graphics.newImage('Assets/player.png')
    
    world:add(player, player.x, player.y, 64, 64)
    
end

function player:draw()
    love.graphics.draw(player.img, player.x, player.y, 0, 2, 2)
end

function player:update(dt)
    
    if player.y < 600 - 64 then
        player.onGround = false
        yvel = yvel + grav * dt
    end
    
    if player.y >= 600 - 64 then
        player.onGround = true
        yvel = 0
    end
    
    if player.y > 600 - 64 then
        player.y = 600 - 64
    end
    
    if love.keyboard.isDown('d') then
        xvel = xvel + speed
    end
    if love.keyboard.isDown('a') then
        xvel = xvel - speed
    end
    
    if love.keyboard.isDown('space') and player.onGround then
        if yvel < jumpMax then
            yvel = -jumpVel
        end
    end
    
    player.y = player.y + yvel
    player.x = player.x + xvel
    
    world:update(player, player.x, player.y)
    
    xvel = 0
    
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
      love.event.quit()
    end
end

return player