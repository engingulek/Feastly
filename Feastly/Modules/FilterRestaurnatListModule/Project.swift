//
//  Project.swift
//  AllKitchensModuleManifests
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import ProjectDescription
let filterRestaurnatListModule = Project(
    name: "FilterRestaurnatListModule",
    packages: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
    ],
    targets: [
    
        .target(name: "FilterRestaurnatListModule",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.FilterRestaurnatListModule",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: [
                   .project(target: "FilterRestaurnatListModuleProtocol", path: .relativeToRoot("Modules/FilterRestaurnatListModule")),
                   .project(target: "RestaurantDetailModuleProtocol", path: .relativeToRoot("Modules/RestaurantDetailModule")),
                    .project(target: "CommonKit", path: .relativeToRoot("Kits/CommonKit")),
                    .package(product: "SnapKit"),
                    .project(target: "NetworkKit", path: .relativeToRoot("Kits/NetworkKit")),
                ]
                
               ),
        .target(name: "FilterRestaurnatListModuleProtocol",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.FilterRestaurnatListModuleProtocol",
                sources: "ProtocolSource/**"
               ),
        .target(
            name: "FilterRestaurnatListModuleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.ios.FilterRestaurnatListModuleTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "FilterRestaurnatListModule")]
        )
    
    
    
    ]
)
