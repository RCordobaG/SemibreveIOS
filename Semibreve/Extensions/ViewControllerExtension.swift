//
//  GViewControllerExtension.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 09/08/24.
//

import Foundation
import UIKit

extension UIViewController{
    func show(error: String) {
            let alert = UIAlertController(title: "Error", message:error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style:.cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        func show(warning: String) {
            let alert = UIAlertController(title: "Alerta",message: warning, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:.cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    func hideKeyboardWhenTapped() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
