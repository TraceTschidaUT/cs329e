//
//  Person.swift
//  TraceTschida-hw4
//
//  Created by Trace Tschida on 2/13/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import Foundation

class Person
{
    public var firstName: String
    public var lastName: String
    public var age: Int
    public var street: String
    public var city: String
    public var state: String
    public var zip: Int
    
    init(firstName: String, lastName: String, age: Int, street: String, city: String, state: String, zip: Int)
    {
        // Set all of the properties
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
    }
}
