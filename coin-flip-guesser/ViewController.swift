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
    
    var coin: [String] = ["Heads", "Tails"]
    var userSelection: String = "Heads"
    var flipResult: String!
    var rand: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func flipPressed(sender: AnyObject) {
        rand = Int(arc4random_uniform(2))
        flipResult = coin[rand]
        headsOrTails.text = flipResult
        if flipResult == userSelection {
            winOrLose.text = "You win!"
        } else {
            winOrLose.text = "You lose!"
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

