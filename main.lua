-- LOVE metroidvania

grav = 15

function love.load()
    
    bump = require('lib.bump.bump')
    sti = require('lib.sti')
    
    map = sti('Assets/Maps/lua/areas/1/a1r1.lua', { 'bump' })
    
    world = bump.newWorld(64)
    
    playerScript = require('scripts.player')
    player:load()
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0, 1, 0.5)
    map:draw()
    player:draw()
    
end

function love.update(dt)
    map:update(dt)
    player:update(dt)
end