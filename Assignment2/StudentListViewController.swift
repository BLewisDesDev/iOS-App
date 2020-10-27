
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
        cell.textLabel!.text = StudentArray[indexPath.row].fName
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStudent = StudentArray[indexPath.row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(selectedStudent.id == "") {

        } else {
            var vc = segue.destination as! StudentDetailViewController
            vc.selectedStudent = selectedStudent
        }
    }
    
    @IBAction func viewDetail(_ sender: Any) {
        performSegue(withIdentifier: "viewDetail", sender: self)
    }
    
    @IBAction func goToHome(_ sender: Any) {
        performSegue(withIdentifier: "backToHome", sender: self)
    }

    @IBAction func goToForm(_ sender: Any) {
        performSegue(withIdentifier: "goToForm", sender: self)
    }
    
}
