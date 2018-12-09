//
//  Constants.swift
//  Weather
//
//  Created by Carlos Manuel Vicente Herrero on 06/12/2018.
//  Copyright © 2018 Carlos Manuel Vicente Herrero. All rights reserved.
//

import Foundation

struct Constants {
    // MARK: Repository url components
    static let scheme = "https"
    static let forecast = "forecast"
    static let excludedKey = "exclude"
    static let excludedValues = "currently,minutely,daily,alerts,flags" // Static string to avoid errors with commas
    static let unitsKey = "units"
    static let internationalSystem = "si"

    // MARK: info-plist keys
    static let hostUrl = "HOST_URL"
    static let apiKey = "DARKSKY_API_KEY"
    
    // MARK: Storyboards
    static let listStoryBoard = "List"
    static let listVC = "WeatherListVC"
    
    // MARK: Location coordinates
    static let latitudeDelta = 0.04
    static let longitudeDelta = 0.04
    
    // MARK: Cell identifiers
    static let weatherCellIdentifier = "WeatherCell"
    
    // MARK: List Texts
    static let temperature = "Temperature"
    static let time = "Time"
}
