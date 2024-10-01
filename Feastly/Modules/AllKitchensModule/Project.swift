//
//  Project.swift
//  CommonKitManifests
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import ProjectDescription


let allKitchensModule = Project(
    name: "AllKitchensModule",
    packages: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
    ],
    
    targets: [
        .target(name: "AllKitchensModule",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.AllKitchensModule",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: [
                    .project(target: "DependencyKit", path: .relativeToRoot("Kits/DependencyKit")),
                    .project(target:"AllKitchensModuleProtocol" , path: .relativeToRoot("Modules/AllKitchensModule")),
                    .project(target: "FilterRestaurnatListModuleProtocol", path: .relativeToRoot("Modules/FilterRestaurnatListModule")),
                    .project(target: "CommonKit", path: .relativeToRoot("Kits/CommonKit")),
                    .package(product: "SnapKit"),
                    .project(target: "NetworkKit", path: .relativeToRoot("Kits/NetworkKit")),
                ]
                ),
        
            .target(name: "AllKitchensModuleProtocol",
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: "com.ios.AllKitchensModuleProtocol",
                    sources: "ProtocolSource/**"
                   ),
        .target(
            name: "AllKitchensModuleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.ios.AllKitchensModuleTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "AllKitchensModule")]
        )
    ]


)
