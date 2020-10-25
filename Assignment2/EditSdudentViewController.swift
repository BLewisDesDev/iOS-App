//
//  EditSdudentViewController.swift
//  Assignment2
//
//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit

class EditSdudentViewController: UIViewController {
    
    @IBOutlet weak var idTxt: UITextField!
    @IBOutlet weak var fnTxt: UITextField!
    @IBOutlet weak var lnTxt: UITextField!
    @IBOutlet weak var genderSelect: UISegmentedControl!
    @IBOutlet weak var courseTxt: UITextField!
    @IBOutlet weak var ageStep: UIStepper!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var ageLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageStep.wraps = true
        ageStep.autorepeat = true
        ageStep.maximumValue = 110

    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }

    @IBAction func save(_ sender: Any) {
        
        let ids : String = idTxt.text!
        let fns : String = fnTxt.text!
        let lns : String = lnTxt.text!
        var genders : String
        let courses : String = courseTxt.text!
        let ages : String = ageLbl.text!
        let addys : String = addressTxt.text!
        
        if self.genderSelect.selectedSegmentIndex == 0 {
            genders = "Male";
        }
        else {
            genders = "Female";
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.storeStudent(id: ids, fName: fns, lName: lns, gender: genders, course: courses, age: ages, address: addys)
        
    }
    
    
    @IBAction func setAge(_ sender: Any) {
        let step = Int(ageStep.value)
        ageLbl.text = String(step)
    }
}
