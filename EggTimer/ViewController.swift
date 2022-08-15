//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet weak var textLable: UILabel!
    
    var timer = Timer()
    let eggSoftness: [String: Int] = ["Soft":300, "Medium":420, "Hard":720]
    // 분은, 초로 무조건 바꿔준다. 초가 기본단위임.
    var totalTime = 0
    var progressedTime = 0
    
    @IBAction func selectHardness(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggSoftness[hardness]!
        progressBar.progress = 0.0
        progressedTime = 0
        textLable.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
       }
    
    @objc func updateCounter(){
        if progressedTime < totalTime {
            let percentage = Float(progressedTime)/Float(totalTime)
            print(percentage)
            progressBar.progress = percentage
            progressedTime += 1
        }
        else {
            timer.invalidate()
            textLable.text = "Done!"
        }
    }
    

}
