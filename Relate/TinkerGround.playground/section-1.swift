// Playground - noun: a place where people can play

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
let dote = TinkerQuest(game:relate)



dote.startGame()
