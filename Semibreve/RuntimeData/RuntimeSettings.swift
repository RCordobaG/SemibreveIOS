//
//  RuntimeSettings.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 02/08/24.
//

import Foundation
import UIKit

class RuntimeSettings{
    static let settings = RuntimeSettings()
    
    let defaults = UserDefaults.standard
    
    var scale : Bool
    var rounds : Int
    var currentRound : Int
    var correctAnswers : Int
    var incorrectAnswers : Int
    var score : Double
    var newRoundTimer : Int
    var manualMode : Bool
    
    var resultJSONList : [TestResult] = []
    
    let context = (UIApplication.shared .delegate as! AppDelegate).persistentContainer.viewContext
    var globalManager : LocalResultsManager?
    
    private init(){
        currentRound = 0
        scale = defaults.bool(forKey: "scale")
        rounds = 10
        correctAnswers = 0
        incorrectAnswers  = 0
        score = 0
        newRoundTimer = defaults.integer(forKey: "timer")
        if(newRoundTimer == 0){
            newRoundTimer = 1
            defaults.set(1, forKey: "timer")
        }
        manualMode = defaults.bool(forKey: "manual")
        
        globalManager = LocalResultsManager(context: context)
        globalManager!.loadResults()
    }
    
    func computeScore() -> Double{
        self.score = Double(self.correctAnswers) / Double(self.rounds)
        self.score *= 100
        return self.score
    }
    
    func computePartialScore() -> Double{
        self.score = Double(self.correctAnswers) / Double(self.currentRound)
        self.score *= 100
        return self.score
    }
    
    func resetValues(){
        currentRound = 0
        scale = defaults.bool(forKey: "scale")
        rounds = 10
        correctAnswers = 0
        incorrectAnswers  = 0
        score = 0
        newRoundTimer = defaults.integer(forKey: "timer")
        if(newRoundTimer == 0){
            newRoundTimer = 1
            defaults.set(1, forKey: "timer")
        }
        manualMode = defaults.bool(forKey: "manual")
    }
}
