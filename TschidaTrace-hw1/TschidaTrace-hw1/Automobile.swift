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
    private var _make: String = "";
    private var _model: String = "";
    private var _numberOfDoors: Int = 0;
    private var _speed: Int = 0;
    
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
        return Automoblie(make: <#T##String#>, model: <#T##String#>, numberOfDoors: <#T##Int#>, speed: <#T##Int#>);
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
        // Determine if the speed change is between 0 and 150
        if (self.speed + speedChange > 150 || self.speed + speedChange < 0)
        {
            print("The new speed must be between 0 and 150 miles per hour")
        }
        
        // Set the new speed
        self._speed += speedChange;
        
    }
}