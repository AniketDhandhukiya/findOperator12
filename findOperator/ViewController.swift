//
//  ViewController.swift
//  findOperator
//
//  Created by R83 on 16/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressField: UIProgressView!
    @IBOutlet weak var loadingLabel: UILabel!
    var time = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        progressField.progress = 0.0
        progressField.isHidden = true
        loadingLabel.isHidden = true
        
       
        
    }
    
    func progressView(){
        var a = 0.0
        
        time = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: { i in
            a += 0.02
            self.progressField.progress = Float(a)
            if self.progressField.progress == 1.0{
                self.progressField.progress = 0.0
                self.navigation()
                self.time.invalidate()
            }
        })
    }
    
    func navigation(){
        let navigateToModePage = storyboard?.instantiateViewController(withIdentifier: "Modepage") as! Modepage
        navigationController?.pushViewController(navigateToModePage, animated: true)
    }
    
    @IBAction func playButton(_ sender: UIButton){
        progressField.isHidden = false
        loadingLabel.isHidden = false
        progressView()
    }


}

