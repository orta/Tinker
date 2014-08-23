//
//  CommandInterpreter.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

enum AppCommands : String {
    case North = "north", N = "n",
         South = "south", S = "s",
         West = "west", W = "w",
         Look = "look", L = "l",
         East = "east", E = "e",
         Help = "help", H = "h"
}

public class CommandInterpreter {
    
    let tinker:Tinker

    public init(tinker:Tinker) {
        self.tinker = tinker
    }
    
    public func parse(input:String) {
        self.tinker.display.command(input)

        if let appCommand = AppCommands.fromRaw(input) {
            switch appCommand {
                case .Help, .H:
                    help()
                
                case .North, .N:
                    north()
                
                case .South, .S:
                    south()
                
                case .East, .E:
                    east()
                
                case .West, .W:
                    west()
                
                case .Look, .L:
                    look()
            }
            return
        }
        
        tinker.currentRoom.respondToCommand(input)
    }
    
    
    func north(){
        self.moveToRoom(tinker.currentRoom.northRoom)
    }
    
    func south() {
        self.moveToRoom(tinker.currentRoom.southRoom)
    }
    
    func east() {
        self.moveToRoom(tinker.currentRoom.eastRoom)
    }
    
    func west() {
        self.moveToRoom(tinker.currentRoom.westRoom)
    }
    
    func moveToRoom(room:Room?){
        if let newRoom = room {
            tinker.currentRoom = newRoom
            tinker.movedRoom()
            
        } else {
            self.tinker.display.print("There is nothing in that direction")
        }
    }
    
    func look() {
        self.tinker.describeSurroundings()
    }
    
    public func help() {
        TQ.print("Help for you")
    }
}