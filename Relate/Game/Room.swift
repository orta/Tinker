//
//  Room.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public class Room: TinkerObject {
   
    var northRoom:Room?
    var eastRoom:Room?
    var westRoom:Room?
    var southRoom:Room?
    
    var items = [Item]()

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
    
    func describeRoom() {
        for item in items {
            TQ.print(item.itemDescription);
        }
    }
    
}
