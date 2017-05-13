# SwiftAWSS3
Amazon AWS S3 convenience

## Common

1. Create a bucket with your bucket name and region

	let bucket = AWSBucket(name: "", region: "")

2.	Crete a request for a particular action using one of the method listed below

3. Sign the request with your AWSAccount

	let awsAccount = AWSAccount(serviceName: "s3", region: "", accessKeyID: "", secretAccessKey: "")

	request.sign(for: awsAccount)

4.	Do whatever it is you do to use a URLRequest


## GET

2. Create a `URLRequest` for a particular object name, including the leading `/`.

	guard var request:URLRequest = bucket.requestToGETObjectNamed("") else ...


## PUT

1. Instantiate an `S3PutComponents` instance with the bucket, object name and data

2. Add optional properties, like an acl, mimetype or server side encryption

3. Use the `.request` property to get a `URLRequest` 


## DELETE

1.	With your `AWSBucket` instance, create a request to delete an object.

	guard var request:URLRequest = bucket.requestToDELETEObjectNamed("my object name ") else ...

## In development

Please make feature requests or pull requests as needed
