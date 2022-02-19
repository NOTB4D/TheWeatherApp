//
//  CurrentWeatherDTO.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation

// MARK: CurrentWeatherDto
struct CurrentWeatherDTO: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    let date: Int

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case weather, main, name
    }
}


// MARK: - Main
struct Main: Codable {
    let temperature, feelsLike, minTemperature, maxTemperature: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure, humidity
    }
}
