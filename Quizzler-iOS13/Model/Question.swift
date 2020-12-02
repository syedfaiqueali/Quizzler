//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Faiq on 01/12/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    
    //Multiple choice questions have multiple ans. So, array.
    let answers: [String]
    
    //Quiz data have another parameter of correct ans
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
    
}
