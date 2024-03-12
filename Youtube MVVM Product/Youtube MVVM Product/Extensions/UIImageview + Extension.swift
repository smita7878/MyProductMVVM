//
//  UIImageview + Extension.swift
//  Youtube MVVM Product
//
//  Created by SMITA BHUTKA on 01/03/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
