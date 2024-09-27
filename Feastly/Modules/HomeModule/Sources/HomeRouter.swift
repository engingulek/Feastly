//
//  HomeRouter.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit
import HomeModuleProtocol
public class HomeRouter : HomeModuleProtocol {
    public init() { }
    public func createHomeViewController() -> UIViewController {
        let view = HomeViewController()
        return view
    }
    
    
}

