//
//  easyGamePage.swift
//  findOperator
//
//  Created by R83 on 18/02/23.
//

import UIKit

class easyGamePage: UIViewController {

   
 
    var firstNumber = 0
    var secondNumber = 0
    var difficulty = 100
    var score = 0
    var yourScore = "0"
    var highScore = "0"

    @IBOutlet weak var labelOfScore: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labelOfOperator: UILabel!
    @IBOutlet weak var labelOfAnswers: UILabel!
    @IBOutlet weak var progressField: UIProgressView!
    var time = Timer()
    var freq = 0.10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        labelOfScore.text = "\(score)"
        labelOfScore.layer.cornerRadius = 49
        labelOfScore.layer.masksToBounds = true
        labelOfScore.textColor = .yellow
        progressField.progress = 1.0
        timeOfProgress()
        generated()
        labelOfOperator.text = "?"
        labelOfOperator.textColor = .red
        labelOfAnswers.textColor = .blue
        UserDefaults.standard.set(score, forKey: "score")
    }
    
    func timeOfProgress(){
        var a = 1.0
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { i in
            a -= 0.01
            self.progressField.progress = Float(a)
            if self.progressField.progress == 0.0{
                self.time.invalidate()
                self.navigateToScorePage()

            }
        })
    }
    
    func generated(){
        firstNumber = Int.random(in: 30...599)
        secondNumber = Int.random(in: 75...250)
        label1.text = "\(firstNumber)"
        label2.text = "\(secondNumber)"
             let plus = firstNumber + secondNumber
             let minus = firstNumber - secondNumber
             let multi = firstNumber * secondNumber
             let divide = firstNumber / secondNumber
             var array = [plus,multi,minus,divide]
             var question = array.randomElement()
             var answer = question
             labelOfAnswers.text = "\(answer!)"
    }

    @IBAction func plusButton(_ sender: UIButton){
        
        if labelOfAnswers.text == "\(firstNumber + secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
            
        }
            else
                {
                    time.invalidate()
                    navigateToScorePage()
                }
        
        
    }
    @IBAction func multiButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber * secondNumber)"{
            time.invalidate()
            score+=1
            setup()
           
        }
        else{
            time.invalidate()
            navigateToScorePage()

        }
        
    }
    @IBAction func divideButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber / secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
        }
        else{
            time.invalidate()
            navigateToScorePage()

        }
        
    }
    @IBAction func minusButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber - secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
            
        }
        else{
            time.invalidate()
            navigateToScorePage()
        }
        
    }
    
   
    func navigateToScorePage(){
        let nev = storyboard?.instantiateViewController(withIdentifier: "scorePage") as! scorePage
        nev.score = score
        navigationController?.pushViewController(nev, animated: true)
    }
    
//    func showAlertScore(){
//        let alert = storyboard?.instantiateViewController(withIdentifier: "scorePage") as! scorePage
//        alert.modalPresentationStyle = .currentContext
//        alert.providesPresentationContextTransitionStyle = true
//        alert.definesPresentationContext = true
//        alert.modalTransitionStyle = .crossDissolve
//        present(alert, animated: true, completion: nil)
//    }
    
//    func dismissed(){
//        dismiss(animated: true, completion: nil)
//    }
    
    
    
    
    
}
