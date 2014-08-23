//
//  CommandInterpreter.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public class CommandInterpreter {
    
    let tinker:TinkerQuest
    
    public init(tinker:TinkerQuest) {
        self.tinker = tinker
    }
    
    public func parse(input:String) {
        if(input == "help"){
            help()
            return
        }
    }
    
    public func help() {
        TQ.print("Help for you")
    }
}