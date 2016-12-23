//
//  IOSPublicDefaultAlert.swift
//  CustomAlert
//
//  Created by Amrit on 12/23/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import Foundation
import UIKit

class IOSPublicDefaultAlert: NSObject{
    
    var viewController: UIViewController?
    var actionCompletion: ((String) -> ())?
    var alertTitle: String?
    var alertMessage : String?
    var alertType: UIAlertControllerStyle?
    var actionTitleAndType: [String: UIAlertActionStyle]?
    
    

    init(viewController : UIViewController,alertTitle: String,alertMessage : String,alertType: UIAlertControllerStyle = .alert,actionTitleAndType: [String: UIAlertActionStyle] ,actionCompletion : @escaping ((String)->())){
        
        super.init()
        self.viewController = viewController
        self.actionCompletion = actionCompletion
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.alertType = alertType
        self.actionTitleAndType = actionTitleAndType
        showAlert()
    }
    
    
    func showAlert(){
        
        let alert = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        for (actionTitle, actionType) in actionTitleAndType!{
            
            let action = UIAlertAction(title: actionTitle, style: actionType) { (action) in
                
                if let com = self.actionCompletion{
                    
                    com(actionTitle)
                }
            }
            alert.addAction(action)
        }
        viewController?.present(alert, animated: true, completion: nil)
    }
}


//
//if let url = NSURL(string: UIApplicationOpenSettingsURLString){
//    if  UIApplication.shared.canOpenURL(url as URL){
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
//        } else {
//            // Fallback on earlier versions
//            UIApplication.shared.openURL(url as URL)
//        }
//    }
//}
