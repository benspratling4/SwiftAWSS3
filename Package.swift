// swift-tools-version:4.0
import PackageDescription
let package = Package(
	name: "SwiftAWSS3",
	products: [
		.library(
			name: "SwiftAWSS3",
			targets: ["SwiftAWSS3"]),
		],
	dependencies:[
		.package(url:"https://github.com/benspratling4/SwiftAWSSignatureV4.git", from:"1.0.0")
		,.package(url:"https://github.com/benspratling4/SwiftPatterns.git", from:"2.0.0")
	],
	targets:[
		.target(
			name: "SwiftAWSS3",
			dependencies: ["SwiftAWSSignatureV4", "SwiftPatterns"]),
	  .testTarget(
		name: "SwiftAWSS3Tests",
		dependencies: ["SwiftAWSS3"]),
	  ],
	swiftLanguageVersions:[3,4]
)
