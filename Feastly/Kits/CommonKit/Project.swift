//
//  Project.swift
//  Config
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import ProjectDescription
let commonKit = Project (
    name: "CommonKit",
    packages: [
        .package(url:"https://github.com/onevcat/Kingfisher.git",from:"8.0.2"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
    ],
    targets: [
        .target(name: "CommonKit",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.CommonKit",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: [
                    .package(product:"Kingfisher"),
                    .package(product: "SnapKit")
                ]
               ),
    ]
)
