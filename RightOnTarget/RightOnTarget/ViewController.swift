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
    
    
      // MARK: - Жизненный цикл
      override func viewDidLoad() {
          super.viewDidLoad()
          // Создаем генератор случайных чисел
          let generator = NumberGenerator(startValue: 1, endValue: 50)!
          // Создаем сущность игра
          game = Game(valueGenerator: generator, rounds: 5)
          // Обновляем данные о текущем значении загаданного числа
          updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
      }
      // MARK: - Взаимодействие View - Model
      
      // Проверка выбранного пользователем числа
      @IBAction func checkNumber() {
          // Высчитываем очки за раунд
          game.currentRound.calculateScore(with: Int(slider.value))
          // Проверяем, окончена ли игра
          if game.isGameEnded {
              // Показываем окно с итогами
              showAlertWith(score: game.score)
              // Рестартуем игру
              game.restartGame()
          } else {
              // Начинаем новый раунд игры
              game.startNewRound()
          }
          // Обновляем данные о текущем значении загаданного числа
          updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
      }
      
      // MARK: - Обновление View
      
      // Обновление текста загаданного числа
      func updateLabelWithSecretNumber(newText: String ) {
          label.text = newText
      }
      
      // Отображение всплывающего окна со счетом
      private func showAlertWith( score: Int ) {
          let alert = UIAlertController(
                          title: "Игра окончена",
                          message: "Вы заработали \(score) очков",
                          preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }



  }
