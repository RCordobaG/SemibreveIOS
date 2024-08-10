//
//  SettingsViewController.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 04/08/24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var manualModeSwitch: UISwitch!
    @IBOutlet weak var roundTimerTextField: UITextField!
    
    let defaults = UserDefaults.standard
    let context = (UIApplication.shared .delegate as! AppDelegate).persistentContainer.viewContext
    var manager : LocalResultsManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = LocalResultsManager(context: context)
        self.hideKeyboardWhenTapped()
        roundTimerTextField.text = String(RuntimeSettings.settings.newRoundTimer)
        manualModeSwitch.isOn = RuntimeSettings.settings.manualMode
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeModal(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveConfig(_ sender: Any) {
        RuntimeSettings.settings.newRoundTimer = Int(roundTimerTextField.text!) ?? 1
        RuntimeSettings.settings.manualMode = manualModeSwitch.isOn
        
        defaults.set(RuntimeSettings.settings.newRoundTimer, forKey: "timer")
        defaults.set(RuntimeSettings.settings.manualMode, forKey: "manual")
        self.dismiss(animated: true)
    }
    
    
    @IBAction func deleteResults(_ sender: Any) {
        self.showAlertDelete(error: String(localized: "Are you sure you want to deleta all test results?"))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
