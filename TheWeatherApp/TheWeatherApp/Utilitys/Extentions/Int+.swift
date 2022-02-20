//
//  Int+.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 20.02.2022.
//

import Foundation

extension Int{
    func convertoToString() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy"
        return dateFormatter.string(from: date)
    }
    
    func convertoToHourString()-> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:00"
        return dateFormatter.string(from: date)
    }
    
}
