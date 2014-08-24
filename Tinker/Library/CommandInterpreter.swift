//
//  CommandInterpreter.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

import Foundation

enum AppCommands : String {
    case North = "north", N = "n",
         South = "south", S = "s",
         West = "west",   W = "w",
         Look = "look",   L = "l",
         East = "east",   E = "e",
         Get = "get",     G = "g",
         Help = "help",   H = "h"
}

public class CommandInterpreter {
    
    let tinker:Tinker

    public init(tinker:Tinker) {
        self.tinker = tinker
    }
    
    public func parse(input:String) {
        self.tinker.display.command(input)

        let params = input.componentsSeparatedByString(" ")
        
        if let appCommand = AppCommands.fromRaw(params.first!) {
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
                
                case .Get, .G:
                    if countElements(params) > 1 {
                        get(params[1])
                    } else {
                        error("Get what?")
                    }
            }
            return
        }
        
        if tinker.currentRoom.respondToCommand(input) { return }
        if tinker.player.respondToCommand(input) { return }

        
        tinker.display.print("Nothing happened")
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
    
    func get(item:String) {
        tinker.currentRoom.pickUpItem(item)
    }
    
    func error(message:String) {
        tinker.display.error(message)
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