//
//  TinkerObject.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public typealias voidClosure = () -> Void

public class TinkerObject {
    public let name:String
    public let id:String
    var inlineResponses:Dictionary <String, voidClosure> = [String: voidClosure]()
    
    public init(name:String){
        self.name = name;
        self.id = name.lowercaseString
    }
    
    public func respondToCommand(command:String)  -> Bool {
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
