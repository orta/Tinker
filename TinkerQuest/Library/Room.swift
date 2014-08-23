//
//  Room.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public class Room: TinkerObject {
   
    public var roomDescription:String?
    
    public var northRoom:Room?
    public var eastRoom:Room?
    public var westRoom:Room?
    public var southRoom:Room?
    
    public var items:[Item] = []
    public var people:[Person] = []
    public var allObjects:[TinkerObject] = []
    
    public func connectNorth(room:Room) {
        self.northRoom = room
        room.southRoom = self
    }

    public func connectSouth(room:Room) {
        self.southRoom = room
        room.northRoom = self
    }
    
    public func connectEast(room:Room) {
        self.eastRoom = room
        room.westRoom = self
    }

    public func connectWest(room:Room) {
        self.westRoom = room
        room.eastRoom = self
    }
        
    func describeInsideRoom() {
        for item in items {
            TQ.print(item.itemDescription);
        }
    }
    
    override public func respondToCommand(command: String) -> Bool {
        for object in allObjects {
            if object.respondToCommand(command) {
                return true
            }
        }
        return false
    }
    
    public func addPerson(person:Person) {
        people.append(person)
        allObjects.append(person)
    }
    
    public func addItem(item:Item) {
        items.append(item)
        allObjects.append(item)
    }
    
    

}
