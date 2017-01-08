//
//  RecruitTableViewCell.swift
//  Unicorn
//
//  Created by Mir Ali on 3/31/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

var possibleEmployees:[Employee] = []

class RecruitTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var efficiencyLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var button:UIButton!
    @IBOutlet var profitLabel:UILabel!
    
    var totalEmployees:Int = 5
    var currentEmployee:Employee!
    var profit:Int!
    
    var codingLanguages:[String] = ["HTML & CSS", "JScript", "MySQL", "Terminal", "PHP", "Ruby", "Python", "R", "Perl", "Java", "C#", "Pascal", "C", "Obj-C", "Fortran", "C++", "Haskell", "Assembly", "Prolog", "LISP", "Brainfuck"]
    var languageKnowledge = [String:Int]()

    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 5.0
        for _ in 1...totalEmployees {
            let employee = Employee()
            possibleEmployees.append(employee)
        }
        for index in 1...codingLanguages.count {
            languageKnowledge[codingLanguages[index-1]] = (10*index + index/2)
        }
    }


    func configureCell(_ indexPath:Int) {
        currentEmployee = possibleEmployees[indexPath]
        nameLabel.text = currentEmployee.name
        
        efficiencyColorChange(currentEmployee.efficiency)
        efficiencyLabel.text = "Efficiency: \(currentEmployee.efficiency*100)% "
        
        costLabel.textColor = UIColor.red
        costLabel.text = "Cost: $\(currentEmployee.salary)/sec"
        
        profitLabel.textColor = UIColor.green
        if currentCodingLanguage == "" {
            let currentIncome = 0.0
            profitLabel.textColor = UIColor.red
            profit = Int(currentEmployee.efficiency * currentIncome - currentEmployee.salary)
            if let profitText = profit {
                profitLabel.text = "Profit: $\(profitText)/sec Learn a Language!"
            }
            button.isHidden = true
        } else {
            let currentIncome = Double(languageKnowledge[currentCodingLanguage]!)
            profit = Int(currentEmployee.efficiency * currentIncome - currentEmployee.salary)
            if let profitText = profit {
                profitLabel.text = "Profit: $\(profitText)/sec (\(currentCodingLanguage))"
            }
            button.isHidden = false
        }

        
        randomLabel.text = currentEmployee.catchPhrase

        
    }
    
    @IBAction func hireEmployee(_ sender: UIButton) {
        
    }
    
    
    func efficiencyColorChange(_ efficiency:Double) {
        if efficiency >= 0.75 {
            efficiencyLabel.textColor = UIColor.green
        } else if efficiency >= 0.3 && efficiency < 0.75 {
            efficiencyLabel.textColor = UIColor.orange
        } else {
            efficiencyLabel.textColor = UIColor.red
        }
    }

}
