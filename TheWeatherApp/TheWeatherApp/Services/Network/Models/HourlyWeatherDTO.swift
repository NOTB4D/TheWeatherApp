//
//  HourlyWeatherDTO.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation

// MARK: - HourlyWeatherDTO
struct HourlyWeatherDTO: Codable {
    let hourly: [Forecast]
}

// MARK: - Current
struct Forecast: Codable {
    let timeInterval: Int
    let temperature: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case timeInterval = "dt"
        case temperature = "temp"
        case weather
    }
}
