//
//  ViewController.swift
//  FIRRemoteConfigMaster
//
//  Created by XYZ on 22/09/17.
//  Copyright © 2017 xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color_app_primary = KYCRCKeyValues.sharedInstance.color(forKey: "color_app_primary")
        lblTitle.textColor = color_app_primary
        txtEmail.textColor = color_app_primary
        txtPass.textColor = color_app_primary
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

