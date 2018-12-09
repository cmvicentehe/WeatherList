//
//  ListPresenter.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

protocol ListUI: class {
    func displayActivityIndicator()
    func hideActivityIndicator()
    func displayUserLocation()
    func displayWeather(list: [Weather])
}
protocol ListPresenterInput {
    var weatherList: [Weather]? { get }
    
    func viewDidLoad()
    func userDidUpdateLocation(userLocation: Location)
    func userDidUpdatePointOfInterest(pointOfInterest: Location)
}

class ListPresenter {
    weak var view: ListUI?
    let interactor: ListInteractorInput
    let wireframe: ListWireframeInput
    var weatherList: [Weather]? {
        get {
            return self.interactor.weatherListOrderedByTemperature()
        }
    }
    
    init(view: ListUI, interactor: ListInteractorInput, wireframe: ListWireframeInput) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension ListPresenter: ListPresenterInput {
    func viewDidLoad() {
        self.view?.displayActivityIndicator()
        self.interactor.requestLocationAuth()
    }
    
    func userDidUpdateLocation(userLocation: Location) {
        self.view?.displayActivityIndicator()
        self.interactor.userLocationDidUpdate(userLocation)
    }
    
    func userDidUpdatePointOfInterest(pointOfInterest: Location) {
        self.view?.displayActivityIndicator()
        self.interactor.pointOfInterestDidUpdate(pointOfInterest)
    }
}

extension ListPresenter: ListInteractorOutput {
    func displayUserLocation() {
        self.view?.hideActivityIndicator()
        self.view?.displayUserLocation()
    }
    
    func displayWeather(list: [Weather]) {
        self.view?.hideActivityIndicator()
        self.view?.displayWeather(list: list)
    }
    
    func display(error: String) {
        self.view?.hideActivityIndicator()
       self.wireframe.showError(message: error)
    }
}
