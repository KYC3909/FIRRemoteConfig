//
//  FIRRemoteConfingVC.swift
//  FIRRemoteConfigMaster
//
//  Created by XYZ on 22/09/17.
//  Copyright © 2017 xyz. All rights reserved.
//

import UIKit

class FIRRemoteConfingVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "#FFF0")
        KYCRCKeyValues.sharedInstance.completionCallback = performLoginScreen
    }
    
    func performLoginScreen() {
        performSegue(withIdentifier: "segueLoginScreen", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
