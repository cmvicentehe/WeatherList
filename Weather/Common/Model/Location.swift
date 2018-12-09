//
//  Location.swift
//  Weather
//
//  Created by Carlos Vicente on 08/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let coordinate: CLLocationCoordinate2D
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return ((lhs.coordinate.latitude == rhs.coordinate.latitude) &&
        (lhs.coordinate.longitude == rhs.coordinate.longitude))
    }
}
