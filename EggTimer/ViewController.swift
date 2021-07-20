//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    let eggTime = ["Soft":3,"Medium":4,"Hard":7]
    var harderness = ""
    var timer = Timer()
    var secondsPasses = 0
    var totalTime = 0
    
    var player = AVAudioPlayer()

    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        secondsPasses = 0
        timer.invalidate()
        harderness = sender.currentTitle!
        totalTime =  eggTime[harderness]!
        
timer =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    @objc func updateTime(){
        if secondsPasses<totalTime {
            secondsPasses += 1
            progressBar.progress = Float(secondsPasses)/Float(totalTime)
            
            
        }else{
            timer.invalidate()
            timeLabel.text = "Done!"
            let path = Bundle.main.path(forResource: "alarm_sound", ofType : "mp3")!
            let url = URL(fileURLWithPath : path)
          do{
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
          }
          catch {
            print("Error")
          }
        }
    }
}
