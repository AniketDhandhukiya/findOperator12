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
    var highScore = UserDefaults.standard.integer(forKey: "highScore")
    var life = 1
    
    @IBOutlet weak var life1: UIImageView!
    @IBOutlet weak var life2: UIImageView!
    @IBOutlet weak var life3: UIImageView!
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
        gameOver()
        life1.tintColor = .systemRed
        life2.tintColor = .systemRed
        life3.tintColor = .systemRed
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
    }
    
    func timeOfProgress(){
        var a = 1.0
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { i in
            a -= 0.01
            self.progressField.progress = Float(a)
            if self.progressField.progress == 0.0{
                self.time.invalidate()
                self.alert(score: self.score, highscore: self.highScore)
                self.score = 0
            }})
    }
    
    func generated(){
        firstNumber = Int.random(in: 114...854)
        secondNumber = Int.random(in: 15...99)
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
        else if life == 1{
            life1.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
        else if life == 2{
            life2.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
//        else if life == 3{
//            life3.image = UIImage(systemName: "heart")
//            life+=3
//            time.invalidate()
//            setup()
//        }
        else {
            time.invalidate()
            life3.image = UIImage(systemName: "")
            gameOver()
            alert(score: score, highscore: highScore)
            score = 0
        }
    }
    
    @IBAction func multiButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber * secondNumber)"{
            time.invalidate()
            score+=1
            setup()
            
        }else if life == 1{
            life1.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
        else if life == 2{
            life2.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
//        else if life == 3{
//            life3.image = UIImage(systemName: "heart")
//            life+=3
//            time.invalidate()
//            setup()
//        }
        else {
            time.invalidate()
            life3.image = UIImage(systemName: "")
            gameOver()
            alert(score: score, highscore: highScore)
            score = 0
        }
    }
    
    @IBAction func divideButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber / secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
        }else if life == 1{
            life1.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
        else if life == 2{
            life2.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
//        else if life == 3{
//            life3.image = UIImage(systemName: "heart")
//            life+=3
//            time.invalidate()
//            setup()
//        }
        else {
            time.invalidate()
            life3.image = UIImage(systemName: "")
            gameOver()
            alert(score: score, highscore: highScore)
            score = 0
        }
    }
    @IBAction func minusButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber - secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
            
        }else if life == 1{
            life1.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
        else if life == 2{
            life2.image = UIImage(systemName: "")
            life+=1
            time.invalidate()
            setup()
        }
//        else if life == 3{
//            life3.image = UIImage(systemName: "heart")
//            life+=3
//            time.invalidate()
//            setup()
//        }
        else {
            time.invalidate()
            life3.image = UIImage(systemName: "")
            gameOver()
            alert(score: score, highscore: highScore)
            score = 0
        }
    }
    
    func gameOver() {
        if score > highScore{
            highScore = score
            UserDefaults.standard.set(score, forKey: "highScore")
        }
    }
    
    func alert(score: Int, highscore: Int){
        let alert = UIAlertController.init(title: "GAME OVER", message: "score = \(score)\n highscore = \(highscore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "HOME", style: .default, handler: {i in self.navigateToHome()}))
        alert.addAction(UIAlertAction.init(title: "Retry", style: .default, handler: {i in self.navigateToRetry()
            self.life1.image = UIImage(systemName: "heart.fill")
            self.life2.image = UIImage(systemName: "heart.fill")
            self.life3.image = UIImage(systemName: "heart.fill")
            self.life = 1
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToHome() {
        let nv = storyboard?.instantiateViewController(withIdentifier: "Modepage") as! Modepage
        navigationController?.popViewController(animated: true)
    }
    func navigateToRetry() {
        setup()
        
    }
    
}
