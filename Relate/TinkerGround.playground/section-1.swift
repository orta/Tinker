import TinkerQuest

class RelateGame: NSObject, Game {
    
    var title: String = "Game Title"
    
    /// Presented when the game loads
    var gameDescription: String = "Game Description"
    
    /// The callback that you can build the games rooms / objects inside
    func ready() {
        NSLog("OK")
    }
}

class InitialRoom: Room {}

let relate = RelateGame()
let tinker = TinkerQuest(game:relate)
let cmd = CommandInterpreter(tinker:tinker)

tinker.startGame()

cmd.parse("help");