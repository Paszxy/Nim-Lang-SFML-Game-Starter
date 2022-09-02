import Game 

var game = newGame()
game.initWindow()

when isMainModule:
    while(game.running()):
        game.update()
        game.render()

