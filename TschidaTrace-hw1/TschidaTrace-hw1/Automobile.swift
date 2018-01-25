//
//  automobile.swift
//  TschidaTrace-hw1
//
//  Created by Trace Tschida on 1/23/18.
//  Copyright © 2018 Trace Tschida. All rights reserved.
//

import Foundation

class Automoblie
{
    // Properties
    private var _make: String;
    private var _model: String;
    private var _numberOfDoors: Int;
    private var _speed: Int;
    
    // Methods
    init (make: String, model: String, numberOfDoors: Int, speed: Int)
    {
        _make = make;
        _model = model;
        _numberOfDoors = numberOfDoors;
        _speed = speed;
    }
    
    class func create (make: String, model: String, numberOfDoors: Int, speed: Int) -> Automoblie
    {
        return Automoblie(make: make, model: model, numberOfDoors: numberOfDoors, speed: speed);
    }
    
    var make: String
        {
        get { return self._make; }
        set { self._make = newValue; }
    }
    
    var model: String
        {
        get { return self._model; }
        set { self._model = newValue; }
    }
    
    var numberOfDoors: Int
        {
        get { return self._numberOfDoors; }
        set { self._numberOfDoors = newValue; }
    }
    
    var speed: Int
        {
        get { return self._speed; }
    }
    
    func increaseSpeed(speedChange: Int) -> Void
    {
        // Determine if the speed after the change is between 0 and 150
        if (self.speed + speedChange <= 150 && self.speed + speedChange >= 0)
        {
            // Set the new speed
            self._speed += speedChange;
        }
    }
    
    func decreaseSpeed(speedChange: Int) -> Void
    {
        // Determine if the speed after the change is between 0 and 150
        if (self.speed + speedChange <= 150 && self.speed + speedChange >= 0)
        {
            // Set the new speed
            self._speed += speedChange;
        }
    }
    
    func description() -> String
    {
        return "Make: \(self.make), Model: \(self.model), NumDoors: \(self.numberOfDoors), Speed \(self.speed)"
    }
}
