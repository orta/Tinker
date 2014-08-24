//
//  FoundationExtensions.swift
//  Tinker
//
//  Created by Orta on 8/23/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

import Foundation

// Taken outright from https://github.com/pNre/ExSwift/blob/master/ExSwift/Array.swift#L882
// Hopefully this will be less lame in the future

extension Array {

    mutating func remove <U: Equatable> (element: U) {
        let anotherSelf = self

        removeAll(keepCapacity: true)

        for current in anotherSelf {
            if current as U != element {
                self.append(current)
            }
        }
    }

}
