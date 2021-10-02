bg = "#FFF"
fg = "#000"
paddle1 = 225
paddle2 = 225
ball_x = 345
ball_y = 245
drawPongCanvas = () ->
    c = document.getElementById("PongCanvas")
    ctx = c.getContext("2d")
    ctx.fillStyle = bg
    ctx.fillRect(0,0,700,500)
    ctx.fillStyle = fg
    ctx.fillRect(50,paddle1,10,50)
    ctx.fillRect(640,paddle2,10,50)
    ctx.fillRect(ball_x,ball_y,10,10)

debugDraw = () ->
    paddle1 = document.getElementById("paddle1").value
    paddle2 = document.getElementById("paddle2").value
    ball_x = document.getElementById("ball_x").value
    ball_y = document.getElementById("ball_y").value
    do drawPongCanvas

document.onkeydown = ->
    if event.keyCode is 87 and paddle1 > 5
        paddle1 -= 5
    else if event.keyCode is 83 and paddle1 < 445
        paddle1 += 5
    if event.keyCode is 38 and paddle2 > 5
        paddle2 -= 5
    else if event.keyCode is 40 and paddle2 < 445
        paddle2 += 5
    do drawPongCanvas

window.onload = ->
    do drawPongCanvas