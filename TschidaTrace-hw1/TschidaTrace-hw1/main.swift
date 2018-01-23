//
//  main.swift
//  TschidaTrace-hw1
//
//  Created by Trace Tschida on 1/23/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import Foundation

func main() -> Void
{
    // Create three car classes
    let maserati: Automoblie = Automoblie.create(make: "Maserati", model: "GranTurismo", numberOfDoors: 2, speed: 67);
    
    let honda: Automoblie = Automoblie.create(make: "Honda", model: "Accord", numberOfDoors: 4, speed: 128);
    
    let tesla: Automoblie = Automoblie.create(make: "Tesla", model: "Model S 90", numberOfDoors: 2, speed: 35);
    
    // Loop through 10 times, adjust speed, and print description
    for _ in 0...9
    {
        // Increase the speed on each car
        maserati.increaseSpeed(speedChange: Int(randomValueBetween(min: 0, max: 16)));
        honda.increaseSpeed(speedChange: Int(randomValueBetween(min: 0, max: 16)));
        tesla.increaseSpeed(speedChange: Int(randomValueBetween(min: 0, max: 16)));
        
    }
    
    // Print the final output
    print(maserati.description())
    print(honda.description())
    print(tesla.description())
    
    // Find which car had the greatest speed
    let carStats: [String: Int] = ["\(maserati.make) \(maserati.model)": maserati.speed, "\(honda.make) \(honda.model)": honda.speed, "\(tesla.make) \(tesla.model)": tesla.speed];
    var carWinners = [String]()
    var maxSpeed: Int = 0;
    
    for (carMake, speed) in carStats
    {
        if (speed >= maxSpeed)
        {
            // Set the max speed and car winners
            maxSpeed = speed;
            carWinners.append(carMake);
        }
    }
    
    if (carWinners.count > 1)
    {
        print("There was a tie!")
    }
    else
    {
        print("\(carWinners[0]) won!!")
    }
}

func randomValueBetween(min:UInt32, max:UInt32) -> UInt32
{
    let randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
    return randomValue
}

main()
