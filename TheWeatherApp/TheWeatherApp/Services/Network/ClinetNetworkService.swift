//
//  ClinetNetworkService.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation


class ClinetNetworkService: ClientNetworkServiceProtocol {
    
   private enum Endpoints: String{
        case currentWeather = "weather?lat=%f&lon=%f"
        //TODO: Buraya Bak
      /*func urlString(arguments: Double... )-> String {
            return String(format: self.rawValue, arguments)
        }*/
    func urlString(latitude: Double, longitude:Double)-> String {
             return String(format: self.rawValue, latitude,longitude)
         }
    }
    
   private let networkService: NetworkServiceProtocol = NetworkService()
    
    func getCurrentWeather(latitude:Double, longitude: Double, complation: @escaping(CurrentWeatherDTO?, NetworkError?)-> Void){
        
        //let urlString = Endpoints.currentWeather.urlString(arguments: latitude, longitude )
        let urlString = Endpoints.currentWeather.urlString(latitude: latitude, longitude:longitude )
        networkService.get(from: urlString, completion: complation)
    }
}
