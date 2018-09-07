//
//  IndicationDemoViewController.swift
//  architecture
//
//  Created by basalaev on 30.08.2018.
//  Copyright © 2018 HandH. All rights reserved.
//

import HHModule
import HHList
import HHListExtension
import HHIndication

enum ActionType: Int {
    case load = 0
    case data
    case empty
    case error

    static var allValues: [ActionType] {
        return [.load, .data, .empty, .error]
    }

    static var allTitles: [String] {
        return allValues.map { $0.title }
    }

    var title: String {
        switch self {
        case .load:
            return "Загрузка"
        case .data:
            return "Список"
        case .empty:
            return "Нет данных"
        case .error:
            return "Ошибка"
        }
    }
}

final class IndicationDemoViewController: ARCHViewController<IndicationDemoState, IndicationDemoEventHandler>, ARCHIndicationContainer {

#if HHSkeleton
    let headerView = HeaderView()
#endif

    let listController = ARCHDiffTableViewController<SimpleEntity, ExampleCellViewModel, ExampleCell>()
    let segmentControll = UISegmentedControl(items: ActionType.allTitles)

#if HHSkeleton
    lazy var indicationHelper: IndicationHelper = {
        let skeletonProvider = ARCHSkeletonViewProvider(views: [
            headerView
        ])

        let result = IndicationHelper()
        result.set(provider: skeletonProvider, by: .loading)
        return result
    }()
#else
    let indicationHelper = IndicationHelper()
#endif

    private struct Constants {
        static let segmentControlHeight: CGFloat = 40
    }

    override func prepareRootView() {
        super.prepareRootView()

        indicationHelper.container = self
        layoutIndicationGuide.bottomConstraint?.constant = -Constants.segmentControlHeight

        view.backgroundColor = .white

        configure(segmentControl: segmentControll)
        setupLayout()
    }

    // MARK: - Configure

    func configure(segmentControl: UISegmentedControl) {
        segmentControl.backgroundColor = .white
        segmentControl.addTarget(self, action: #selector(action(sender:)), for: .valueChanged)
    }

    func setupLayout() {
#if HHSkeleton
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
#endif

        let tableView = listController.tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControll)

#if HHSkeleton
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])
#else
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
#endif
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: segmentControll.topAnchor),
            segmentControll.leftAnchor.constraint(equalTo: view.leftAnchor),
            segmentControll.rightAnchor.constraint(equalTo: view.rightAnchor),
            segmentControll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            segmentControll.heightAnchor.constraint(equalToConstant: Constants.segmentControlHeight)
        ])
    }

    // MARK: - Actions

    @objc
    func action(sender: UISegmentedControl) {
        guard let actionType = ActionType(rawValue: sender.selectedSegmentIndex) else {
            return
        }

        switch actionType {
        case .load:
            output?.startLoading()
        case .data:
            output?.finishLoadingWithSomeData()
        case .empty:
            output?.finishLoadingWithEmptyData()
        case .error:
            output?.finishLoadingWithError()
        }
    }

    override func render(state: State) {
        super.render(state: state)

        print("[IndicationDemoViewController] render(state:)")
// TODO: Объединияем все вьюхи и делаем у них смещение стартового времени анимации
//        headerView.slide(to: .left) { group in
//            group.beginTime = 0.5
//        }
    }
}
