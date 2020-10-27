//
//  StudentDetailViewController.swift
//  Assignment2
//
//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    var selectedStudent = StudentObj(id: "", fName: "", lName: "", gender: "", course: "", age: "", address: "")
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var fn: UILabel!
    @IBOutlet weak var ln: UILabel!
    @IBOutlet weak var g: UILabel!
    @IBOutlet weak var cor: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var ad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = selectedStudent.id
        fn.text = selectedStudent.fName
        ln.text = selectedStudent.lName
        g.text = selectedStudent.gender
        cor.text = selectedStudent.course
        age.text = selectedStudent.age
        ad.text = selectedStudent.address
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if id.text == "" {
        } else {
            var vc = segue.destination as! EditSdudentViewController
            vc.selectedStudent = selectedStudent
        }
    }

    @IBAction func editStudent(_ sender: Any) {
        if id.text == "" {
        } else {
            performSegue(withIdentifier: "editStudent", sender: self)
        }
    }
}
