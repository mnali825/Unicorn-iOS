//
//  RecruitTableVC.swift
//  Unicorn
//
//  Created by Mir Ali on 3/31/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit



class RecruitTableVC: UITableViewController {
    
    var possibleEmployee:Int = 5
    var canRefresh:Bool = true
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        let currNumEmployees = Employees.count
        self.title = "Employees \(currNumEmployees)/\(totalNumEmployees)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(RecruitTableVC.refreshRecruits))
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return possibleEmployee
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Employee") as? RecruitTableViewCell {
            cell.configureCell(indexPath.row)
            
            cell.button.tag = indexPath.row
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RecruitTableVC.handleDeleteTap(_:)))
            cell.button.addGestureRecognizer(tapGesture)
            return cell
        } else {
            return RecruitTableViewCell()
        }
    }
    
    func handleDeleteTap(_ sender: UITapGestureRecognizer)
    {
        if let button = sender.view as? UIButton
        {
            if Employees.count < totalNumEmployees {
                
                //Find current cell and add it to Employees
                let indexPath = IndexPath(row: button.tag, section: 0)
                let cell = tableView.cellForRow(at: indexPath) as? RecruitTableViewCell
                
                Employees.append((cell?.currentEmployee)!)
                
                totalMoneyIncrease += Int((cell?.profit)!)
                
                //Update Title
                let currNumEmployees = Employees.count
                self.title = "Employees \(currNumEmployees)/\(totalNumEmployees)"
                
                //Decrememnt number of rows and delete row at index path
                possibleEmployee -= 1
                possibleEmployees.remove(at: button.tag)
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                self.tableView.reloadData()
                
                //print(totalMoneyIncrease)
            }
        }
    }
    
    @IBAction func refreshRecruits() {
        if canRefresh == true {
            canRefresh = false
            timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(RecruitTableVC.refreshTimer), userInfo: nil, repeats: true)
            possibleEmployee = 5
            possibleEmployees = []
            for _ in 1...5 {
                let employee = Employee()
                possibleEmployees.append(employee)
            }
            self.tableView.reloadData()
        }

    }
    
    func refreshTimer() {
        canRefresh = true
    }

}
