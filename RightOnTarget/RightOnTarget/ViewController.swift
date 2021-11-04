//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Vitalii Kryvoshapka on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Game
    var game: Game!
    
    //Elements on Scene
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    //MARK: - Life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create Exemplair object Game
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        //Refresh data about current secret value
        updateLableWithSecretnumber(newText: String(game.currentSecretValue))
    }
    
    //MARK: - View <-> Model -
    //Check gamer value
    @IBAction func checkNumberButton() {
        //Coins of round
        game.calculateScore(with: Int(slider.value))
        //Check game is done?
        if game.isGameEnded{
            showAlertWith(score: game.score)
            //new Game
            game.restartGame()
        } else {
            game.startNewRound()
        }
        //Refresh data about current secret value
        updateLableWithSecretnumber(newText: String(game.currentSecretValue))
    }
    
    //MARK: - Update View -
    //Refresh text secret value
    private func updateLableWithSecretnumber(newText: String){
        label.text = newText
    }
    
    //Show Alert with score
    private func showAlertWith(score: Int){
        let alert = UIAlertController(title: "Game Done", message: "You have \(score) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


