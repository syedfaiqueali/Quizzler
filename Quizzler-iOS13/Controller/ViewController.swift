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
    
    //object
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    //MARK:- IBActions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //To check user answer
        guard let userAnswer = sender.currentTitle else {return}//True, False
        let userGotItRight = quizBrain.checkAnswer(answer: userAnswer) //Actual ans {return: true/false}
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //to move to next question
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //MARK:- Helper Methods
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    
}

