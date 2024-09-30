//
//  Project.swift
//  Config
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import ProjectDescription

let homeModule = Project (
    name: "HomeModule",
    packages: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
        .package(url:"https://github.com/onevcat/Kingfisher.git",from:"8.0.2")
    ],
    targets: [
        .target(name: "HomeModule",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.HomeModule",
                infoPlist: .extendingDefault(
                    with: [
                        "NSLocationWhenInUseUsageDescription": "Konum bilgilerinizi kullanmak için izin gerekmektedir.",
                        "NSLocationAlwaysUsageDescription": "Konum bilgilerinizi her zaman kullanmak için izin gerekmektedir."
                    ]
                ),
                sources: "Sources/**",
                dependencies: [
                    .project(target: "HomeModuleProtocol", path: .relativeToRoot("Modules/HomeModule")),
                    .project(target: "CommonKit", path: .relativeToRoot("Kits/CommonKit")),
                    .package(product: "SnapKit"),
                    .project(target: "NetworkKit", path: .relativeToRoot("Kits/NetworkKit")),
                    .package(product:"Kingfisher"),
                    .project(target:"AllKitchensModuleProtocol" , path: .relativeToRoot("Modules/AllKitchensModule")),
                    .project(target: "FilterRestaurnatListModuleProtocol", path: .relativeToRoot("Modules/FilterRestaurnatListModule"))
                ]
                
               ),
        .target(name:"HomeModuleProtocol",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.HomeModuleProtocol",
                sources: "ProtocolSource/**"
                
               ),
        .target(
            name: "HomeModuleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.ios.HomeModuleTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "HomeModule")]
        ),
    ]
)
