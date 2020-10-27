//
//  ExamListViewController.swift
//  Assignment2
//
//  Created by Collective X on 27/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit

class ExamListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var examTable: UITableView!
    
    var selectedStudent = StudentObj()
    var selectedExam = ExamObj()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.getExamInfo(id: selectedStudent.id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myExamCell", for: indexPath)
        cell.textLabel!.text = ExamArray[indexPath.row].exName + " " + ExamArray[indexPath.row].exLocation
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedExam = ExamArray[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetails" {
            let vc = segue.destination as! StudentDetailViewController
            vc.selectedStudent = selectedStudent
        } else if segue.identifier == "viewExam" {
            let vc = segue.destination as! ExamEditViewController
            vc.selectedExam = selectedExam
            vc.selectedStudent = selectedStudent
        } else if segue.identifier == "addExam" {
            let vc = segue.destination as! ExamEditViewController
                vc.selectedStudent = selectedStudent
        }
    }
    
}
