//
//  ViewController.swift
//  HelpDeskHero
//
//  Created by Bailey Conradt on 6/3/19.
//  Copyright © 2019 Bailey Conradt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var callPointsLabel: UILabel!
    
    @IBOutlet weak var pick1AgentsLabel: UILabel!
    @IBOutlet weak var pick3AgentsLabel: UILabel!
    @IBOutlet weak var chatEmailAgentsLabel: UILabel!
    @IBOutlet weak var HDQAAgentsLabel: UILabel!
    
    
    var callPoints: Int = 0
    var pick1Agents = 0
    var pick3Agents = 0
    var chatEmailAgents = 0
    var HDQAAgents = 0
    
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func startTimer() {
     
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addCalls), userInfo: nil, repeats: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameTimer?.invalidate()
    }
    
    @objc func addCalls() {
        callPoints += pick1Agents
        callPoints += pick3Agents * 5
        callPoints += chatEmailAgents * 25
        callPoints += HDQAAgents * 125
        updateLabels()
    }
    
    
    func updateLabels() {
        callPointsLabel.text = String(callPoints)
        pick1AgentsLabel.text = String(pick1Agents)
        pick3AgentsLabel.text = String(pick3Agents)
        chatEmailAgentsLabel.text = String(chatEmailAgents)
        HDQAAgentsLabel.text = String(HDQAAgents)
    }

    @IBAction func takeACall(_ sender: Any) {
        callPoints += 1
        updateLabels()
    }
    
    @IBAction func BuyPick1(_ sender: Any) {
        if callPoints >= 20 {
            pick1Agents += 1
            callPoints -= 20
            updateLabels()
        }
    }
    @IBAction func BuyPick3(_ sender: Any) {
        if callPoints >= 200 {
            pick3Agents += 1
            callPoints -= 200
            updateLabels()
        }
    }
    @IBAction func BuyChatEmail(_ sender: Any) {
        if callPoints >= 2000 {
            chatEmailAgents += 1
            callPoints -= 2000
            updateLabels()
        }
    }
    @IBAction func BuyHDQA(_ sender: Any) {
        if callPoints >= 20000 {
            HDQAAgents += 1
            callPoints -= 20000
            updateLabels()
        }
    }
    
    
    @IBAction func unwindToMain(sender: UIStoryboardSegue){
        startTimer()
    }
   
}

