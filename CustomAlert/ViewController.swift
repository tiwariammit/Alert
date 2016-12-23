//
//  ViewController.swift
//  CustomAlert
//
//  Created by Amrit on 12/21/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TapOnATToastMessageProtocal{
    
    var timer : Timer?
    var customView : CustomToastViewClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func presentToastAction(_ sender: Any) {        

        let imageName = UIImage(named: "donDai")
        let title = "Hello EveryOne"
        let message = "Hello EveryOne this is me"

        customView = CustomToastViewClass(withTitle: title, andMessage: message, image:imageName,withDelegate:self )
        
    }
    
    @IBAction func presentToastViewAction(_ sender: Any) {
        _ = ATAndroidTypeToast(message: "hello This me. hello This me.")
    }

    func tapOnATToastMessageMethod() {
        print("delegate called")
    }
    
    @IBAction func presentIOSTypeAlertAction(_ sender: Any) {
        
        _ = IOSPublicDefaultAlert(viewController: self, alertTitle: "Warning", alertMessage: "This is warnning", alertType: UIAlertControllerStyle.alert, actionTitleAndType: ["Ok":.default,"hehhehe": .cancel,"Cancel": .destructive,"3": .default], actionCompletion: { [weak self](value) in
            
            print(value)
            print(self ?? UIViewController())
        })
    }
}




