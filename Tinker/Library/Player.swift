//
//  Player.swift
//  Tinker
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

import Foundation

public class Player : TinkerObject {
    
    public convenience init() {
        self.init(name: "player")
    }
    
    public var inventory: [Item] = []
    
    public func addItem(item: Item) {
        inventory.append(item)
        heldObjects.append(item)
    }
    
    public func removeItem(item: Item) {
        inventory.remove(item)
        heldObjects.remove(item)
    }
    
    public func describeInventory() {
        for item in inventory {
            if item.descriptionInRoom.characters.count > 0 {
                TQ.print(item.descriptionInRoom)
            }
        }
    }
    
}
