-- LOVE metroidvania

grav = 15

function love.load()
    
    sti = require('lib.sti')
    
    map = sti('Assets/Maps/lua/areas/1/a1r1.lua', { 'box2d' })
    
    world = love.physics.newWorld(0,0)
    
    map:box2d_init(world)
    
    playerScript = require('scripts.player')
    player.load()
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0, 1, 0.5)
    map:draw()
    player.draw()
    
    map:box2d_draw()
    
end

function love.update(dt)
    map:update(dt)
    player.update(dt)
end