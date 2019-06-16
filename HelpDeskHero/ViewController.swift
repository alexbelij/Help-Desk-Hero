//
//  ViewController.swift
//  HelpDeskHero
//
//  Created by Bailey Conradt on 6/3/19.
//  Copyright © 2019 Bailey Conradt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameSeconds = 0
    
    //main points label
    @IBOutlet weak var callPointsLabel: UILabel!
    
    //top labels
    @IBOutlet weak var pick1AgentsLabel: UILabel!
    @IBOutlet weak var pick3AgentsLabel: UILabel!
    @IBOutlet weak var chatEmailAgentsLabel: UILabel!
    @IBOutlet weak var HDQAAgentsLabel: UILabel!
    
    @IBOutlet weak var pick1CostLabel: UILabel!
    @IBOutlet weak var pick3CostLabel: UILabel!
    @IBOutlet weak var chatEmailCostLabel: UILabel!
    @IBOutlet weak var HDQACostLabel: UILabel!
    
    //points initialization
    var callPoints = 0
    var pick1Agents = 0
    var pick3Agents = 0
    var chatEmailAgents = 0
    var HDQAAgents = 0
    
    var pick1Cost = 20
    var pick3Cost = 200
    var chatEmailCost = 2000
    var HDQACost = 20000
    
    //these can all be upgraded
    var pick1Multiplier = 1
    var pick3Multiplier = 5
    var chatEmailMultiplier = 25
    var HDQAMultiplier = 125
    var takeACallMultiplier = 1
    
    //upgrade options
    var numPetu = 0
    var petuCost = 20000
    @IBOutlet weak var numPetuLabel: UILabel!
    @IBAction func Petu(_ sender: Any) {
        if callPoints >= petuCost {
            HDQAMultiplier *= 2
            callPoints -= petuCost
            petuCost *= 5
            numPetu += 1
            numPetuLabel.text = String(numPetu)
            
        //    print("HDQA mult \(HDQAMultiplier)")
        }
    }
    var numNaha = 0
    var nahaCost = 1000000
    @IBOutlet weak var numNahaLabel: UILabel!
    @IBAction func Naha(_ sender: Any) {
        if callPoints >= nahaCost {
            pick1Multiplier *= 2
            pick3Multiplier *= 2
            chatEmailMultiplier *= 2
            HDQAMultiplier *= 2
            callPoints -= nahaCost
            nahaCost *= 5
            numNaha += 1
            numNahaLabel.text = String(numNaha)
            
        //    print("CoffeeMult \(pick1Multiplier)")
        }
        
    }
    
    var numDiba = 0
    var dibaCost = 100000
    @IBOutlet weak var numDibaLabel: UILabel!
    @IBAction func Diba(_ sender: Any) {
        if callPoints >= dibaCost {
            chatEmailMultiplier *= 2
            callPoints -= dibaCost
            dibaCost *= 5
            numDiba += 1
            numDibaLabel.text = String(numDiba)
            
       //     print("Email Mult \(chatEmailMultiplier)")
        }
    }
    
    var numVmar = 0
    var vmarCost = 200
    @IBOutlet weak var numVmarLabel: UILabel!
    @IBAction func Vmar(_ sender: Any) {
        if callPoints >= vmarCost {
            takeACallMultiplier *= 2
            callPoints -= vmarCost
            vmarCost *= 2
            numVmar += 1
            numVmarLabel.text = String(numVmar)
            
        //    print("call mult \(takeACallMultiplier)")
        }
    }
    
    var numJbol = 0
    var jbolCost = 20000
    @IBOutlet weak var numJbolLabel: UILabel!
    @IBAction func Jbol(_ sender: Any) {
        if callPoints >= jbolCost {
            pick1Multiplier *= 2
            callPoints -= jbolCost
            jbolCost *= 5
            numJbol += 1
            numJbolLabel.text = String(numJbol)
            
         //   print("Pick1 mult \(pick1Multiplier)")
        }
    }
    
    var numHunt = 0
    var huntCost = 20000
    @IBOutlet weak var numHuntLabel: UILabel!
    @IBAction func Hunt(_ sender: Any) {
        if callPoints >= huntCost {
            pick3Multiplier *= 2
            callPoints -= huntCost
            huntCost *= 5
            numHunt += 1
            numHuntLabel.text = String(numHunt)
            
       //     print("Pick3 mult \(pick3Multiplier)")
        }
    }
    
    var numRwer = 0
    var rwerCost = 100000
    @IBOutlet weak var numRwerLabel: UILabel!
    @IBAction func Rwer(_ sender: Any) {
        if callPoints >= rwerCost {
            HDQAMultiplier *= 2
            chatEmailMultiplier *= 2
            callPoints -= rwerCost
            rwerCost *= 5
            numRwer += 1
            numRwerLabel.text = String(numRwer)
        }
    }
    
    var numJaro = 0
    var jaroCost = 100000
    @IBOutlet weak var numJaroLabel: UILabel!
    @IBAction func Jaro(_ sender: Any) {
        if callPoints >= jaroCost {
            pick1Multiplier *= 2
            pick3Multiplier *= 2
            callPoints -= jaroCost
            jaroCost *= 5
            numJaro += 1
            numJaroLabel.text = String(numJaro)
        }
    }
    var numSsch = 0
    var sschCost = 1000000000
    @IBOutlet weak var numSschLabel: UILabel!
    @IBOutlet weak var sschButton: UIButton!
    @IBAction func Ssch(_ sender: Any) {
        if callPoints >= sschCost {
            pick1Multiplier *= 10
            pick3Multiplier *= 10
            HDQAMultiplier *= 10
            chatEmailMultiplier *= 10
            callPoints -= sschCost
            sschCost *= 5
            numSsch += 1
            numSschLabel.text = String(numSsch)
            
            sschButton.isEnabled = false
        }
    }
    //set up timer
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func startTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(addCalls), userInfo: nil, repeats: true)
    }

    //gets rid of timer once view disappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameTimer?.invalidate()
    }
    
    @objc func addCalls() {
        if callPoints >= 2000000000 {
            endGame()
        }
        callPoints += pick1Agents * pick1Multiplier
        callPoints += pick3Agents * pick3Multiplier
        callPoints += chatEmailAgents * chatEmailMultiplier
        callPoints += HDQAAgents * HDQAMultiplier
        updateLabels()
        gameSeconds += 1
    }
    
    func updateLabels() {
        callPointsLabel.text = String(callPoints)
        pick1AgentsLabel.text = String(pick1Agents)
        pick3AgentsLabel.text = String(pick3Agents)
        chatEmailAgentsLabel.text = String(chatEmailAgents)
        HDQAAgentsLabel.text = String(HDQAAgents)
        
        pick1CostLabel.text = String("Price:  \(pick1Cost)")
        pick3CostLabel.text = String("Price:  \(pick3Cost)")
        chatEmailCostLabel.text = String("Price:  \(chatEmailCost)")
        HDQACostLabel.text = String("Price:  \(HDQACost)")
    }
    @IBAction func takeACall(_ sender: Any) {
        callPoints += takeACallMultiplier
        updateLabels()
    }
    
    @IBAction func BuyPick1(_ sender: Any) {
        if callPoints >= pick1Cost {
            pick1Agents += 1
            callPoints -= pick1Cost
            pick1Cost = Int(Double(pick1Cost) * 1.2)
            updateLabels()
        }
    }
    @IBAction func BuyPick3(_ sender: Any) {
        if callPoints >= pick3Cost {
            pick3Agents += 1
            callPoints -= pick3Cost
            pick3Cost = Int(Double(pick3Cost) * 1.2)
            updateLabels()
        }
    }
    @IBAction func BuyChatEmail(_ sender: Any) {
        if callPoints >= chatEmailCost {
            chatEmailAgents += 1
            callPoints -= chatEmailCost
            chatEmailCost = Int(Double(chatEmailCost) * 1.2)
            updateLabels()
        }
    }
    @IBAction func BuyHDQA(_ sender: Any) {
        if callPoints >= HDQACost {
            HDQAAgents += 1
            callPoints -= HDQACost
            HDQACost = Int(Double(HDQACost) * 1.2)
            updateLabels()
        }
    }
    
    
    @IBAction func unwindToMain(sender: UIStoryboardSegue){
        startTimer()
    }
   
    func endGame(){
        gameTimer?.invalidate()
        
        let title = "Congratulations!"
        let message = "You beat the game in \(gameSeconds) seconds!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play Again", style: .default, handler: {
            action in
            self.startNewGame()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func startNewGame() {

        callPoints = 0
        pick1Agents = 0
        pick3Agents = 0
        chatEmailAgents = 0
        HDQAAgents = 0
        
        pick1Cost = 20
        pick3Cost = 200
        chatEmailCost = 2000
        HDQACost = 20000
        
        pick1Multiplier = 1
        pick3Multiplier = 5
        chatEmailMultiplier = 25
        HDQAMultiplier = 125
        takeACallMultiplier = 1
        
        numPetu = 0
        numPetuLabel.text = "0"
        numNaha = 0
        numNahaLabel.text = "0"
        numDiba = 0
        numDibaLabel.text = "0"
        numVmar = 0
        numVmarLabel.text = "0"
        numJbol = 0
        numJbolLabel.text = "0"
        numHunt = 0
        numHuntLabel.text = "0"
        numRwer = 0
        numRwerLabel.text = "0"
        numJaro = 0
        numJaroLabel.text = "0"
        numSsch = 0
        numSschLabel.text = "0"
        
        petuCost = 20000
        nahaCost = 1000000
        dibaCost = 100000
        vmarCost = 20000
        jbolCost = 20000
        huntCost = 20000
        rwerCost = 100000
        jaroCost = 100000
        sschCost = 1000000000
        
        sschButton.isEnabled = true
        
        startTimer()
        
    }
    
}

