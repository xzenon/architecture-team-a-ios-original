//
//  DemoViewController.swift
//  architecture
//
//  Created by Alexandr Fal' on 28.10.2019.
//  Copyright © 2019 HandH. All rights reserved.
//

import HHModule

final class DemoViewController: ARCHViewController<DemoState, DemoEventHandler> {

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Настраиваем вьюхи после загрузки из xib
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.moduleWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.moduleDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output?.moduleWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output?.moduleDidDisappear()
    }

    override func prepareRootView() {
        super.prepareRootView()

        // Подключаем внешние зависимости к UI
    }

    // MARK: - Render

    override func render(state: DemoState) {
        super.render(state: state)
    }
}
