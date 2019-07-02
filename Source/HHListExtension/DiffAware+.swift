//
//  DiffAware+.swift
//  HHModuleDemo
//
//  Created by Xenon on 7/2/19.
//  Copyright © 2019 HandH. All rights reserved.
//

import Foundation
import DeepDiff

extension DiffAware where Self: Hashable {
    public var diffId: Int {
        return hashValue
    }
    
    public static func compareContent(_ a: Self, _ b: Self) -> Bool {
        return a == b
    }
}
