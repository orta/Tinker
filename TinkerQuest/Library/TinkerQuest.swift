//
//  TinkerQuest.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public protocol Game {
    /// Presented when the game loads
    var title: String { get }

    /// Presented when the game loads
    var gameDescription: String { get }
    
    /// The callback that you can build the games rooms / objects inside
    func ready()
}

public class TinkerQuest {
    public var game:Game;
    public var rooms = [Room]()
    
    public init(game:Game) {
        self.game = game;
    }
    
    public func startGame() {
        println("Title : \(game.title) ");
        println("Description : \(game.title) ");
        
        game.ready()
    }
}
