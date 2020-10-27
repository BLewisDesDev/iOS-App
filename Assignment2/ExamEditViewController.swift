//
//  ExamEditViewController.swift
//  Assignment2
//
//  Created by Collective X on 27/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit

extension UIDatePicker {

   func setDate(from string: String, format: String, animated: Bool = true) {

      let formater = DateFormatter()

      formater.dateFormat = format

      let date = formater.date(from: string) ?? Date()

      setDate(date, animated: animated)
   }
}

class ExamEditViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var exName: UITextField!
    @IBOutlet weak var exLocation: UITextField!
    
    var selectedExam = ExamObj()
    var selectedStudent = StudentObj()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = .date
        datePicker.datePickerMode = .dateAndTime
        
        if (selectedExam.exName != ""){
            exName.text = selectedExam.exName
            exLocation.text = selectedExam.exLocation
            datePicker.setDate(from: selectedExam.dateTime, format: "dd/MM/yyyy HH:mm", animated: true)
        }
    }
    
    @IBAction func saveExam(_ sender: Any) {
        let names : String = exName.text!
        let locations : String = exLocation.text!
        let dateFormatter = DateFormatter(); dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let dates = dateFormatter.string(from: datePicker.date);
        let ids : String = selectedStudent.id

        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        appDelegate.storeExam(id: ids, exName: names, exLocation: locations, dateTime: dates)
        
        let aleart = UIAlertController(title: "Success", message: "Exam added to Student", preferredStyle: UIAlertController.Style.alert)
        
        aleart.addAction(UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(aleart, animated: true, completion: nil)
        
        clear()
    }
    
    @IBAction func clearForm(_ sender: Any) {
        clear()
    }
    
    func clear() {
        exName.text = ""
        exLocation.text = "";
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToExamList" {
            let vc = segue.destination as! ExamListViewController
                vc.selectedStudent = selectedStudent
        }
    }
}
