//
//  ListWireframe.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import UIKit

protocol ListWireframeInput {
     func showList()
}

struct ListWireframe {
    let window: UIWindow
}

extension ListWireframe: ListWireframeInput {
    func showList() {
        guard let listVC = UIStoryboard(name: Constants.listStoryBoard, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.listVC) as? WeatherListVC else {
            print("WeatherListVC is nil")
            return
        }
        let locationWrapper = CoreLocationWrapper()
        let interactor = ListInteractor(locationWrapper: locationWrapper)
        let networkClient = NetworkClient()
        let listRepository = ListRepository(networkClient: networkClient, interactor: interactor)
        interactor.repository = listRepository
        let presenter = ListPresenter(view: listVC,
                                      interactor: interactor,
                                      wireframe: self)
        locationWrapper.output = interactor
        interactor.presenter = presenter
        listVC.presenter = presenter
        let navigationController = UINavigationController(rootViewController: listVC)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}
