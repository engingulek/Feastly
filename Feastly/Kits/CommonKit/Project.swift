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
    targets: [
        .target(name: "CommonKit",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.CommonKit",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: []
               ),
    ]
)
