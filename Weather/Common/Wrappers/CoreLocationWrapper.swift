//
//  CoreLocationWrapper.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
import CoreLocation

protocol CoreLocationInput {
    func requestAuth()
}

protocol CoreLocationWrapperOutput: class {
   func displayUserLocation()
}

class CoreLocationWrapper {
    let coreLocation: CLLocationManager
    weak var output: CoreLocationWrapperOutput?
    
    init(coreLocation: CLLocationManager = CLLocationManager()) {
        self.coreLocation = coreLocation
    }
}

extension CoreLocationWrapper: CoreLocationInput {
    func requestAuth() {
       let authorizationStatus = CLLocationManager.authorizationStatus()
        switch authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
             self.output?.displayUserLocation()
        case .denied, .notDetermined, .restricted:
            self.coreLocation.requestWhenInUseAuthorization()
        }
    }
}
