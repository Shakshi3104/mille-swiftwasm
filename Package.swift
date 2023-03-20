// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "mille-swiftwasm",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "mille-swiftwasm", targets: ["mille-swiftwasm"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.9.0")
    ],
    targets: [
        .target(
            name: "mille-swiftwasm",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .testTarget(
            name: "mille-swiftwasmTests",
            dependencies: ["mille-swiftwasm"]),
    ]
)