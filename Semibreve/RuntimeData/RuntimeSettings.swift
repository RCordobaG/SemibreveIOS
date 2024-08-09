//
//  RuntimeSettings.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 02/08/24.
//

import Foundation

class RuntimeSettings{
    static let settings = RuntimeSettings()
    
    var scale : Bool
    var rounds : Int
    var currentRound : Int
    var correctAnswers : Int
    var incorrectAnswers : Int
    var score : Double
    var newRoundTimer : Int64
    
    private init(){
        currentRound = 0
        scale = false
        rounds = 10
        correctAnswers = 0
        incorrectAnswers  = 0
        score = 0
        newRoundTimer = 10000
    }
    
    func computeScore() -> Double{
        self.score = Double(self.correctAnswers) / Double(self.rounds)
        print(self.score)
        return self.score
    }
}
