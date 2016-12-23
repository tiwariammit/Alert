//
//  ATAndroidTypeToast.swift
//  CustomAlert
//
//  Created by Amrit on 12/23/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import Foundation
import UIKit

class ATAndroidTypeToast: NSObject{
    
    var message : String?
    
    init(message: String) {
        super.init()
        self.message = message
        toastMessage()
    }
    
    func toastMessage(){
        
        let toastLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/8, y: UIScreen.main.bounds.height - 85, width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/4, height: 35))
        
        toastLabel.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.141, alpha: 1.00)
        toastLabel.textColor = UIColor.white
        toastLabel.text = self.message
        toastLabel.textAlignment = NSTextAlignment.center
        toastLabel.adjustsFontSizeToFitWidth = true
        let window = UIApplication.shared.keyWindow
        
        window?.addSubview(toastLabel)
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        UIView.animate(withDuration: 1.5, delay: 0.1, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
            
        }) { (val) in
            toastLabel.removeFromSuperview()
        }
    }
}
