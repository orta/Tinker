//
//  Item.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

public class Item: TinkerObject {
   
    public var itemDescription:String = ""
    public var location:Room?
    public var descriptionInRoom:String = ""
 
    public var onPickUp: voidClosure?
    public var onDropDown: voidClosure?
}
