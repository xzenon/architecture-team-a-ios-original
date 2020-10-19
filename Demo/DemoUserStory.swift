//
//  DemoUserStory.swift
//  HHModuleDemo
//
//  Created by Alexandr Fal' on 28.10.2019.
//  Copyright © 2019 HandH. All rights reserved.
//

import Foundation
import HHModule

enum DemoUserStory: ARCHModuleID {
    case main

    var configurator: ARCHModuleConfigurator {
        switch self {
        case .main:
            return DemoConfigurator(moduleIO: nil)
        }
    }
}
