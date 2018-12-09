//
//  WeatherListWireframeMock.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
@testable import Weather

class WeatherListWireframeMock {
    var spyShowListCalled = false
    var spyShowErrorCalled = false
}

extension WeatherListWireframeMock: ListWireframeInput {
    func showList() {
        self.spyShowListCalled = true
    }
    
    func showError(message: String) {
        self.spyShowErrorCalled = true
    }
}
