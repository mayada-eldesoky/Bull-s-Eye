//
//  ViewController.swift
//  pull'sEye
//
//  Created by mayada on 2/25/20.
//  Copyright © 2020 mayada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var slidVal:Int = 0
    var target:Int = 0
    var totalScore:Int = 0
    var round:Int = 0
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var tarlabel:UILabel!
    @IBOutlet weak var score:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        slidVal = lroundf(slider.value)
        target = 1 + Int(arc4random_uniform(100))
        startNewRound()
        //let thumbImageNormal = UIImage(named: "small")
        //slider.setThumbImage(thumbImageNormal, for: .normal)
        //slider.setThumbImage(thumbImageNormal, for: .highlighted)
       // let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        //let trackleftimage = thumbImageNormal?.resizableImage(withCapInsets: insets)
        //let trackright = thumbImageNormal?.resizableImage(withCapInsets: insets)
        
        
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateLabels() {
        tarlabel.text = String(target)
        score.text = String(totalScore)
        roundLabel.text = String(round)
    }
    @IBAction func startOver(){
        round = 1
        slidVal = 50
        target = 1 + Int(arc4random_uniform(100))
        totalScore = 0
        updateLabels()
    }
    func startNewRound(){
        round += 1
       target = 1 + Int(arc4random_uniform(100))
        slidVal = 50
        slider.value = Float(slidVal)
        //updateLabels()
        
    }
    @IBAction func hitMe(){
        var difference = abs(slidVal-target)
        var points = 100 - difference
        var title:String
        if difference == 0{
            title = "perfect"
            points += 100
        }else if difference < 5{
            title = "you almost get it"
            points += 50
        }else if difference < 10{
            title = "pretty good"
        }else{
            title = "dont even close"
        }
        totalScore = totalScore + points
        let message = "the value is \(slidVal) " +
        "\n the score points is : \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert,animated: true,completion: nil)
       alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.startNewRound()
            self.updateLabels()
            
        //}))
        
    }
    @IBAction func sliderValue(_ slider : UISlider){
        slidVal = lroundf(slider.value)
        
    }

}

