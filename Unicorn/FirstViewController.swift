//
//  FirstViewController.swift
//  Unicorn
//
//  Created by Mir Ali on 3/24/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

var knowledge:Int = 100
var totalKnowledgeIncrease:Int = 0
var money:Int = 100
var totalMoneyIncrease:Int = 0

class FirstViewController: UIViewController {

    var totalMoney:Int = 0
    var timer = Timer()
    @IBOutlet var moneyLabel: UILabel!
    @IBOutlet var totalMoneyLabel: UILabel!
    @IBOutlet var knowledgeLabel: UILabel!
    
    @IBOutlet var learnButton: UIButton!
    @IBOutlet var recruitButton: UIButton!
    @IBOutlet var hackButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMoneyLabel()
        updateKnowledgeLabel()
        
        self.navigationController?.isNavigationBarHidden = true
        learnButton.layer.cornerRadius = 5.0
        recruitButton.layer.cornerRadius = 5.0
        hackButton.layer.cornerRadius = 5.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(FirstViewController.countUp), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func countUp() {
        knowledge += totalKnowledgeIncrease
        money += totalMoneyIncrease
        updateKnowledgeLabel()
        updateMoneyLabel()
    }
    
    
    func updateKnowledgeLabel() {
        if knowledge <= 1000 {
            knowledgeLabel.text = "\(knowledge)"
        }
        else if knowledge > 1000 {
            let total:Double = Double(knowledge)
            knowledgeLabel.text = "\(total/1000)k"
        } else if knowledge >= 1000000 {
            //get round to 3 then turn into double
            knowledgeLabel.text = "\(knowledge/1000000)m"
        }
        
    }
    
    func updateMoneyLabel() {
        if money <= 1000 {
            moneyLabel.text = "\(money)"
        } else if money > 1000 {
            let total:Double = Double(money)
            moneyLabel.text = "\(total/1000)k"
        }
        
        if totalMoney < 1000 {
            totalMoneyLabel.text = "Total : \(totalMoney)"
        } else if totalMoney > 1000 {
            let total:Double = Double(money)
            totalMoneyLabel.text = "Total : \(total/1000))k"
        } else if totalMoney >= 1000000 {
            //get round to 3 then turn into double
            totalMoneyLabel.text = "Total : \(totalMoney/1000000)m"
        }
        
    }
}

