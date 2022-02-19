//
//  ViewController.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import UIKit

class ViewController: UIViewController {

    private let service: ClientNetworkServiceProtocol = ClinetNetworkService()
    private var latitude: Double?
    private var longitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard latitude != nil, longitude != nil else { return }
        service.getCurrentWeather(latitude: latitude, longitude: longitude) { response, error in
            
        }
    }


}

