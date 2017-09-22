# README #

### What is this repository for? ###

* This Repository is for the just plug and play with 'Firebase Remote Config' with ease than ever using 'JSON' file.


### How do I get set up? ###

* Installation

* You need to pod 'Firebase/RemoteConfig'
* You will need your 'GoogleService-Info.plist' file from Firebase Console. https://console.firebase.google.com/
* Just Drag and drop below files in your Project
* 1) KYCBundleJson.swift
* 2) KYCRCKeyValues.swift
* 3) KYCRemoteConfigFile.json
* 4) UIColor + Extension.swift

* Here you are good to go and
* Just check the 'FIRRemoteConfingVC.swift' for Retrieving Firebase Values.

NOTE:
* File Name must be same as 'KYCRemoteConfigFile.json'
* OR
* Copy/Paste YOUR FILE NAME here instead of 'KYCRemoteConfigFile' in 'KYCBundleJson.swift'
* E.g. => KYCRCKeyValues(jsonFileName: <#Your File Name#>)
* This Code support for Android based '#AARRGGBB', '#ARGB', '#RGB', '#RRGGBB' format so both Android + iOS both can work with same 'Hex Color Code'  

### Contribution guidelines ###

* Thanks to 'Benhurott' to provide Android based Hex color code transform to UIColor 
