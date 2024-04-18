camera = require "lib/camera"
gun = require "gun"
enemy = require "enemy"

windowWidth = 600
windowHeight = 600

mapwidth = 1500

-- game map height = 1500
-- game map width = 600


function love.load()
    love.window.setMode(windowWidth, windowHeight)
    love.graphics.setDefaultFilter("nearest", "nearest")

    cam = camera()
end

function love.update(dt)
    gun:update(dt)
    enemies:update(dt)
    cam:lookAt(gun.x, gun.y - 90)

    if love.keyboard.isDown("x") then
        gun:fireAnimation(dt)
        for k, v in ipairs(enemies) do
            if shootingPointX > v.x and shootingPointX < v.x + 100 then
                v.isDead = true
                enemiesNumber = enemiesNumber - 1
            end
        end
    end
end

function love.draw()
    cam:attach()
    love.graphics.draw(love.graphics.newImage("assets/background/background.jpeg"), 0, 0, 0, 7, 7)
    gun:draw()
    enemies:draw()
    cam:detach()
end