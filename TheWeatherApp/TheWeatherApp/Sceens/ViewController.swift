//
//  ViewController.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let netverkService: ClientNetworkServiceProtocol = ClinetNetworkService()
    private lazy var locationService : LocationManagerProtocol = {
        let locationManager = LocationManager()
        locationManager.delegate = self
        return locationManager
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationService.requestLocation()
        
    }
    
    func getCurrentWeather(latitude: Double, longitude: Double){
        netverkService.getCurrentWeather(latitude: latitude, longitude: longitude) { response, error in
            
        }
    }
}
extension ViewController: LocationManagerDelegate{
    func didUpdateLocations(latitude: Double, longitude: Double) {
        getCurrentWeather(latitude: latitude, longitude: longitude)
    }
}
