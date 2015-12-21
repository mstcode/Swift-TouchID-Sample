//
//  ViewController.swift
//  TouchID
//
//  Created by mstcode on 18/12/15.
//  Copyright © 2015 mstcode. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func authenticationWithTouchID(sender: AnyObject) {
        let context = LAContext()
        var error : NSError?
        
        if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {(success,error) -> Void in
                if (success) {
                    self.showAlert("Touch ID Authentication Succesded")
                } else {
                    self.showAlert("Touch ID Authentication Failed")
                }
            })
        } else {
            showAlert("Touch ID not available")
        }
    }
    
    
    func showAlert(msg:String) {
        let alert : UIAlertController = UIAlertController(title: nil, message: msg, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

