//
//  TestResult.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 02/08/24.
//

import Foundation

struct TestResult : Codable{
    var id: String
    var date: String
    var correctAnswers: Int
    var incorrectAnswers: Int
    var score: Double
}
