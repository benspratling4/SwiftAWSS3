//3.1
import PackageDescription
let package = Package(
	name: "SwiftAWSS3"
	,dependencies:[
	.Package(url:"https://github.com/benspratling4/SwiftAWSSignatureV4.git", majorVersion:0)
	]
)
