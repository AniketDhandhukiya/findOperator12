//
//  Modepage.swift
//  findOperator
//
//  Created by R83 on 17/02/23.
//

import UIKit

class Modepage: UIViewController {

    
    @IBOutlet weak var labelOfCoin: UILabel!
    @IBOutlet weak var labelOfEasy: UIButton!
    @IBOutlet weak var labelOfMedium: UIButton!
    @IBOutlet weak var labelOfHard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOfCoin.text = "0"
        
        
    }
    
    @IBAction func easyButton(_ sender: UIButton){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "easyGamePage") as! easyGamePage
        navigate.freq = 0.06
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    @IBAction func mediumButton(_ sender: UIButton){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "easyGamePage") as! easyGamePage
        navigate.freq = 0.03
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    @IBAction func hardButton(_ sender: UIButton){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "easyGamePage") as! easyGamePage
        navigate.freq = 0.02
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    

    
    
}
