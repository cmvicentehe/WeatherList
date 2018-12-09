//
//  WeatherListPresenterMock.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
@testable import Weather

class WeatherListPresenterMock {
    // MARK: ListPresenterInput
    var spyWeatherListCalled = false
    var spyViewDidLoadCalled = false
    var spyUserDidUpdateLocationCalled = false
    var spyUserDidUpdatePointOfInterestCalled = false
    
    // MARK: ListInteractorOutput
    var spyDisplayUserLocationCalled = false
    var spyDisplayWeatherCalled = false
    var spyDisplayErrorCalled = false
}

extension WeatherListPresenterMock: ListPresenterInput {
    var weatherList: [Weather]? {
        self.spyWeatherListCalled = true
        return [Weather]()
    }
    
    func viewDidLoad() {
        self.spyViewDidLoadCalled = true
    }
    
    func userDidUpdateLocation(userLocation: Location) {
        self.spyUserDidUpdateLocationCalled = true
    }
    
    func userDidUpdatePointOfInterest(pointOfInterest: Location) {
        self.spyUserDidUpdatePointOfInterestCalled = true
    }
}

extension WeatherListPresenterMock: ListInteractorOutput {
    func displayUserLocation() {
        self.spyDisplayUserLocationCalled = true
    }
    
    func displayWeather(list: [Weather]) {
        self.spyDisplayWeatherCalled = true
    }
    
    func display(error: String) {
        self.spyDisplayErrorCalled = true
    }
}
