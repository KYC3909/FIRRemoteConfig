//
//  KYCRCKeyValues.swift
//  FIRRemoteConfigMaster
//
//  Created by XYZ on 22/09/17.
//  Copyright © 2017 xyz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseRemoteConfig

class KYCRCKeyValues {
    // File Name must be same as 'KYCRemoteConfigFile.json'
    // OR
    // Copy/Paste your File name here instead of 'KYCRemoteConfigFile' file name
    // E.g. => KYCRCKeyValues(jsonFileName: <#Your File Name#>)
    static let sharedInstance = KYCRCKeyValues(jsonFileName: "KYCRemoteConfigFile")
    var completionCallback: (() -> ())?
    var defaultKeysValues: [String: NSObject] = [:]
    
    init(jsonFileName : String) {
        // firebase
        FirebaseApp.configure()
        let keysValues = (Bundle.loadJsonDataFromJsonFile(jsonFileName))
        loadDefaultKeysValues(keysValues as! [String : NSObject])
    }
    
    func loadDefaultKeysValues(_ keysValues : [String: NSObject]) {
        defaultKeysValues = keysValues
        RemoteConfig.remoteConfig().setDefaults(defaultKeysValues)
        retrieveFirebaseValues()
    }
    //MARK:-
    func retrieveFirebaseValues() {
        // Configure for dev mode if we need it, otherwise a 30 secs expiration duration for higher efficiency
        var fetchDuration: TimeInterval = 0
        #if DEBUG
            activateDebugMode()
        #else
            fetchDuration = 30
        #endif
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) {
            [weak self] (status, error) in
            
            guard error == nil else {
                print ("Error Found while Retrieving Values from Firebase : \(error?.localizedDescription ?? "Error")")
                self?.completionCallback?()
                return
            }
            
            // Retrieved values from the Firebase!
            RemoteConfig.remoteConfig().activateFetched()
            print ("Retrieved values from the Firebase!")
            
            self?.completionCallback?()
        }
    }
    func activateDebugMode() {
        let debugSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings!
    }
    
    //MARK:-
    func color(forKey key: String) -> UIColor {
        let colorAsHexString = RemoteConfig.remoteConfig()[key].stringValue ?? "#FFFFFFFF"
        let convertedColor = UIColor(hexString: colorAsHexString) // ARGB Format
        return convertedColor
    }
    
    func bool(forKey key: String) -> Bool {
        return RemoteConfig.remoteConfig()[key].boolValue
    }
    
    func string(forKey key: String) -> String {
        return RemoteConfig.remoteConfig()[key].stringValue ?? ""
    }
    
    func double(forKey key: String) -> Double {
        if let numberValue = RemoteConfig.remoteConfig()[key].numberValue {
            return numberValue.doubleValue
        } else {
            return 0.0
        }
    }
    func time(forKey key: String) -> Double {
        if let numberValue = RemoteConfig.remoteConfig()[key].numberValue {
            return numberValue.doubleValue/1000.0
        } else {
            return 0.0
        }
    }

}
