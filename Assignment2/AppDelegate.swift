
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

var StudentArray:[StudentObj] = []


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
            
    func getStudentInfo() {

        StudentArray.removeAll()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")

        do {
            let searchResults = try getContext().fetch(fetchRequest)

                for trans in searchResults as [NSManagedObject] {
                    
                    let record = StudentObj(id: trans.value(forKey: "id") as! String,
                                            fName: trans.value(forKey: "fName") as! String,
                                            lName: trans.value(forKey: "lName") as! String,
                                            gender: trans.value(forKey: "gender") as! String,
                                            course: trans.value(forKey: "course") as! String,
                                            age: trans.value(forKey: "age") as! String,
                                            address: trans.value(forKey: "address") as! String)
                    
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
    
    func updateStudent (id: String, fName: String, lName: String, gender: String, course: String, age: String, address: String) {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)

        do {
            let searchResults = try context.fetch(fetchRequest)

            let objectUpdate = searchResults[0] as! NSManagedObject
            objectUpdate.setValue(id, forKey: "id")
            objectUpdate.setValue(fName, forKey: "fNmae")
            objectUpdate.setValue(lName, forKey: "lName")
            objectUpdate.setValue(gender, forKey: "gender")
            objectUpdate.setValue(age, forKey: "Age")
            objectUpdate.setValue(course, forKey: "course")
            objectUpdate.setValue(address, forKey: "Address")

            do {
                try context.save()
            } catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
    
//    func updateStudent (student : StudentObj) {
//        let context = getContext()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
//        fetchRequest.predicate = NSPredicate(format: "id = %@", student.id)
//
//        do {
//            let searchResults = try context.fetch(fetchRequest)
//
//            let objectUpdate = searchResults[0] as! NSManagedObject
//            objectUpdate.setValue(student.id, forKey: "id")
//            objectUpdate.setValue(student.fName, forKey: "fNmae")
//            objectUpdate.setValue(student.lName, forKey: "lName")
//            objectUpdate.setValue(student.gender, forKey: "gender")
//            objectUpdate.setValue(student.age, forKey: "age")
//            objectUpdate.setValue(student.course, forKey: "course")
//            objectUpdate.setValue(student.address, forKey: "address")
//
//            do {
//                try context.save()
//            } catch {
//                print(error)
//            }
//
//        }
//        catch {
//            print(error)
//        }
//    }
}

