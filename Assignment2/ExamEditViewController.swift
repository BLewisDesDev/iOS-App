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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = .date
        datePicker.datePickerMode = .dateAndTime
//        datePicker.addTarget(self, action: #selector(selectedDate), for: .valueChanged)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
