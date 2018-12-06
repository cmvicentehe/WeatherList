//
//  ListPresenter.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

protocol ListUI: class {
     #warning ("Implement!")
}
protocol ListPresenterInput {
   func viewDidLoad()
}

class ListPresenter {
    weak var view: ListUI?
    let interactor: ListInteractorInput
    let wireframe: ListWireframeInput
    
    init(view: ListUI, interactor: ListInteractorInput, wireframe: ListWireframeInput) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension ListPresenter: ListPresenterInput {
    func viewDidLoad() {
        #warning ("Implement!")
        print("View did loaded")
    }
}

extension ListPresenter: ListInteractorOutput {
    
}
