//
//  ListRepository.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

enum WeatherListError: Error {
    case serviceError(Error)
}

protocol ListRepositoryInput {
    func getWeather(for location: Location)
}

protocol ListRepositoryOutput {
    func weather(result: Result<[Weather], WeatherListError>)
}

struct ListRepository {
    let networkClient: NetworkClientInput
    let interactor: ListRepositoryOutput
    
    // MARK: Private methods
    private func buildRequest(for location: Location) -> URLRequest? {
        guard let url = self.buildUrl(for: location) else {
            print("Url is nil")
            return nil
        }
        
        let urlWithPath = url.appendingPathComponent(self.buildPath(for: location))
        let request = URLRequest(url: urlWithPath,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 30)
        return request
    }
    
    private func buildUrl(for location: Location) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Config.hostUrl
        urlComponents.queryItems = self.buildQueryItems()
        return urlComponents.url
    }
    
    private func buildPath(for location: Location) -> String {
        let latitude = String(location.coordinate.latitude)
        let longitude = String(location.coordinate.longitude)
        let coordinates = "\(latitude),\(longitude)"
        return "\(Constants.forecast)/\(Config.apiKey)/\(coordinates)"
    }
    
    private func buildQueryItems() -> [URLQueryItem] {
        let excludedQueryItem = URLQueryItem(name: Constants.excludedKey,
                                            value: Constants.excludedValues)
        
        let unitsQueryItem = URLQueryItem(name: Constants.unitsKey,
                                             value: Constants.internationalSystem)
        return [excludedQueryItem, unitsQueryItem]
    }
    
    private func parse(_ data: Data) -> [Weather]? {
        var weatherResult: [Weather]? = nil
        do {
            let decoder = JSONDecoder()
            let hourlyDictionary: HourlyDictionary = try decoder.decode(HourlyDictionary.self, from: data)
            let hourlyItem = hourlyDictionary.hourly
            let data = hourlyItem.data

            weatherResult = [Weather]()
            weatherResult = data
        } catch let error {
            let serviceError = WeatherListError.serviceError(error)
            self.interactor.weather(result: Result.error(serviceError))
        }
        return weatherResult
    }
}

extension ListRepository: ListRepositoryInput {
    func getWeather(for location: Location) {
        guard let request = self.buildRequest(for: location) else { return print("Request is nil") }
        self.networkClient.performRequest(for: request) { (response) in
            guard let data = response?.data else {
                if let error =  response?.error {
                    print("There was an error \(error)")
                    let serviceError = WeatherListError.serviceError(error)
                    self.interactor.weather(result: Result.error(serviceError))
                }
                return
            }
            
            guard let weatherList = self.parse(data) else {
                print("Error parsing weather list")
                return
            }
            let result = Result<[Weather], WeatherListError>.success(weatherList)
            self.interactor.weather(result: result)
        }
    }
}
