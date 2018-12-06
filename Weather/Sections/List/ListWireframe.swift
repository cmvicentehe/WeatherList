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
        guard let listVC = UIStoryboard(name: Constants.listStoryBoard, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.listVC) as? ListVC else {
            print("ListVC is nil")
            return
        }
        
        let interactor = ListInteractor()
        let networkClient = NetworkClient()
        let listRepository = ListRepository(networkClient: networkClient, interactor: interactor)
        interactor.repository = listRepository
        
        let presenter = ListPresenter(view: listVC,
                                      interactor: interactor,
                                      wireframe: self)
        
        interactor.presenter = presenter
        listVC.presenter = presenter
        let navigationController = UINavigationController(rootViewController: listVC)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}
