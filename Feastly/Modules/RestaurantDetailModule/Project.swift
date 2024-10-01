//
//  Project.swift
//  AllKitchensModuleManifests
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import ProjectDescription

let restaurantDetailModule = Project(
    name: "RestaurantDetailModule",
    packages: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
    ],
    targets: [
    
        .target(name: "RestaurantDetailModule",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.RestaurantDetailModule",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: [
                    .project(target: "RestaurantDetailModuleProtocol", path: .relativeToRoot("Modules/RestaurantDetailModule")),
                    .project(target: "CommonKit", path: .relativeToRoot("Kits/CommonKit")),
                    .package(product: "SnapKit"),
                    .project(target: "NetworkKit", path: .relativeToRoot("Kits/NetworkKit"))
                ]
               ),
        
            .target(name: "RestaurantDetailModuleProtocol",
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: "com.ios.RestaurantDetailModuleProtocol",
                    sources: "ProtocolSource/**"
                   )
    
    
    ]
)
