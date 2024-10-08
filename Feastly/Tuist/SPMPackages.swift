//
//  SPMPackages.swift
//  Config
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import ProjectDescription


public extension Package {
    static var snapKit : Self {
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.7.1"))
    }
    
    static var alamofire : Self {
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1"))
    }
    
    static var kingfisher : Self {
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0"))
    }
}





public let snapKit =  TargetDependency.package(product: "SnapKit")
public let alamofire = TargetDependency.package(product: "Alamofire")
public let kingfisher = TargetDependency.package(product: "Kingfisher")
