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
    var randomNumber: Int = 0
    //Round
    var round: Int = 1
    //Points sum in round
    var points: Int = 0
    
    override func loadView() {
        super.loadView()
        print("LoadView")
        
//        //Create version Lable
//        let versionLable = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//        //Change Lable text
//        versionLable.text = "Viersion 1.1"
//        versionLable.textColor = #colorLiteral(red: 0.118, green: 0.439, blue: 0.412, alpha: 1.000)
//        self.view.addSubview(versionLable)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        //Generate random number
        self.randomNumber = Int.random(in: 1...50)
        //Set random number in label
        self.label.text = String(self.randomNumber)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    //Game logic
    @IBAction func checkNumberButton() {
        
        //Get value on slider
        let numSlider = Int(self.slider.value)
        //Compare Gamer number on Slider with random number and count points
        if numSlider > self.randomNumber{
            self.points += 50 - numSlider + self.randomNumber
        } else if numSlider < self.randomNumber{
            self.points += 50 - self.randomNumber + numSlider
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
        self.randomNumber = Int.random(in: 1...50)
        //Hand over random number in lable
        self.label.text = String(self.randomNumber)
    }
    
    //Lazy property to secondVC (Should be viewWillAppear & viewDidAppear
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    //Private mathod, who load view
    private func getSecondViewController() -> SecondViewController{
        //Load storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //Load VC $ Scene from storyboard
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    
    
    //Present Method
    @IBAction func showNextScreen(){
       
        //Show scene on creen
        self.present(secondViewController, animated: true, completion: nil)
    }
}


