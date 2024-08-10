//
//  SessionResultsViewController.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 08/08/24.
//

import UIKit

class SessionResultsViewController: UIViewController {

    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var incorrectAnswerLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var newResult : TestResult!
    
    override func viewDidLoad() {
        var manager = LocalResultsManager(context: context)
        super.viewDidLoad()
        var resultViewController = ResultListViewController()
        addChild(resultViewController)
        self.view.addSubview(resultViewController.view)
        let correctAnswers = RuntimeSettings.settings.correctAnswers
        let incorrectAnswers = RuntimeSettings.settings.incorrectAnswers
        let score : Double = RuntimeSettings.settings.computeScore() * 100
        correctAnswerLabel.text = String(localized: "Correct answers: \(correctAnswers)")
        incorrectAnswerLabel.text = String(localized: "Incorrect answers: \(incorrectAnswers)")
        finalScoreLabel.text = String(localized: "Final score: \(score)")
        newResult = TestResult(id: String(Date().timeIntervalSince1970), date: String(Date().ISO8601Format()), correctAnswers: correctAnswers, incorrectAnswers: incorrectAnswers, score: score)
        manager.createResult(result: newResult)
        manager.saveResults()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnToMenu(_ sender: Any) {
        performSegue(withIdentifier: "unwindResults", sender: self)
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
