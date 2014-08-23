//
//  RelateGame.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

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
