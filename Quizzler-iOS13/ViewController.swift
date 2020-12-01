//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBActions
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //Constants
    let quiz = [
        Question(text: "Four + Two is equal to Six.", answer: "True"),
        Question(text: "Five - Three is greater than One", answer: "True"),
        Question(text: "Three + Eight is less than Ten", answer: "False")
    ]
    
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    //MARK:- IBActions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //To check user answer
        let userAnswer = sender.currentTitle //True, False
        let actualAnswer = quiz[questionNumber].answer //all ans is on 1 of every array obj
        
        if userAnswer == actualAnswer {
            print("Right")
        } else {
            print("Wrong!")
        }
        
        //To move to new ques after the current ques assessment
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            //To restart question if detect last quest
            questionNumber = 0
        }
        
        updateUI()
    }
    
    //MARK:- Helper Methods
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text
    }
    
    
}

