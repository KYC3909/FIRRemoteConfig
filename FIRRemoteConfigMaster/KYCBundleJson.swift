//
//  BundleJson.swift
//  FIRRemoteConfigMaster
//
//  Created by XYZ on 22/09/17.
//  Copyright © 2017 xyz. All rights reserved.
//

import UIKit
import Foundation

extension Bundle {
    class func loadJsonDataFromJsonFile(_ file : String) -> AnyObject {
        var response : AnyObject = "" as AnyObject
        let path = Bundle.main.path(forResource: file, ofType: "json")
        let jsonData : NSData = NSData(contentsOfFile: path!)!
        do{
            response = try! JSONSerialization.jsonObject(with: jsonData as Data, options: []) as AnyObject
        }
        return response
    }
}
