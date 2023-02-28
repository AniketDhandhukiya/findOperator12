//
//  scorePopup.swift
//  findOperator
//
//  Created by R83 on 22/02/23.
//

import UIKit

class scorePopup: UIViewController {
    
    var score = 0
    var highScore = 0
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var highScoreLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        score+=1
        scoreLable.text = "\()"
        if (score> highScore){
            highScore = score
            highScoreLable.text =
            
            var highscoreDefault =
            
        }
    }
    
}
