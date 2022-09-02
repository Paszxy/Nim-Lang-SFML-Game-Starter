import csfml

type 
    Game* = ref object of RootObj
        window: RenderWindow
        videoMode: VideoMode
        event: Event
        settings: ContextSettings


proc initVariables*(game: Game) =
    game.window = nil

proc initWindow*(game: Game) =
    game.initVariables()
    game.videoMode.width = 1280
    game.videoMode.height = 900    
    game.settings = contextSettings(depth=32, antialiasing=8)
    game.window = newRenderWindow(game.videoMode, "Game", settings=game.settings)

proc newGame*(): Game =
    return Game()

proc running*(game: Game): bool =
    return game.window.open()

proc pollEvents(game: Game) =
    while game.window.pollEvent game.event:
        case game.event.kind 
            of EventType.Closed:
                game.window.close()
            of EventType.KeyPressed: 
                if game.event.key.code == KeyCode.Enter:
                    echo "test"
            else:
                discard

proc update*(game: Game) =
    game.pollEvents()

proc render*(game: Game) =
    game.window.clear White
    game.window.display()