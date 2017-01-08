//
//  EmployeesTableViewCell.swift
//  Unicorn
//
//  Created by Mir Ali on 4/1/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var efficiencyLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var profitLabel:UILabel!
    @IBOutlet var fireButton:UIButton!
    
    var codingLanguages:[String] = ["HTML & CSS", "JScript", "MySQL", "Terminal", "PHP", "Ruby", "Python", "R", "Perl", "Java", "C#", "Pascal", "C", "Obj-C", "Fortran", "C++", "Haskell", "Assembly", "Prolog", "LISP", "Brainfuck"]
    var languageKnowledge = [String:Int]()
    var profit:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for index in 1...codingLanguages.count {
            languageKnowledge[codingLanguages[index-1]] = (10*index + index/2)
        }
    }

    func configureCell(_ employee:Employee) {
        
        nameLabel.text = employee.name
        let efficiency:Double! = employee.efficiency * 100
        if let efficiencyText = efficiency {
            efficiencyLabel.text = "Efficiency: \(efficiencyText)% "
        }
        
        costLabel.textColor = UIColor.red
        costLabel.text = "Cost: $\(employee.salary)/sec"
        
        profitLabel.textColor = UIColor.green

        randomLabel.text = employee.catchPhrase
        
        let increase = Double(languageKnowledge[currentCodingLanguage]!)
        profit = Int(employee.efficiency * increase - employee.salary)
        //employee.profit = profit
        if let profitText = profit {
            profitLabel.text = "Profit: $\(profitText)/sec (\(currentCodingLanguage))"
        }
        
        
    }

}
