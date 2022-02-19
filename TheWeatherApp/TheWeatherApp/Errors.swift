//
//  Errors.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation


enum NetworkError: Error{
    case invalitUrl
    case custom(String?)
    case noData
}
