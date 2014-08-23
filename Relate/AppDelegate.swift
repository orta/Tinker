//
//  AppDelegate.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

import UIKit
import TinkerQuest

class ConsoleDisplay: DisplayAdaptor {
    func print(string:String) {
        println(" " + string)
    }
    
    func heading(string:String) {
        println(string)
    }
    
    func title(string:String) {
        println(string)
        println()
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {

        let relate = RelateGame()
        let display = ConsoleDisplay()

        let tinker = Tinker(game:relate, display: display)
        tinker.startGameInRoom(room: Room)
        
        return true
    }
}

