//
//  HourlyWeatherCollectionViewCell.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 20.02.2022.
//

import UIKit
import Kingfisher

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: Forecast) {
       
        temperatureLabel.text = String(Int(item.temperature.kelvinToCelcius()))
        weatherIconImageView.kf.setImage(with: item.weather.first?.iconURL)
        hourLabel.text = item.timeInterval.convertoToHourString()
    }
    
}
