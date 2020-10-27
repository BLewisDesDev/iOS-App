//
//  ExamEditViewController.swift
//  Assignment2
//
//  Created by Collective X on 27/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit

class ExamEditViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var exName: UITextField!
    @IBOutlet weak var exLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = .date
        datePicker.datePickerMode = .dateAndTime
    }
    
    @IBAction func saveExam(_ sender: Any) {
        let name : String = exName.text!
        let location : String = exLocation.text!
        let dateFormatter = DateFormatter(); dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let date = dateFormatter.string(from: datePicker.date);
        
    }
    
    
    @IBAction func clearForm(_ sender: Any) {
        clear()
    }
    
    func clear() {
        exName.text = ""
        exLocation.text = "";
    }
    
}
