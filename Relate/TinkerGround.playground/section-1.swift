import Tinker

class RelateGame: Game {
    
    let title: String = "The Ghost Train"
    let gameDescription: String = "It can only go back and forwards in time. "
    
    /// The callback that you can build the games rooms / objects inside
    func ready(display:DisplayAdaptor) -> Room {
        
        let initialRoom = Room(name: "Spawn");
        initialRoom.roomDescription = "There are clothes all over the floor, and you can hear people practicing to the north."
        
        let hallway = Room(name: "The Hallway")
        hallway.roomDescription = "The hallway is long and pretty boring, the music is louder out here, this hallway continues to the east. To the west there is a bathroom, and the Bar is to the east. On the bright side, the band's guitarist Goat Boy is infront of you. Why not say Hi?"
        
        let bathroom = Room(name: "Bathroom")
        bathroom.roomDescription = "Dingy bathroom, nothing particularly out of the ordinary, bits of terrible graffitti and the smell of sweat."
        bathroom.connectEast(hallway)
        
        let bar = Room(name: "Bar")
        bar.roomDescription = "The wooden furnish on the bar really adds to the atmosphere. Anyway, to get on-stage you need to go south into the Alley. FloatstarPX is mulling around next to an empty glass waiting on something"
        bar.connectWest(hallway)
        
        let alley = Room(name: "Dark Alley")
        alley.roomDescription = "The Alley is everything you heard it to be, dark, dingy and crrepy. ou can get back into the bar to the north, there's a guy who Float refered to as a bodyguard here. Looks like he's blocking the entrance to the south. You might have to fight to get past"
        alley.connectNorth(bar)
        
        let finale = Room(name: "On Stage")
        finale.roomDescription = "You arrive on stage, kick the terrible band off stage and wave your keytar in the air like you actually know what you're doing. Congrats! You've completed the game :)"
        
        let keytar = Item(name: "Keytar")
        
        keytar.descriptionInRoom = "Your Keytar is hanging from the roof, how did it ever get there?"

    
        keytar.itemDescription = "Your Keytar is a beautiful 80s mix of a guitar and a keyboard allowing you to mash buttons without needing to stand behind a keyboard. A perfect mix."
        
        keytar.addResponseToCommand("play keytar") {
            display.print("You rock out on the Keytar for a while playing some George Michaels, no one seems to pay any attention though");
        }
        bathroom.addItem(keytar)
        
        keytar.onPickUp = {
            display.print("You put the strap over your head and swing the Keytar over to your back");
        }
        
        keytar.onDropDown = {
            display.print("Really? You're putting it down?")
        }
        
        let dude:Person = Person(name: "Dude")
        dude.respondToPlayerForTheFirstTime = {
            display.say("Dude", message: "Hey there stranger")
        }
        
        dude.addResponseToCommand("say hi") {
            display.say("Dude", message: "Hello")
        }
        
        hallway.addPerson(dude)
        
        initialRoom.connectNorth(hallway)
        return initialRoom
    }
}

let display = ConsoleDisplayAdaptor()
let relate = RelateGame()
let tinker = Tinker(game:relate, display:display)
let cmd = CommandInterpreter(tinker:tinker)

tinker.startGame()

cmd.parse("north")
cmd.parse("say hi")
cmd.parse("hello ")

cmd.parse("west")
cmd.parse("get keytar")
