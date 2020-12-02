//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
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
            //sender.titleLabel?.tintColor = UIColor.black
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //to move to next question
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //MARK:- Helper Methods
    @objc func updateUI(){
        //Fetch the question and update ques label
        questionLabel.text = quizBrain.getQuestionText()
        
        //Fetch the ans and update button titles
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        //Fetch progress & score and update progress & score
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //Reset button background color
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
    
}

