//
//  AllKitchensRouter.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import UIKit
import AllKitchensModuleProtocol

public class AllKitchensRouter : AllKitchensModuleProtocol {

    public init() { }
    
    public func createAllKitchensViewController() -> UIViewController {
        let view = AllKitchensViewController()
        return view
    }
}
