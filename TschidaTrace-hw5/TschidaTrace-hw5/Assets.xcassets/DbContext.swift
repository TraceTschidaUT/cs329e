//
//  DbContext.swift
//  TschidaTrace-hw5
//
//  Created by user135456 on 2/19/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DbContext {
    
    // Initalize an array of managed objects
    init() {
        
        // Core Data object
        people = [NSManagedObject]()
        
        // Load all of the people
        self.getAllPeople()
    }
    
    // Properties
    public var people: [NSManagedObject]
    
    // Functions
    func savePerson (firstName: String, lastName: String, state: String, politicalParty: String){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create Entity we want to save the new person into
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        // Grab a new person of the entity listed above and insert it into the managed context
        let person = NSManagedObject(entity: entity! , insertInto: managedContext)
        
        // Set the values
        person.setValue(firstName, forKey: "firstName")
        person.setValue(lastName, forKey: "lastName")
        person.setValue(state, forKey: "state")
        person.setValue(politicalParty, forKey: "politicalParty")
        
        // Commit the changes
        do {
            try managedContext.save()
        }
        catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        // Add the new entity to our array of managed objects
        people.append(person)
    }
    
    func getAllPeople() {
        
        // Get access to the app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // Get the managed context from the delegeate
        // Managed context was created as delegate because of the Core Data check box
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Fetch the Core Data for the Person entity
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
    }
}


