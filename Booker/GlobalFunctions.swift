//
//  GlobalFunctions.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

import UIKit

//MARK: - Timing and execution queues
///Perform closure on main after specified delay
func after(_ delay: Double, closure:@escaping ()->Void) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

///Perform closure on main thread
func onMain(closure:@escaping ()->Void) {
    DispatchQueue.main.async(execute: closure)
}

///Perform closure on background thread
func onBackground(closure:@escaping()->Void) {
    DispatchQueue.global(qos: .background).async(execute: closure)
}

//MARK: - UIView extensions
extension UIView {
    func pin(to view: UIView, insetBy inset: CGFloat = 0 ) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset)
            ])
    }
    
    func pinSides(to view: UIView, insetBy inset: CGFloat = 0 ) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            ])
    }
    
    func center(on view: UIView, insetBy inset : CGFloat = 0) {
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: inset),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: inset)
            ])
    }
    
    func debug(_ color : UIColor = UIColor.red) {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = color.cgColor
    }
}
