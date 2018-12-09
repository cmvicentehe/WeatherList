//
//  CoreLocationWrapperMock.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
@testable import Weather

class CoreLocationWrapperMock {
    var spyRequestAuthCalled = false
}

extension CoreLocationWrapperMock: CoreLocationInput {
    func requestAuth() {
        self.spyRequestAuthCalled = true
    }
}
