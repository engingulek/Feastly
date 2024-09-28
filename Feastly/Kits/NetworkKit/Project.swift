//
//  Project.swift
//  CommonKitManifests
//
//  Created by Engin Gülek on 28.09.2024.
//

import Foundation
import ProjectDescription
let networkKit = Project (
    name: "NetworkKit",
    packages: [.package(url: "https://github.com/Alamofire/Alamofire", from:"5.8.1")],
    targets: [
        .target(name: "NetworkKit",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.NetworkKit",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: [
                    .package(product:"Alamofire")
                ]
               ),
    ]
)
