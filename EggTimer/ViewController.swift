//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLable: UILabel!
    
    var timer = Timer()
    let eggSoftness = ["softTime":300, "mediumTime":420, "hardTime":720]
    // 분은, 초로 무조건 바꿔준다. 초가 기본단위임.
    var secondsRemaining = 60
    
    @IBAction func selectHardness(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaining = eggSoftness[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
       }
    
    @objc func updateCounter(){
        if secondsRemaining > 0 {
            print("\(secondsRemaining)seconds")
            secondsRemaining-=1
        }
        else if secondsRemaining == 0 {
            timer.invalidate()
            textLable.text = "Done!"
        }
    }
    

}
