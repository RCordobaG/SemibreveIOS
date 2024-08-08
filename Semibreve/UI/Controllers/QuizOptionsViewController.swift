//
//  QuizOptionsViewController.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 05/08/24.
//

import UIKit

class QuizOptionsViewController: UIViewController {

    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var scaleSwitch: UISwitch!
    @IBOutlet weak var scalePreview: UILabel!
    @IBOutlet weak var roundsTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateInterface()
    }
    
    @IBAction func scaleSwitchToggled(_ sender: Any) {
        updateInterface()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        RuntimeSettings.settings.rounds = Int(roundsTextView.text!) ?? 10
    }
    
    func updateInterface(){
        if(scaleSwitch.isOn){
            RuntimeSettings.settings.scale = true
            scaleLabel.text = String(localized: "American")
            scalePreview.text = String(localized: "C-D-E-F-G-B-A")
        }
        else{
            RuntimeSettings.settings.scale = false
            scaleLabel.text = String(localized: "European")
            scalePreview.text = String(localized: "Do-Re-Mi-Fa-Sol-La-Si")
        }
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
