//
//  ListPresenter.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

protocol ListUI: class {
     func displayUserLocation()
}
protocol ListPresenterInput {
    func viewDidLoad()
    func userDidUpdateLocation(userLocation: Location)
    func userDidUpdatePointOfInterest(pointOfInterest: Location)
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
        self.interactor.requestLocationAuth()
    }
    
    func userDidUpdateLocation(userLocation: Location) {
        self.interactor.userLocationDidUpdate(userLocation)
    }
    
    func userDidUpdatePointOfInterest(pointOfInterest: Location) {
        self.interactor.pointOfInterestDidUpdate(pointOfInterest)
    }
}

extension ListPresenter: ListInteractorOutput {
    func displayUserLocation() {
        self.view?.displayUserLocation()
    }
}
