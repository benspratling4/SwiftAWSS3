import Foundation
@testable import SwiftAWSS3
import XCTest
import SwiftAWSSignatureV4
import Dispatch

class GETTests : XCTestCase {
	//Fill in the string constants to run your own tastes with your own account
	/*
	func testGET() {
		let bucket = AWSBucket(name: "", region: "")
		
		guard var request = bucket.requestToGETObjectNamed("")
			else {
				XCTFail("didn't generate request")
				return
		}
		let awsAccount = AWSAccount(serviceName: "s3", region: "", accessKeyID: "", secretAccessKey: "")
		
		request.sign(for: awsAccount)
		
		let session = URLSession(configuration: .default)
		
		let group = DispatchGroup()
		group.enter()
		var data:Data?
		let task = session.dataTask(with: request) { (dataOrNil, responseOrNil, errorOrNil) in
			defer {
				group.leave()
			}
			data = dataOrNil
			if let error = errorOrNil {
				print("error = \(error)")
			}
		}
		task.resume()
		guard group.wait(wallTimeout: .now() + 30) == .success
			,let bodyData:Data = data
			,let text = String(data:bodyData, encoding:.utf8)
			
			else {
			XCTFail("timed out")
			 return
		}
		
		print(text)
		
	}
*/
}
