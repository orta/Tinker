//
//  TQ.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public class TQ {
        
    public class func print(s:String){
        Tinker.sharedInstance.display.print(s)
    }
    
    public class func header(s:String){
        Tinker.sharedInstance.display.heading(s)
    }

    public class func title(s:String){
        Tinker.sharedInstance.display.title(s)
    }

}