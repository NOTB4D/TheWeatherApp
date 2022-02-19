//
//  Manager.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation



protocol NetworkServiceProtocol {
    func get<T: Decodable>(from endpoint: String, completion: @escaping (T? , NetworkError?)-> Void )
}


protocol ClientNetworkServiceProtocol {
    func getCurrentWeather( latitude:Double, longitude: Double, complation: @escaping(CurrentWeatherDTO?, NetworkError?)-> Void)
}
