//
//  Weather.swift
//  Weather
//
//  Created by Carlos Vicente on 08/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

struct HourlyDictionary: Codable {
    let hourly: HourlyItem
}

struct HourlyItem: Codable {
    let data: [Weather]
}

struct Weather: Codable {
    enum CodingKeys : String, CodingKey {
        case temperature
        case weather = "summary"
        case time
    }

    let temperature: Double
    let time: TimeInterval
    let weather: String
    
    func timeFromTimeInterval() -> String {
        let date = Date(timeIntervalSince1970: self.time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateText = dateFormatter.string(from: date)
        return dateText
    }
}
