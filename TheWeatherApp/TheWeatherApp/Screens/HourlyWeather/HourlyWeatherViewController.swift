//
//  HourlyWeatherViewController.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 20.02.2022.
//

import UIKit

class HourlyWeatherViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var latitude: Double?
    private var longitude: Double?
    private var hourlyWeather: HourlyWeatherDTO?
    private var networkService: ClientNetworkServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HourlyWeatherCollectionViewCell.nib, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.reuseIdentifier)
        
        getHourlyWeather()
    }
    
    func configure (networkService : ClientNetworkServiceProtocol,
                    latitude:Double?,
                    longitude: Double?){
        self.latitude = latitude
        self.longitude = longitude
        self.networkService = networkService

    }
    
    func getHourlyWeather(){
        guard let latitude = latitude,
              let longitude = longitude else { return }
        
        networkService.getHourlyWeather(latitude: latitude, longitude: longitude) { response, error in
            self.hourlyWeather = response
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    
}

extension HourlyWeatherViewController: UICollectionViewDelegate {
    
}

extension HourlyWeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = hourlyWeather?.hourly.count ?? 0
        return count > 24 ? 24 : count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.reuseIdentifier, for: indexPath) as! HourlyWeatherCollectionViewCell
        
        return cell
    }
}

extension HourlyWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 150)
    }
}
