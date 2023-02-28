//
//  scorePage.swift
//  findOperator
//
//  Created by R83 on 24/02/23.
//

import UIKit

class scorePage: UIViewController {

    
    var score = 0

    @IBOutlet weak var reset: UIButton!
    var highScore = UserDefaults.standard.integer(forKey: "highScore")
    @IBOutlet weak var labelOfHighScore: UILabel!
    @IBOutlet weak var labelOfScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOver()
        labelOfScore.text = "your score :   \(score)"
    }
    
    func gameOver(){

        if score > highScore{
            highScore = score
            labelOfHighScore.text = "\(highScore)"
            UserDefaults.standard.set(score, forKey: "highScore")
        }
        labelOfHighScore.text = "\(highScore)"
    }
    
    @IBAction func actionHomeButton(_ sender: Any) {
        navigateToHome()
    }
    
    @IBAction func actionRetry(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        navigateToTryAgain()
    }
    
    func navigateToTryAgain(){
        let alert = storyboard?.instantiateViewController(withIdentifier: "easyGamePage") as! easyGamePage
        navigationController?.pushViewController(alert, animated: true)
        //self.navigationController?.popToViewController((self.navigationController?.viewControllers[2])!,animated: true)
        //self.navigationController?.popViewController(animated: true)
    }
    
    func navigateToHome(){
        let alert = storyboard?.instantiateViewController(withIdentifier: "Modepage") as! Modepage
        navigationController?.pushViewController(alert, animated: true)
        
    }
    
    
}
