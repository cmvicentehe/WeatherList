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
}

protocol ListInteractorOutput {
   func displayUserLocation()
}

class ListInteractor {
    var presenter: ListInteractorOutput?
    var repository: ListRepositoryInput?
    let locationWrapper: CoreLocationWrapper
    var userLocation: Location?
    var pointOfInterest: Location?
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
    }
    
    func pointOfInterestDidUpdate(_ pointOfInterest: Location) {
        self.pointOfInterest = pointOfInterest
    }
}

extension ListInteractor: ListRepositoryOutput {
    
}

extension ListInteractor: CoreLocationWrapperOutput {
    func displayUserLocation() {
        self.presenter?.displayUserLocation()
    }
}
