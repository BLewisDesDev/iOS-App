//
//  StudentListViewController.swift
//  Assignment2
//
//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit
//import SwiftUI

class StudentListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var studentTable: UITableView!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    


}
