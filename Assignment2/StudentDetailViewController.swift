//
//  StudentDetailViewController.swift
//  Assignment2
//
//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    var studentRecord = StudentObj()
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var fn: UILabel!
    @IBOutlet weak var ln: UILabel!
    @IBOutlet weak var g: UILabel!
    @IBOutlet weak var cor: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var ad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = studentRecord.id
        fn.text = studentRecord.fName
        ln.text = studentRecord.lName
        g.text = studentRecord.gender
        cor.text = studentRecord.course
        age.text = studentRecord.age
        ad.text = studentRecord.address
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
