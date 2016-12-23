//
//  ATToastMessageAlert.swift
//  CustomAlert
//
//  Created by Amrit on 12/21/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import Foundation
import UIKit


class ATToastMessageAlert: UIView {
    
    let imageViewToast: UIImageView = {
        let toastimageView = UIImageView()
        toastimageView.translatesAutoresizingMaskIntoConstraints = false
        return toastimageView
    }()
    
    let lblToastTitle: UILabel = {
        let lbltoastTitle = UILabel()
        lbltoastTitle.textAlignment = .left
        lbltoastTitle.adjustsFontSizeToFitWidth = true
        lbltoastTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        return lbltoastTitle
    }()
    
    let lblToastMessage: UILabel = {
        let lblToastMessage = UILabel()
        lblToastMessage.textAlignment = .left
        lblToastMessage.adjustsFontSizeToFitWidth = true
        lblToastMessage.font = UIFont(name: "HelveticaNeue", size: 13)
        return lblToastMessage
    }()
    
    let imageXpostion = 20
    let imageLeading = 10
    let imageViewWidthAndHeight = 40
    
    let lblToastTopAndBotttom = 10
    let lblToastTrailling = 20
    let lblToastLeading = 20
    
    let lblToastXpostion = 80
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(imageViewToast)
        self.addSubview(lblToastTitle)
        self.addSubview(lblToastMessage)
        
        addConstraintsWithFormat("H:|-(\(imageXpostion))-[v0(\(imageViewWidthAndHeight))]-(\(lblToastLeading))-[v1]-(\(lblToastTrailling))-|", views: imageViewToast,lblToastTitle)
        addConstraintsWithFormat("H:|-(\(imageLeading))-[v0(\(imageViewWidthAndHeight))]-(\(lblToastLeading))-[v1]-(\(lblToastTrailling))-|", views: imageViewToast,lblToastMessage)
        
        addConstraintsWithFormat("V:|-(\(lblToastTopAndBotttom))-[v0(16)]-[v1(14)]-(\(lblToastTopAndBotttom))-|", views: lblToastTitle,lblToastMessage)
        addConstraintsWithFormat("V:[v0(\(imageViewWidthAndHeight))]", views: imageViewToast)
        
        imageViewToast.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
}

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

