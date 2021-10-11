bg = "#FFF"
fg = "#000"
paddle1 = 225
paddle2 = 225
ball_x = 65
ball_y = 65
ball_x_speed = 4
ball_y_speed = 4
score1 = 0
score2 = 0
p1up = p1down = p2up = p2down = false
drawPongCanvas = () ->
    c = document.getElementById("PongCanvas")
    ctx = c.getContext("2d")
    ctx.fillStyle = bg
    ctx.fillRect(0,0,700,500)
    ctx.fillStyle = fg
    ctx.fillRect(50,paddle1,10,50)
    ctx.fillRect(640,paddle2,10,50)
    ctx.fillRect(ball_x,ball_y,10,10)
    ctx.font = "500 50px"
    ctx.fillText(score1,150,50)
    ctx.fillText(score2,500,50)

debugDraw = () ->
    paddle1 = document.getElementById("paddle1").value
    paddle2 = document.getElementById("paddle2").value
    ball_x = document.getElementById("ball_x").value
    ball_y = document.getElementById("ball_y").value
    do drawPongCanvas

###document.addEventListener('keydown', updatePaddlesDown)
document.addEventListener('keyup', updatePaddlesUp)

updatePaddlesDown = (key) ->
    console.log(key)
    switch key.keycode
        when 87 then p1up = true
        when 83 then p1down = true
        when 38 then p2up = true
        when 40 then p2down = true

updatePaddlesUp = (key) ->
    console.log(key)
    switch key.keycode
        when 87 then p1up = false
        when 83 then p1down = false
        when 38 then p2up = false
        when 40 then p2down = false###

document.onkeydown = ->
    if event.keyCode is 87 and paddle1 > 5
        paddle1 -= 10
    else if event.keyCode is 83 and paddle1 < 445
        paddle1 += 10
    if event.keyCode is 38 and paddle2 > 5
        paddle2 -= 10
    else if event.keyCode is 40 and paddle2 < 445
        paddle2 += 10

resetball = () ->
    ball_x = 75
    ball_y = 75
    ball_x_speed = 4
    ball_y_speed = 4    

updateGame = () -> 
    ###paddle1 update
    if p1up is true and paddle1 > 5
        paddle1 -= 5
    else if p1down is true and paddle1 < 445
        paddle1 += 5
    #paddle2 update
    if p2up is true and paddle2 > 5
        paddle2 -= 5
    else if p2down is true and paddle2 < 445
        paddle2 += 5###
    #top and bottom collision
    if ball_y < 5 or ball_y > 485
        ball_y_speed = -ball_y_speed
    #paddle1 hit
    if ball_x < 60 
        paddletop = paddle1 + 5
        paddlebottom = paddle1 + 55
        if paddletop < ball_y and paddlebottom > ball_y
            ball_x_speed = -ball_x_speed
        else 
            score2 += 1
            do resetball
    #paddle2 hit
    if ball_x > 635
        paddletop = paddle2 + 5
        paddlebottom = paddle2 + 55
        if paddletop < ball_y and paddlebottom > ball_y
            ball_x_speed = -ball_x_speed
        else 
            score1 += 1
            do resetball
    #ball update
    ball_x += ball_x_speed
    ball_y += ball_y_speed

gameLogic = ()  ->
    do updateGame
    do drawPongCanvas

setInterval(gameLogic, 1000/60)

window.onload = ->
    do drawPongCanvas