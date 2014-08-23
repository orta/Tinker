//
//  ConsoleDisplayAdaptor.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public class ConsoleDisplayAdaptor: DisplayAdaptor {
    
    public init() {
        
    }
    
    public func print(string:String) {
        println(" " + string)
    }
    
    public func heading(string:String) {
        println(string)
    }
    
    public func title(string:String) {
        println(string)
        println()
    }
    
    public func say(actor: String, message: String) {
        println("<\(actor)> \(message)")
    }
    
    public func command(string:String) {
        print("")
        print("> \(string)")
    }
    
}
