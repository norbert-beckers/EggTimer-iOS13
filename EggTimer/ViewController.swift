//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft" : 3.0,
        "Medium" : 4.0,
        "Hard" : 7.0
    ]
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    
    var secondsRemaining = 0.0
    var totalSeconds = 0.0
    var timer = Timer()
    
    @IBAction func hardnessdSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        totalSeconds = secondsRemaining
        progresBar.progress = 1.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if  secondsRemaining > 0 {
            progresBar.progress = Float(secondsRemaining / totalSeconds)
            print("\(secondsRemaining) seconds remaining.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            progresBar.progress = 0.0
            display.text = "Done"
        }
    }
}
