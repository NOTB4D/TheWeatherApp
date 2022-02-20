//
//  UICollectionReusableView+.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 20.02.2022.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String{
        return String(describing: self)
    }
    
    static var nib :UINib{
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
}
