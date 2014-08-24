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
    
    var visited = false
    
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
            TQ.print(item.descriptionInRoom);
        }
    }
        
    public func addPerson(person:Person) {
        people.append(person)
        heldObjects.append(person)
    }
    
    public func addItem(item:Item) {
        items.append(item)
        heldObjects.append(item)
    }
    
    public func pickUpItem(itemID:String) {
        if let item = itemForID(itemID) {
            heldObjects.removeObject(item)
            item.removeObject(item)
        }
    }
    
    func itemForID(itemID:String) -> Item? {
        for item in items {
            if item.id == itemID {
                return item
            }
        }
        return nil
    }
}
