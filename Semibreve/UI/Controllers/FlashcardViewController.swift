//
//  FlashcardViewController.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 07/08/24.
//

import UIKit

class FlashcardViewController: UIViewController {

    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var roundsLabel: UILabel!
    
    @IBOutlet weak var notesImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    var notes : [String] = []
    var noteImages : [String: UIImage?] = [:]
    var noteImageStrings : [String : String] = [:]
    var buttons : [UIButton] = []
    
    var noteIndex : Int = 0
    var correctNote : String = ""
    var buttonIndex : Int = 0
    var correctButton : UIButton?
    var correctTag : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RuntimeSettings.settings.currentRound += 1
        roundsLabel.text = "Rounds: \(RuntimeSettings.settings.currentRound) | \(RuntimeSettings.settings.rounds)"
        
        if(RuntimeSettings.settings.scale){
            notes = US_notes
            noteImages = noteImageUS
            noteImageStrings = noteImageUS_S
        }
        else{
            notes = EU_notes
            noteImages = noteImageEU
            noteImageStrings = noteImageEU_S
            
        }
        
        buttons = [option1Button,option2Button,option3Button,option4Button]
        noteIndex = notes.indices.randomElement()!
        correctNote = notes[noteIndex]
        notes.remove(at: noteIndex)
        buttonIndex = buttons.indices.randomElement()!
        correctButton = buttons[buttonIndex]
        buttons.remove(at: buttonIndex)
        
        print(correctNote)
        correctButton?.titleLabel?.text = correctNote
        correctTag = correctButton!.tag
        
        notesImageView.image = noteImages[correctNote]!
        //notesImageView.image = UIImage(named: noteImageStrings[correctNote]!)
        print(noteImageStrings)
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let tag = (sender as? UIButton)?.tag else{
            return
        }
        
        if tag == correctTag{
            print("Correct answer")
            answerLabel.text = String(localized: "Correct")
        }
        
        else{
            print("Incorrect answer")
            answerLabel.text = String(localized: "Incorrect")
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
