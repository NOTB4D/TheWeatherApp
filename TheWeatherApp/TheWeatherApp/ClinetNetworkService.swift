//
//  ClinetNetworkService.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation


class ClinetNetworkService {
    
    enum Endpoints: String{
        case currentWeather = "weather?lat=%d&lon=%d"
        
        func urlString(arguments: CVarArg...)-> String {
            return String(format: self.rawValue, arguments)
        }
    }
    
   private let networkService: NetworkServiceProtocol = NetworkService()
    
    func getCurrentWeather(with latitude:Double, longitude: Double, complation: @escaping(CurrentWeatherDTO?, NetworkError?)-> Void){
        
        let urlString = Endpoints.currentWeather.urlString(arguments: latitude, longitude)
        networkService.get(from: urlString, completion: complation)
    }
}
