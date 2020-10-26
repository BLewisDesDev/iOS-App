
//  AppDelegate.swift
//  Assignment2
//
//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.

import UIKit
import CoreData

struct StudentObj {
    var id : String = ""
    var fName : String = ""
    var lName : String = ""
    var gender : String = ""
    var course : String = ""
    var age : String = ""
    var address : String = ""
}

var StudentArray = [StudentObj]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Assignment2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getContext () -> NSManagedObjectContext {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }
        
    func storeStudent (id: String, fName: String, lName: String, gender: String, course: String, age: String, address: String) {
        
            let context = getContext()
            let entity = NSEntityDescription.entity(forEntityName: "Student", in:context)
            
            let transc = NSManagedObject(entity: entity!, insertInto: context) //set the entity values
        
                transc.setValue(id, forKey: "id")
                transc.setValue(fName, forKey: "fName")
                transc.setValue(lName, forKey: "lName")
                transc.setValue(gender, forKey: "gender")
                transc.setValue(course, forKey: "course")
                transc.setValue(age, forKey: "age")
                transc.setValue(address, forKey: "address")
        
            do {
        
                try context.save()
        
            }catch let error as NSError {
                
                print("Could not save \(error), \(error.userInfo)")
                
            }
            catch {
                
            }
        }
            
//        func getStudentInfoString () -> String {
//
//            var info = ""
//
//            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
//
//            do {
//                let searchResults = try getContext().fetch(fetchRequest)
//
//                    for trans in searchResults as [NSManagedObject] {
//
//                        let id = trans.value(forKey: "id") as! String
//                        let fName = trans.value(forKey: "fName") as! String
//                        let lName = trans.value(forKey: "lName") as! String
//                        let gender = trans.value(forKey: "gender") as! String
//                        let course = trans.value(forKey: "course") as! String
//                        let age = trans.value(forKey: "age") as! String
//                        let address = trans.value(forKey: "address") as! String
//
//                        info = info + id + ", " +
//                                fName + ", " +
//                                lName + ", " +
//                                gender + ", " +
//                                course + ", " +
//                                age + ", " +
//                                address + "\n"
//                    }
//
//                } catch {
//                    print("Error with request: \(error)")
//                }
//            return info;
//        }
    
    func getStudentInfo () {

        StudentArray.removeAll()
        var record = StudentObj()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")

        do {
            let searchResults = try getContext().fetch(fetchRequest)

                for trans in searchResults as [NSManagedObject] {
                    
                    record.id = trans.value(forKey: "id") as! String
                    record.fName = trans.value(forKey: "fName") as! String
                    record.lName = trans.value(forKey: "lName") as! String
                    record.gender = trans.value(forKey: "gender") as! String
                    record.course = trans.value(forKey: "course") as! String
                    record.age = trans.value(forKey: "age") as! String
                    record.address = trans.value(forKey: "address") as! String
                    StudentArray.append(record)
                    
                }
            
            } catch {
                print("Error with request: \(error)")
            }
    }
    
    func removeRecords () {
        let context = getContext()
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            
        } catch {
            print ("There was an error")
        }
    }
}

