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
    
    // Core Data object
    var people: [NSManagedObject] = [NSManagedObject]()
    
    func savePerson (firstName: String, lastName: String, state: String, politicalParty: String){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create Entity we wante to save
        let person = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        // Set the values
        person?.setValue(firstName, forKey: "firstName")
        
    }
}


