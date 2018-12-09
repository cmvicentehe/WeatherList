//
//  Cofig.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

struct Config {
    static let hostUrl: String = Bundle.main.object(forInfoDictionaryKey: Constants.hostUrl) as? String ?? ""
    static let apiKey: String = Bundle.main.object(forInfoDictionaryKey: Constants.apiKey) as? String ?? ""
}
