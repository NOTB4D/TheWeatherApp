//
//  WeatherDTO.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation
// MARK: - Weather
struct Weather: Codable {
    let icon: String

    var iconURL: URL? {
        let urlString = "http://openweathermap.org/img/wn/\(icon).png"
        return URL(string: urlString)
    }
}
