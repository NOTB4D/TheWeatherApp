//
//  LocationManager.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation
import MapKit


class LocationManager: NSObject, LocationManagerProtocol {
    
    private lazy var locationManager: CLLocationManager = {
        let locatinManager = CLLocationManager()
        locatinManager.delegate = self
        return locatinManager
    }()
    
     weak var delegate: LocationManagerDelegate?
    
    func requestLocation(){
        switch locationManager.authorizationStatus{
        case .authorized, .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        let latitude = Double(coordinate.latitude)
        let longitude = Double(coordinate.longitude)
        self.delegate?.didUpdateLocations(latitude: latitude, longitude: longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocation()
    }
}
