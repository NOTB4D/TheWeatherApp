//
//  MainWeatherViewController.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import UIKit

class MainWeatherViewController: UIViewController {
    
    private let netverkService: ClientNetworkServiceProtocol = ClinetNetworkService()
    private lazy var locationService : LocationManagerProtocol = {
        let locationManager = LocationManager()
        locationManager.delegate = self
        return locationManager
    }()
    
    private var isHourlyWeatherAdded = false
    private var hourlyWeatherViewControler: HourlyWeatherViewController!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourlyWeatherContainerView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationService.requestLocation()
        
    }
    
    func addHourlyWeatherView(latitude: Double?, longitude: Double?) {
        hourlyWeatherViewControler = HourlyWeatherViewController(nibName: HourlyWeatherViewController.nibName
                                                                 , bundle: nil)
        hourlyWeatherViewControler.configure(networkService: netverkService, latitude: latitude, longitude: longitude)
        hourlyWeatherViewControler.view.frame = hourlyWeatherContainerView.bounds
        hourlyWeatherContainerView.clipsToBounds = true
        hourlyWeatherContainerView.addSubview(hourlyWeatherViewControler.view)
    }
    
    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeatherDTO?)-> Void){
        netverkService.getCurrentWeather(latitude: latitude, longitude: longitude) { response, error in
            
            if error != nil {
                // alert > Show
                completion( nil )
            }else {
                completion( response )
            }
        }
    }
    
    func updateLabel(latitude: Double, longitude: Double){
        getCurrentWeather(latitude: latitude, longitude: longitude) { [weak self] response in
            guard let self = self else {return}
            guard let weather = response else {return}
            
            DispatchQueue.main.async {
                
                self.temperatureLabel.text = String(Int( weather.main.temperature.kelvinToCelcius())) + "??"
                self.nameLabel.text = weather.name
                self.dateLabel.text = weather.date.convertoToString()
            }
        }
    }
}
extension MainWeatherViewController: LocationManagerDelegate{
    func didUpdateLocations(latitude: Double, longitude: Double) {
        if !isHourlyWeatherAdded{
            addHourlyWeatherView(latitude: latitude, longitude: longitude)
            isHourlyWeatherAdded.toggle()
        }
        
        updateLabel(latitude: latitude, longitude: longitude)
    }
}
