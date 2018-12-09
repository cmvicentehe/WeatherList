//
//  WeatherListRepositoryMock.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
@testable import Weather

class WeatherListRepositoryMock {
    var spyGetWeatherForLocationCalled = false
}

extension WeatherListRepositoryMock: ListRepositoryInput {
    func getWeather(for location: Location) {
        self.spyGetWeatherForLocationCalled = true
    }
}
