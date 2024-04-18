love.graphics.setDefaultFilter("nearest", "nearest")

gun = {}
gun.idleSprite = love.graphics.newImage("assets/gun/gun-idle.png")
gun.fireSprite = love.graphics.newImage("assets/gun/gun-fire.png")
gun.sprite = gun.idleSprite
gun.x = 80/7
gun.y = 385
gun.speed = 600
gun.vx = 0
gun.maxSpeed = 600

shootingPointX = 0


local minSpeed = 1

function gun:update(dt)
    if love.keyboard.isDown("right") and gun.vx < gun.maxSpeed then
        gun.vx = gun.vx + gun.speed * dt
    elseif love.keyboard.isDown("left") and gun.vx > -gun.maxSpeed then
        gun.vx = gun.vx - gun.speed * dt
    else
        if math.abs(gun.vx) < minSpeed then
            gun.vx = 0
        elseif gun.vx > 0 then
            gun.vx = gun.vx - gun.speed * dt
        elseif gun.vx < 0 then
            gun.vx = gun.vx + gun.speed * dt
        end
    end
    gun.x = gun.x + gun.vx * dt


    shootingPointX = gun.x - 10


    animationTimer = animationTimer - 1 * dt
end

animationTimer = 3
function gun:fireAnimation(dt)
    if animationTimer < 1 then
        gun.sprite = gun.fireSprite
        animationTimer = 3
        gun.sprite = gun.idleSprite
    end
end

function gun:draw()
    love.graphics.draw(gun.sprite, gun.x, gun.y, nil, 7, 7, 64/2, 64/2)
    love.graphics.print(gun.x, gun.x)
    -- love.graphics.rectangle("fill", shootingPointX, gun.y, 5, 5)
end

return gun