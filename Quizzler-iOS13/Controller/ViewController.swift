//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //создаем экземпляр или новую копию нашего quizBrain в верхней части контроллера представления, тперь можем использовать QuizBrain внутри нашего контроллера
   var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

    //function for press button
    @IBAction func answerButtonPressed(_ sender: UIButton) {
       
        
        let userAnswer = sender.currentTitle! //True, False
        
        /*let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        */
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        updateUI()
    }
    
    @objc func updateUI() {
        //questionLabel.text = quiz[questionNumber].text
        questionLabel.text = quizBrain.getQuestionText()
        choice1Button.setTitle("Button-1", for: .normal)
        choice1Button.setTitle("Button-1", for: .normal)
        choice1Button.setTitle("Button-1", for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
        //progressBar.progress = Float(questionNumber+1)/Float(quiz.count)
    }
    
  
    
    
}


