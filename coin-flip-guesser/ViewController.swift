//
//  ViewController.swift
//  coin-flip-guesser
//
//  Created by Adam Goth on 7/8/16.
//  Copyright © 2016 Adam Goth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var headsOrTails: UILabel!
    
    @IBOutlet weak var winOrLose: UILabel!
    
    @IBOutlet weak var currentStreakLbl: UILabel!
    
    @IBOutlet weak var bestStreakLbl: UILabel!
    
    var coin: [String] = ["Heads", "Tails"]
    var userSelection: String = "Heads"
    var flipResult: String!
    var rand: Int = 1
    var streak: Int = 0
    var bestStreak: Int = 0
    var wins: Int = 0
    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func flipPressed(sender: AnyObject) {
        rand = Int(arc4random_uniform(2))
        flipResult = coin[rand]
        headsOrTails.text = flipResult
        if flipResult == userSelection {
            winOrLose.text = "You win!"
            streak += 1
            currentStreakLbl.text = "\(streak)"
            if streak >= bestStreak {
                bestStreak = streak
                bestStreakLbl.text = "\(bestStreak)"
            }
            wins += 1
            total += 1
        } else {
            winOrLose.text = "You lose!"
            streak = 0
            currentStreakLbl.text = "\(streak)"
            total += 1
        }
    }
    
    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex
        {
            case 0:
                userSelection = "Heads"
            case 1:
                userSelection = "Tails"
            default:
                break
        }
    }
}

