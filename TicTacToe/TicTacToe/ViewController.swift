//
//  ViewController.swift
//  TicTacToe
//
//  Created by 丁偉倫 on 04/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let circle = UIImage(named: "nought.png")
    let cross = UIImage(named: "cross.png")
    var moves = 0
    var status = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameOver = false
    
    @IBOutlet weak var gameoverLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restartButtonClicked(_ sender: Any) {
        resetTheGame()
    }
    @IBAction func buttonPressed(_ sender: AnyObject) {
        drawAndRecord(button: sender as! UIButton, position: sender.tag)
    }
    
    
    func drawAndRecord(button :UIButton, position :Int) {
        moves += 1
        if status[position - 1] == 0 {
            if moves % 2 == 1 {
                button.setBackgroundImage(circle, for: .normal)
                status[position - 1] = 1
            } else {
                button.setBackgroundImage(cross, for: .normal)
                status[position - 1] = 2
            }
        }
        checkResult()
        print("status: \(status)")
    }
    
    func checkResult() {
        for combination in winningCombinations {
            if status[combination[0]] != 0 && status[combination[0]] == status[combination[1]] && status[combination[0]] == status[combination[2]] {
                gameOver = true
                let winner = status[combination[0]] == 1 ? "Noughts" : "Crosses"
                gameoverLabel.text = "\(winner) has won!"
                showGameOverScreen()
            }
        }
        if moves >= 9 && !gameOver {
            gameoverLabel.text = "We've got a tie!"
            showGameOverScreen()
        }
    }
    
    func showGameOverScreen() {
        gameoverLabel.isHidden = false
        restartButton.isHidden = false
        UIView.animate(withDuration: 1, animations: {
            self.gameoverLabel.center = CGPoint(x: self.gameoverLabel.center.x + 500, y: self.gameoverLabel.center.y)
            self.restartButton.center = CGPoint(x: self.restartButton.center.x + 500, y: self.restartButton.center.y)
        })
    }
    
    func resetTheGame() {
        for i in 1 ... 9 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setBackgroundImage(nil, for: [])
            }
        }
        gameoverLabel.isHidden = true
        restartButton.isHidden = true
        gameoverLabel.center = CGPoint(x: gameoverLabel.center.x - 500, y: gameoverLabel.center.y)
        restartButton.center = CGPoint(x: restartButton.center.x - 500, y: restartButton.center.y)
        moves = 0
        status = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameOver = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetTheGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

