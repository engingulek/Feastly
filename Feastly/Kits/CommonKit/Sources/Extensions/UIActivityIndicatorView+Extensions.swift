//
//  UIActivitiyIndicator.swift
//  CommonKit
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import UIKit
extension UIActivityIndicatorView {
    static public func baseActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(hex: ColorTheme.secondaryLabelColor.rawValue)
        indicator.style = .large
        return indicator
    }
}
