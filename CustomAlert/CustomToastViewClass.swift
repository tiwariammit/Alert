//
//  CustomToastViewClass.swift
//  CustomAlert
//
//  Created by Amrit on 12/21/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import Foundation
import UIKit


@objc protocol TapOnATToastMessageProtocal:class {
    
    @objc optional func tapOnATToastMessageMethod()
}

var toastView1 : ATToastMessageAlert?

class CustomToastViewClass: NSObject{
    
    var timer : Timer?
    weak var delegate : TapOnATToastMessageProtocal?
    
    var title:String?
    var message:String?
    var image:UIImage?
    let toastV = ATToastMessageAlert()

    
    init(withTitle title:String?, andMessage message:String?, image:UIImage?, withDelegate delegate:TapOnATToastMessageProtocal) {
        
        super.init()
        self.delegate = delegate
        self.title = title
        self.message = message
        self.image = image
        showToast()
        let tapguesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnATToastView(tap:)))
        tapguesture.numberOfTapsRequired = 1
        toastV.isUserInteractionEnabled = true
        toastV.addGestureRecognizer(tapguesture)
        
    }
    
    func tapOnATToastView(tap: UITapGestureRecognizer){
        
        delegate?.tapOnATToastMessageMethod!()
    }
    
    func showToast() {
        
        let window = UIApplication.shared.keyWindow!
        window.addSubview(toastV)
        
        
        if toastView1 != nil{
            
            return
        }
        
        toastView1 = toastV
        UIApplication.shared.isStatusBarHidden = true
        
        window.addConstraintsWithFormat("H:|[v0]|", views: toastV)
        window.addConstraintsWithFormat("V:|[v0]", views: toastV)
        window.layoutIfNeeded()
        let height: CGFloat = toastV.frame.height
        
        toastV.imageViewToast.image = image
        toastV.lblToastTitle.text = title
        toastV.lblToastMessage.text = message
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.hideToastV), userInfo: toastV, repeats: false)
        
        
        toastV.transform = CGAffineTransform(translationX: 0, y: -height)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.toastV.transform = CGAffineTransform.identity
            
        })
    }
    
    func hideToastV(value: Timer){
        
        if let v: ATToastMessageAlert = value.userInfo as? ATToastMessageAlert {
            
            UIView.animate(withDuration: 0.3, animations: {
                v.removeFromSuperview()
                UIApplication.shared.isStatusBarHidden = false
                toastView1 = nil
                self.timer?.invalidate()
                
            })
        }
    } 
}
