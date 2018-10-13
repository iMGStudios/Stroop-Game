//
//  ViewController.swift
//  simpleStroopGame
//
//  Created by Matthew Valentinetti on 10/12/18.
//  Copyright © 2018 Matthew Valentinetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var colors = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) , #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1) , #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1) , #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)]
    
   var words = ["RED" , "GREEN" , "BLUE" , "YELLOW"]
    
    var matchedCount = 0
    var mismatchedCount = 0
    
    var timeCountDown = 10
    
    var clickToStartButtonIsHidden = false
    
    func updateColorButton() {
        self.colors.shuffle()
        redButtonLabel.backgroundColor = colors[0]
        greenButtonLabel.backgroundColor = colors[1]
        blueButtonLabel.backgroundColor = colors[2]
        yellowButtonLabel.backgroundColor = colors[3]
    }
    
    func shuffleWordColor() {
        self.colors.shuffle()
        self.words.shuffle()
    }
    
    func restGame() {
        shuffleWordColor()
        updateColorButton()
        wordColorLabel.text = words[0]
        wordColorLabel.textColor = colors[0]
        matchedCount = 0
        matchedLabel.text = "Matched: \(matchedCount)"
        mismatchedCount = 0
        mismatchedLabel.text = "Mismatched: \(mismatchedCount)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clickToStartButtonLabel.isHidden = false
    }
    
    func startTimeCountDown() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.timeCountDown -= 1
            self.countDownLabel.text = String(self.timeCountDown)
            if self.timeCountDown <= 0 {
                self.mismatchedCount += 1
                self.mismatchedLabel.text = "Mismatched: \(self.mismatchedCount)"
                self.timeCountDown += 10
                self.countDownLabel.text = String(self.timeCountDown)
            }
        }
    }
    
    @IBOutlet weak var wordColorLabel: UILabel!
    
    @IBAction func redButton(_ sender: Any) {
        
        if wordColorLabel.textColor == redButtonLabel.backgroundColor{
            matchedCount += 1
            matchedLabel.text = "Matched: \(matchedCount)"
        } else {
            mismatchedCount += 1
            mismatchedLabel.text = "Mismatched: \(mismatchedCount)"
            
        }
        updateColorButton()
        shuffleWordColor()
        wordColorLabel.text = words[0]
        wordColorLabel.textColor = colors[0]

    }
    
    @IBAction func greenButton(_ sender: Any) {
        
        if wordColorLabel.textColor == greenButtonLabel.backgroundColor{
            matchedCount += 1
            matchedLabel.text = "Matched: \(matchedCount)"
        } else {
            mismatchedCount += 1
            mismatchedLabel.text = "Mismatched: \(mismatchedCount)"
        }
        updateColorButton()
        shuffleWordColor()
        wordColorLabel.text = words[0]
        wordColorLabel.textColor = colors[0]
    }
    
    @IBAction func blueButton(_ sender: Any) {
        if wordColorLabel.textColor == blueButtonLabel.backgroundColor{
            matchedCount += 1
            matchedLabel.text = "Matched: \(matchedCount)"
        } else {
            mismatchedCount += 1
            mismatchedLabel.text = "Mismatched: \(mismatchedCount)"
        }
        updateColorButton()
        shuffleWordColor()
        wordColorLabel.text = words[0]
        wordColorLabel.textColor = colors[0]
    }
    
    @IBAction func yellowButton(_ sender: Any) {
        if wordColorLabel.textColor == yellowButtonLabel.backgroundColor{
            matchedCount += 1
            matchedLabel.text = "Matched: \(matchedCount)"
        } else {
            mismatchedCount += 1
            mismatchedLabel.text = "Mismatched: \(mismatchedCount)"
        }
        updateColorButton()
        shuffleWordColor()
        wordColorLabel.text = words[0]
        wordColorLabel.textColor = colors[0]
    }
    
    @IBAction func clickToStartButton(_ sender: Any) {
        clickToStartButtonLabel.isHidden = true
        startTimeCountDown()
        updateColorButton()
        shuffleWordColor()
        wordColorLabel.text = words[0]
        wordColorLabel.textColor = colors[0]
    }
    @IBAction func resetButton(_ sender: UIButton) {
        startTimeCountDown()
        restGame()
        updateColorButton()
        
    }
    
    
    @IBOutlet weak var redButtonLabel: UIButton!
    
    @IBOutlet weak var greenButtonLabel: UIButton!
    
    @IBOutlet weak var blueButtonLabel: UIButton!
    
    @IBOutlet weak var yellowButtonLabel: UIButton!
    
    @IBOutlet weak var matchedLabel: UILabel!
    
    @IBOutlet weak var mismatchedLabel: UILabel!
    
    @IBOutlet weak var clickToStartButtonLabel: UIButton!
    
    @IBOutlet weak var countDownLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColorButton()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

