//
//  HourlyWeatherViewController.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 20.02.2022.
//

import UIKit

class HourlyWeatherViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var networkService: ClientNetworkServiceProtocol!
    private var latitude: Double?
    private var longitude: Double?
    private var hourlyWeather: HourlyWeatherDTO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HourlyWeatherCollectionViewCell.nib, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.reuseIdentifier)
    }
    
    func configure (networkService : ClientNetworkServiceProtocol,
                    latitude:Double?,
                    longitude: Double?){
        self.networkService = networkService
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getHourlyWeather(){
        guard let latitude = latitude,
              let longitude = longitude else { return }
        
        networkService.getHourlyWeather(latitude: latitude, longitude: longitude) { [weak self] response, error in
            guard let self = self else { return }
            self.hourlyWeather = response
            self.collectionView.reloadData()
        }
    }
    
}

extension HourlyWeatherViewController: UICollectionViewDelegate {
    
}

extension HourlyWeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
}

extension HourlyWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 150)
    }
}
