//
//  Game.swift
//  RightOnTarget
//
//  Created by Vitalii Kryvoshapka on 04.11.2021.
//

import Foundation

protocol GameProtocol{
    //Q-ty earned coins
    var score: Int {get}
    //Random secret number
    var currentSecretValue: Int {get}
    //Check Game is ended
    var isGameEnded: Bool {get}
    
    //Methods
    
    //New game and first round start
    func restartGame()
    //Start new round (refresh secret number)
    func startNewRound()
    //Comparing gamer number with secret number and add coins
    func calculateScore(with value:Int)
}


class Game: GameProtocol{
    var score: Int = 0
    //Min secret value
    private var minSecretValue: Int
    //Max secret value
    private var maxSecretValue: Int
    
    var currentSecretValue: Int = 0
    //Rounds Q-ty
    private var lasrRound: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool{
        if currentRound >= lasrRound{
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int){
        //StartV !>= endV
        guard startValue <= endValue else{
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lasrRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    //Generate & back new random value
    private func getNewSecretValue() -> Int{
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue{
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue{
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
