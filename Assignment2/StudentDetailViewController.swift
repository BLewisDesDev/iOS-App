
//  SceneDelegate.swift
//  Assignment2

//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.

import UIKit
import MapKit

class StudentDetailViewController: UIViewController {
    
    var selectedStudent = StudentObj(id: "", fName: "", lName: "", gender: "", course: "", age: "", address: "")
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var fn: UILabel!
    @IBOutlet weak var ln: UILabel!
    @IBOutlet weak var g: UILabel!
    @IBOutlet weak var cor: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UIButton!
    @IBOutlet weak var btnExam: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = selectedStudent.id
        fn.text = selectedStudent.fName
        ln.text = selectedStudent.lName
        g.text = selectedStudent.gender
        cor.text = selectedStudent.course
        age.text = selectedStudent.age
        address.setTitle(selectedStudent.address, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editStudent" {
            let vc = segue.destination as! EditSdudentViewController
                vc.selectedStudent = selectedStudent
        } else if segue.identifier == "backToListi" {
             _ = segue.destination as!  StudentListViewController
        }else if segue.identifier == "deleteBack" {
        _ = segue.destination as!  StudentListViewController
        }else if segue.identifier == "showExams" {
        _ = segue.destination as! ExamListViewController
        }
    }
    
    @IBAction func deleteStudent(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.removeSingleRecord(id: id.text ?? "")
    }
    
    @IBAction func findOnMap(_ sender: Any) {
        coordinates(forAddress: selectedStudent.address) {
            (location) in
            guard let location = location else {
                return
            }
            self.openMapForPlace(lat: location.latitude, long: location.longitude)
        }
    }
     
    public func openMapForPlace(lat:Double = 0, long:Double = 0, placeName:String = "") {
         let latitude: CLLocationDegrees = lat
         let longitude: CLLocationDegrees = long

         let regionDistance:CLLocationDistance = 100
         let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
         let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
         let options = [
             MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
             MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
         ]
         let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
         let mapItem = MKMapItem(placemark: placemark)
         mapItem.name = placeName
         mapItem.openInMaps(launchOptions: options)
     }
     
     func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
         let geocoder = CLGeocoder()
         geocoder.geocodeAddressString(address) {
             (placemarks, error) in
             guard error == nil else {
                 print("Geocoding error: \(error!)")
                 completion(nil)
                 return
             }
             completion(placemarks?.first?.location?.coordinate)
         }
     }
}
