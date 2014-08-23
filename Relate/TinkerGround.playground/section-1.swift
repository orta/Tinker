import TinkerQuest

let display = ConsoleDisplayAdaptor()

class RelateGame: Game {
    
    let title: String = "Brutal Techno Punk On"
    let gameDescription: String = "Kieronononon on is a game about getting to the show, and beating the man to it."
    
    /// The callback that you can build the games rooms / objects inside
    func ready() -> Room {
        var initialRoom = Room(name: "Spawn");
        initialRoom.roomDescription = "There are clothes all over the floor, and you can hear people practicing to the north."
        
        var secondRoom = Room(name: "The Hallway")
        secondRoom.roomDescription = "The hallway is long and pretty boring, the music is louder out here, this hallway continues to the east. To the west there is a bathroom, and the Bar is to the east. On the bright side, the band's guitarist Goat Boy is infront of you. Why not say Hi?"
        
        var dude:Person = Person(name: "Dude")
        dude.respondToPlayerForTheFirstTime = {
            display.say("Dude", message: "Hey there stranger")
        }
        
        dude.addResponseToCommand("hi") {
            display.say("Dude", message: "Hello")
        }
        secondRoom.addPerson(dude)
        
        initialRoom.connectNorth(secondRoom)
        return initialRoom

    }
}

let relate = RelateGame()
let tinker = Tinker(game:relate, display:display)
let cmd = CommandInterpreter(tinker:tinker)

tinker.startGame()

cmd.parse("north");

cmd.parse("hi");
