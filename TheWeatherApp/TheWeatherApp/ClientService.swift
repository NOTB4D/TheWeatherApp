//
//  ClientService.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation


class ClinetService {
    
   private let networkService: NetworkServiceProtocol = NetworkService()
    
    func getCurrentWeather(with latitude:Double, longitude: Double, complation: @escaping(CurrentWeatherDTO?, NetworkError?)-> Void){
        
        let urlString = String(format: "weather?lat=%d&lon=%d", latitude, longitude)
        
        networkService.get(from: urlString, completion: complation)
    }
}
