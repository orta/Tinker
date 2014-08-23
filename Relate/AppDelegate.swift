//
//  AppDelegate.swift
//  Relate
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

import UIKit
import TinkerQuest

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {

        let relate = RelateGame()
        let dote = TinkerQuest(game:relate)
        
        dote.startGame()
        
        return true
    }
}

