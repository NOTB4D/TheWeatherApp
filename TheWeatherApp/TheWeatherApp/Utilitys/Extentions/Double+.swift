//
//  Double+.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation


extension Double {
    func kelvinToCelcius() -> Double {
        let kelvinZeroInCelcius: Double = 273
        return self - kelvinZeroInCelcius
    }
}
