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
    var correctAnswers : Int
    var incorrectAnswers : Int
    var score : Double
    var newRoundTimer : Int64
    
    private init(){
        scale = false
        rounds = 10
        correctAnswers = 0
        incorrectAnswers  = 0
        score = 0
        newRoundTimer = 10000
    }
}
