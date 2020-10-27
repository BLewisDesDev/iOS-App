
//  StudentListViewController.swift
//  Assignment2

//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.

import UIKit

class StudentListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var studentTable: UITableView!
    @IBOutlet weak var btnViewDetail: UIButton!
    @IBOutlet var goToForm: UIView!
    
    var selectedStudent = StudentObj();
    
        override func viewDidLoad() {
            super.viewDidLoad()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.getStudentInfo()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = StudentArray[indexPath.row].fName + " " + StudentArray[indexPath.row].lName + ", " + StudentArray[indexPath.row].id
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStudent = StudentArray[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetail" {
            let vc = segue.destination as! StudentDetailViewController
            vc.selectedStudent = selectedStudent
        } else if segue.identifier == "goToForm" {
             _ = segue.destination as!  EditSdudentViewController
        }else if segue.identifier == "backToHome" {
        _ = segue.destination as!  ViewController
        }
    }
}
