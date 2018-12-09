//
//  WeatherListViewMock.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
@testable import Weather

class WeatherListViewMock {
    var spyDisplayActivityIndicatorCalled = false
    var spyHideActivityIndicatorCalled = false
    var spyDisplayUserLocationCalled = false
    var spyDisplayWeatherCalled = false
}

extension WeatherListViewMock: ListUI {
    func displayActivityIndicator() {
        self.spyDisplayActivityIndicatorCalled = true
    }
    
    func hideActivityIndicator() {
        self.spyHideActivityIndicatorCalled = true
    }
    
    func displayUserLocation() {
        self.spyDisplayUserLocationCalled = true
    }
    
    func displayWeather(list: [Weather]) {
        self.spyDisplayWeatherCalled = true
    }
}
