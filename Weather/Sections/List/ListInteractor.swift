//
//  ListInteractor.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
import CoreLocation

protocol ListInteractorInput {
    func requestLocationAuth()
    func userLocationDidUpdate(_ userLocation: Location)
    func pointOfInterestDidUpdate(_ pointOfInterest: Location)
    func weatherListOrderedByTemperature() -> [Weather]
}

protocol ListInteractorOutput {
    func displayUserLocation()
    func displayWeather(list: [Weather])
    func display(error: String)
}

class ListInteractor {
    var presenter: ListInteractorOutput?
    var repository: ListRepositoryInput?
    let locationWrapper: CoreLocationWrapper
    var userLocation: Location?
    var pointOfInterest: Location?
    private var weatherList: [Weather]?
    
    init(locationWrapper: CoreLocationWrapper) {
        self.locationWrapper = locationWrapper
    }
}

extension ListInteractor: ListInteractorInput {
    func requestLocationAuth() {
        self.locationWrapper.requestAuth()
    }
    
    func userLocationDidUpdate(_ userLocation: Location) {
        self.userLocation = userLocation
        self.repository?.getWeather(for: userLocation)
    }
    
    func pointOfInterestDidUpdate(_ pointOfInterest: Location) {
        self.pointOfInterest = pointOfInterest
        self.repository?.getWeather(for: pointOfInterest)
    }
    
    func weatherListOrderedByTemperature() -> [Weather] {
       return self.weatherList?.sorted { $0.temperature < $1.temperature } ?? [Weather]()
    }
}

extension ListInteractor: ListRepositoryOutput {
   func weather(result: Result<[Weather], WeatherListError>) {
    switch result {
    case .success(let weatherList):
        self.weatherList = weatherList
        let sortedList = self.weatherListOrderedByTemperature()
        self.presenter?.displayWeather(list: sortedList)
    case .error(let error):
        self.presenter?.display(error: error.localizedDescription)
    }
    }
}

extension ListInteractor: CoreLocationWrapperOutput {
    func displayUserLocation() {
        self.presenter?.displayUserLocation()
    }
}
