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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        let currNumEmployees = Employees.count
        self.title = "Employees \(currNumEmployees)/\(totalNumEmployees)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .Plain, target: self, action: "refreshRecruits")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return possibleEmployee
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("Employee") as? RecruitTableViewCell {
            cell.configureCell(indexPath.row)
            
            cell.button.tag = indexPath.row
            let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleDeleteTap:"))
            cell.button.addGestureRecognizer(tapGesture)
            return cell
        } else {
            return RecruitTableViewCell()
        }
    }
    
    func handleDeleteTap(sender: UITapGestureRecognizer)
    {
        if let button = sender.view as? UIButton
        {
            if Employees.count < totalNumEmployees {
                
                //Find current cell and add it to Employees
                let indexPath = NSIndexPath(forRow: button.tag, inSection: 0)
                let cell = tableView.cellForRowAtIndexPath(indexPath) as? RecruitTableViewCell
                
                Employees.append((cell?.currentEmployee)!)
                
                totalMoneyIncrease += Int((cell?.profit)!)
                
                //Update Title
                let currNumEmployees = Employees.count
                self.title = "Employees \(currNumEmployees)/\(totalNumEmployees)"
                
                //Decrememnt number of rows and delete row at index path
                possibleEmployee--
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                self.tableView.reloadData()
                
                //print(totalMoneyIncrease)
            }
        }
    }
    
    @IBAction func refreshRecruits() {
        possibleEmployees = []
        for _ in 1...possibleEmployee {
            let employee = Employee()
            possibleEmployees.append(employee)
        }
        self.tableView.reloadData()
    }

}
