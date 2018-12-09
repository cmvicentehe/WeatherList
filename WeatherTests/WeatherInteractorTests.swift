//
//  WeatherInteractorTests.swift
//  WeatherTests
//
//  Created by Carlos Vicente on 09/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import XCTest
import CoreLocation
@testable import Weather

class WeatherInteractorTests: XCTestCase {
    var sut: ListInteractor!
    var coreLocationWrapperMock: CoreLocationWrapperMock!
    var listRepositoryMock: WeatherListRepositoryMock!
    
    override func setUp() {
      self.coreLocationWrapperMock = CoreLocationWrapperMock()
      self.listRepositoryMock = WeatherListRepositoryMock()
      self.sut = ListInteractor(locationWrapper: self.coreLocationWrapperMock)
      self.sut?.repository = self.listRepositoryMock
    }
    
    override func tearDown() {
       self.sut = nil
       self.coreLocationWrapperMock = nil
       self.listRepositoryMock = nil
    }
    
    func testRequestAuth() {
        self.sut?.requestLocationAuth()
        XCTAssertTrue(self.coreLocationWrapperMock.spyRequestAuthCalled)
    }
    
    func testUserLocationDidUpdate() {
        let coordinate = CLLocationCoordinate2D(latitude: 40.4169514, longitude: -3.7057172)
        let location = Location(coordinate: coordinate)
        
        self.sut.userLocationDidUpdate(location)
        
        XCTAssertTrue(self.listRepositoryMock.spyGetWeatherForLocationCalled == true)
        XCTAssertTrue(self.sut.userLocation == location)
    }
    
    func testPointOfInterestDidUpdate() {
        let coordinate = CLLocationCoordinate2D(latitude: 40.4169514, longitude: -3.7057172)
        let location = Location(coordinate: coordinate)
        
        self.sut.pointOfInterestDidUpdate(location)
        
        XCTAssertTrue(self.listRepositoryMock.spyGetWeatherForLocationCalled == true)
        XCTAssertTrue(self.sut.pointOfInterest == location)
    }
}
