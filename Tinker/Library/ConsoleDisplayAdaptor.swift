//
//  ConsoleDisplayAdaptor.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

/// A default Adaptor that shows the game output as a collection of
/// printlns with a little bit of formatting

public class ConsoleDisplayAdaptor: DisplayAdaptor {
    
    public init() {
        
    }
    
    public func puts(string: String) {
        print(" " + string)
    }
    
    public func heading(string: String) {
        print(string)
    }
    
    public func title(string: String) {
        print(string)
        print("")
    }
    
    public func say(actor: String, message: String) {
        print("<\(actor)> \(message)")
    }
    
    public func command(string: String) {
        print("")
        print("> \(string)")
    }
    
    public func error(string: String) {
        print("ERROR > \(string)")
    }
    
}
