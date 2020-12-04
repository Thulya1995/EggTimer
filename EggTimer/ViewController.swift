//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mydic = ["Soft": 3, "Medium": 4, "Hard": 7]
    var counter = 60
    var timer = Timer()
    
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func eggButtons(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        counter = mydic[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the boil the egg")
            counter -= 1
        }else {
            timer.invalidate()
            textLabel.text = "It's time to eat"
        }

    }

}
