// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CodableWitnessForMappingIntoDomainLayer",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "CodableWitnessForMappingIntoDomainLayer",
            targets: ["Domain", "RemoteClient"]),
    ],
    dependencies: [
        .package(name: "swift-coding", url: "https://github.com/lukeredpath/swift-coding", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: []),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]),
        .target(
            name: "RemoteClient",
            dependencies: ["Domain", .product(name: "Coding", package: "swift-coding")]),
        .testTarget(
            name: "RemoteClientTests",
            dependencies: ["RemoteClient"]),
    ]
)
