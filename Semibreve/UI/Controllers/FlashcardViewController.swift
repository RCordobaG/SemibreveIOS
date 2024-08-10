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
    
    @IBOutlet weak var nextFlashcardButton: UIButton!
    
    var notes : [String] = []
    var noteImages : [String: UIImage?] = [:]
    var noteImageStrings : [String : String] = [:]
    var buttons : [UIButton] = []
    
    var noteIndex : Int = 0
    var correctNote : String = ""
    var buttonIndex : Int = 0
    var correctButton : UIButton!
    var correctTag : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if RuntimeSettings.settings.manualMode{
            nextFlashcardButton.isHidden = false
            nextFlashcardButton.isEnabled = true
        }
        else{
            nextFlashcardButton.isHidden = true
            nextFlashcardButton.isEnabled = false
        }
        updateUI()
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if(RuntimeSettings.settings.currentRound >= RuntimeSettings.settings.rounds){
            self.performSegue(withIdentifier: "showResult", sender: self)
        }
        else{
            updateUI()
        }
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let tag = (sender as? UIButton)?.tag else{
            return
        }
        
        print(sender.titleLabel?.text)
                
        if tag == correctTag{
            print("Correct answer")
            answerLabel.text = String(localized: "Correct")
            RuntimeSettings.settings.correctAnswers += 1
        }
        
        else{
            print("Incorrect answer")
            answerLabel.text = String(localized: "Incorrect")
            RuntimeSettings.settings.incorrectAnswers += 1
        }
        
        
        if (RuntimeSettings.settings.manualMode == false) {
            if(RuntimeSettings.settings.currentRound >= RuntimeSettings.settings.rounds){
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(RuntimeSettings.settings.newRoundTimer)){
                    self.performSegue(withIdentifier: "showResult", sender: self)
                }
            }
            
            else{
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(RuntimeSettings.settings.newRoundTimer)){
                    self.updateUI()
                }
            }
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
    
    func updateUI(){
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
        //Select a note from the list and pop it so it can't appear twixe
        noteIndex = notes.indices.randomElement()!
        correctNote = notes[noteIndex]
        notes.remove(at: noteIndex)
        //Select which button will be the correct one at random and pop it
        buttonIndex = buttons.indices.randomElement()!
        correctButton = buttons[buttonIndex]
        //print(correctButton)
        buttons.remove(at: buttonIndex)
        
        correctButton.titleLabel?.text = correctNote
        correctTag = correctButton!.tag
        
        //Fill the rest of the buttons with random, non-repeating elements from the rest of the note list
        for button in buttons{
            var noteIndex = notes.indices.randomElement()
            button.titleLabel?.text = notes[noteIndex!]
            notes.remove(at: noteIndex!)
            //print(notes)
        }
        
        
        
        notesImageView.image = noteImages[correctNote]!
        //notesImageView.image = UIImage(named: noteImageStrings[correctNote]!)
        print(noteImageStrings)
        
    }

}
