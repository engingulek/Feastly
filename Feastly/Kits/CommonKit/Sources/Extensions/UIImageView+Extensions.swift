//
//  UIImageView+Extensions.swift
//  CommonKit
//
//  Created by Engin Gülek on 1.10.2024.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    private var activityIndicatorTag: Int { return 0 }
    
    public func setImage(with urlString: String, placeholder: UIImage? = nil) {
        guard let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }
        
        showActivityIndicator()
        
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ],
            progressBlock: nil,
            completionHandler: { [weak self] result in
                self?.hideActivityIndicator()
            }
        )
    }
    
    private func showActivityIndicator() {
        
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.tag = activityIndicatorTag
        activityIndicator.center = self.center
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(activityIndicator)
        
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func hideActivityIndicator() {
        if let activityIndicator = self.viewWithTag(activityIndicatorTag) as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}

