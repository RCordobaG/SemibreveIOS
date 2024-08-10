//
//  GViewControllerExtension.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 09/08/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(error: String) {
            let alert = UIAlertController(title: String(localized: "Unsaved results"), message:error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: String(localized: "Cancel"), style:.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: String(localized: "Exit without saving"), style:.destructive, handler: dismissView))
            present(alert, animated: true, completion: nil)
        }
    
    func showAlertEnd(error: String) {
            let alert = UIAlertController(title: String(localized: "End current test?"), message:error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: String(localized: "Cancel"), style:.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: String(localized: "Exit without saving"), style:.destructive, handler: dismissView))
            alert.addAction(UIAlertAction(title: String(localized: "Save and exit"), style:.default, handler: saveResults))
            present(alert, animated: true, completion: nil)
        }
        
        func showAlert(warning: String) {
            let alert = UIAlertController(title: String(localized: "Warning"),message: warning, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: String(localized: "Accept"), style:.cancel, handler: nil))
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
    
    func dismissView(alert: UIAlertAction!){
        RuntimeSettings.settings.currentRound = 0
        RuntimeSettings.settings.correctAnswers = 0
        RuntimeSettings.settings.incorrectAnswers = 0
        navigationController?.popViewController(animated: true)
    }
    
    func saveResults(alert: UIAlertAction!){
        let newResult = TestResult(id: String(Date().timeIntervalSince1970), date: String(Date().ISO8601Format()), correctAnswers: RuntimeSettings.settings.correctAnswers, incorrectAnswers: RuntimeSettings.settings.incorrectAnswers, score: RuntimeSettings.settings.computePartialScore())
        RuntimeSettings.settings.globalManager?.createResult(result: newResult)
        RuntimeSettings.settings.globalManager?.saveResults()
        RuntimeSettings.settings.resetValues()
        navigationController?.popViewController(animated: true)
    }
}
