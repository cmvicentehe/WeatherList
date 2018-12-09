//
//  NetworkClientMock.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

import Foundation
@testable import Weather

class NetworkClientMock {
    var spyPerformRequestCalled = false
}

extension NetworkClientMock: NetworkClientInput {
    func performRequest(for urlRequest: URLRequest, completion: @escaping (Response?) -> Void) {
        self.spyPerformRequestCalled = true
    }
}
