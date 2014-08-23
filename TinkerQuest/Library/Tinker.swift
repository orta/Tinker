//
//  TinkerQuest.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public protocol DisplayAdaptor {
    /// Print out some text
    func print(string:String)

    /// Print a header
    func heading(string:String)
    
    /// Print a title
    func title(string:String)
    
    /// Print 
    func say(actor:String, message:String)
    
    /// Show the users input
    func command(string:String)
}

public protocol Game {
    /// Presented when the game loads
    var title: String { get }

    /// Presented when the game loads
    var gameDescription: String { get }
    
    /// The callback that you can build the games rooms / objects inside
    func ready() -> Room
}

public class Tinker {
    public let game:Game
    public let display:DisplayAdaptor

    public var rooms = [Room]()
    public var currentRoom:Room
    
    public init(game:Game, display:DisplayAdaptor) {
        self.game = game
        self.display = display
        self.currentRoom = game.ready()
    }
    
    /// Start the game
    public func startGame() {
        display.title("Title : \(game.title) ");
        display.print("Description : \(game.gameDescription) ");
        display.print("")
        
        self.movedRoom()
    }
    
    // This method describes the room and items in it,
    // its called by moving rooms, or by teleporting.
    
    public func describeSurroundings() {
        display.title("You are in " + currentRoom.name);
        display.title(currentRoom.roomDescription!);
        currentRoom.describeInsideRoom();
    }
    
    public func movedRoom() {
        describeSurroundings()
    }

}
