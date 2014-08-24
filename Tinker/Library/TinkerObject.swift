//
//  TinkerObject.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public typealias voidClosure = () -> Void

public class TinkerObject: Equatable {
    public let name:String
    public var id:String
    public var heldObjects:[TinkerObject] = []
    
    private var inlineResponses:Dictionary <String, voidClosure> = [String: voidClosure]()
    
    public init(name:String){
        self.name = name;
        self.id = name.lowercaseString
    }
    
    public func respondToCommand(command: String) -> Bool {
        for object in heldObjects {
            if object.respondsToCommand(command) {
                return true
            }
        }
        return false
    }

    private func respondsToCommand(command:String)  -> Bool {
        for key in inlineResponses.keys {
            if key == command {
                inlineResponses[key]!()
                return true
            }
        }
        return false
    }
    
    public func addResponseToCommand(to:String, with:voidClosure ){
        inlineResponses[to] = with
    }
}

public func ==(lhs: TinkerObject, rhs: TinkerObject) -> Bool {
    return lhs.id == rhs.id
}
