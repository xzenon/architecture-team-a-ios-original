//
//  DemoEventHandler.swift
//  architecture
//
//  Created by Alexandr Fal' on 28.10.2019.
//  Copyright © 2019 HandH. All rights reserved.
//

import HHModule

final class DemoEventHandler: ARCHEventHandler<DemoState>, DemoModuleInput {

    weak var moduleOutput: DemoModuleOutput?
    
    // MARK: - DemoModuleInput

    func set(moduleOutput: ARCHModuleOutput) {
        self.moduleOutput = moduleOutput as? DemoModuleOutput
    }

    // MARK: - View Life Cycle

    override func viewIsReady() {
        super.viewIsReady()
    }

    func moduleWillAppear() {
    }

    func moduleDidAppear() {
    }

    func moduleWillDisappear() {
    }

    func moduleDidDisappear() {
    }
}

// MARK: - API

private extension DemoEventHandler {
}

// MARK: - Data (преобразование данных)

private extension DemoEventHandler {
}

// MARK: - Routing

private extension DemoEventHandler {
}
