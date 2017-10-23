//
//  ServerSideEncryption.swift
//  SwiftAWSS3
//
//  Created by Ben Spratling on 5/13/17.
//
//

import Foundation



public enum ServerSideEncryption {
	case `default`
	
	/// id of kms custom master key
	case master(String)
}
