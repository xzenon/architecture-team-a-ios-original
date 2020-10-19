//
//  DemoConfigurator.swift
//  architecture
//
//  Created by Alexandr Fal' on 28.10.2019.
//  Copyright © 2019 HandH. All rights reserved.
//

import HHModule

typealias DemoModuleIO = (inout DemoModuleInput) -> Void

final class DemoConfigurator: ARCHModuleConfigurator {

    let moduleIO: DemoModuleIO?

    init(moduleIO: DemoModuleIO?) {
        self.moduleIO = moduleIO
    }

    var module: ARCHModule {
        let controller = DemoViewController()
        _ = controller.view

        let eventHandler = DemoEventHandler()
        eventHandler.router = controller
        eventHandler.viewInput = controller

        controller.output = eventHandler

        if var moduleInput = controller.moduleInput as? DemoModuleInput {
            moduleIO?(&moduleInput)
        }

        return controller
    }
}
