//
//  AppDelegate.swift
//  Assignment2
//
//  Created by Collective X on 24/10/20.
//  Copyright © 2020 Byron. All rights reserved.
//

import UIKit
import CoreData

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
        
        func storeStudent (/*name: String, size: String, price: Int*/) {
        
            let context = getContext()
            let entity = NSEntityDescription.entity(forEntityName: "Pizza", in:context)
            
        
            let transc = NSManagedObject(entity: entity!, insertInto: context) //set the entity values
            
        
    //        transc.setValue(name, forKey: "name")
    //        transc.setValue(size, forKey: "size")
    //        transc.setValue(price, forKey: "price")
        
            //save the object
        
            do {
        
                try context.save()
        
            }catch let error as NSError {
         
                print("Could not save \(error), \(error.userInfo)")
                
            }
            catch {
                
            }
        }
            
        func getStudentInfo () -> String {

            var info = ""

            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")

            do {
                let searchResults = try getContext().fetch(fetchRequest)

                    for trans in searchResults as [NSManagedObject] {

    //                    let name = trans.value(forKey: "name") as! String
    //                    let size = trans.value(forKey: "size") as! String
    //                    let price = String(trans.value(forKey: "price") as! Int)
    //
    //                    info = info + name + ", " + size + ", " + price + "\n"
                    }
                
                } catch {
                    print("Error with request: \(error)")
                }
            return info;
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

