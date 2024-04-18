enemies = {}

math.randomseed(os.time())

function spawnEnemy()
    min = 10
    max = 1490
    randomNumber = min + math.random() * (max - min)

    if #enemies > 0 then
        lastEnemy = enemies[#enemies]
        while math.abs(randomNumber - lastEnemy.x) < 30 do
            randomNumber = min + math.random() * (max - min)
        end
    end

    enemy = {
        x = randomNumber,
        y = 250,
        isDead = false
    }
    table.insert(enemies, enemy)
end

local min = 4
local max = 5
local randomXPosition = min + math.random() * (max - min)
local timer = randomXPosition
enemiesNumber = 0

function enemies:update(dt)
    if enemiesNumber < 3 then
        if timer < 1 then
            spawnEnemy()
            timer = randomXPosition
            enemiesNumber = enemiesNumber + 1
        else
            timer = timer - 1 * dt
        end
    end
end

function enemies:draw()
    for k, v in ipairs(enemies) do
        if v.isDead == false then
            love.graphics.rectangle("fill", v.x, v.y, 100, 100)
        end
    end
end

return enemy
