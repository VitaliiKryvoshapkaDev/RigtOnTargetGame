//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Vitalii Kryvoshapka on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    //Random Number
    var number: Int = 0
    //Round
    var round: Int = 0
    //Points sum in round
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Game logic
    @IBAction func checkNumberButton() {
        //If game just start
        if self.round == 0{
            //Random number generate
            self.number = Int.random(in: 1...50)
            //Hand over random lable
            self.label.text = String(self.number)
            //Instal round counter in 1
            self.round = 1
        } else {
            //Get value on slider
            let numSlider = Int(self.slider.value.rounded())
            //Compare Gamer number on Slider with random number and count points
            if numSlider > self.number{
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number{
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5{
                //Present information window with Game result
                let alert = UIAlertController(title: "Game Over", message: "You get \(self.points) points!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            //Generate random number
            self.number = Int.random(in: 1...50)
            //Hand over random number in lable
            self.label.text = String(self.number)
        }
    }
}

