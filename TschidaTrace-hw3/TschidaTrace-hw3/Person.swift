//
//  Person.swift
//  TschidaTrace-hw3
//
//  Created by Trace Tschida on 2/8/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import Foundation

public class Person
{
    // Properties
    public var firstName: String?
    public var lastName: String?
    public var age: Int?
    public var city: String?
    
    // Init method
    init(firstName: String, lastName: String, age: Int, city: String)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.city = city
    }
}

