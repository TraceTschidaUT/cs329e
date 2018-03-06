//
//  ViewController.swift
//  TschidaTrace-hw7
//
//  Created by user135456 on 3/3/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit

enum Location {
    case offScreenLeft
    case offScreenRight
    case movingLeft
    case movingRight
}

class ViewController: UIViewController {
    
    // View Properties
    @IBOutlet weak var squareLabel: UILabel!
    
    // Controller Properties
    var location = Location.movingLeft

    // Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attach a UISwipeGR to the view for left and right swipes
        // Define the gesture recognizer with the handler function
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe(_:)))
        swipeLeft.direction = .left
        
        // Add the recognizer to the view
        self.view.addGestureRecognizer(swipeLeft)
        
        // Right Swipe gesture recognizer
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        // Set the title of the screen
        self.navigationItem.title = "Gesturing"
        
        }
    
    // Handlers
    @IBAction func handleLeftSwipe(_ recognizer: UISwipeGestureRecognizer) {
        
        if recognizer.state == .ended {
            
            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .linear, animations: {
                self.squareLabel.center.x = 0 - (self.squareLabel.frame.size.width / 2)
            })
            
            // Change the location enum
            self.location = Location.offScreenLeft
            
            // Start the animation
            animator.startAnimation()
        }
    }
    
    @IBAction func handleRightSwipe (_ recognizer: UISwipeGestureRecognizer) {
        let animator = UIViewPropertyAnimator(duration: 0.75, curve: .linear, animations: {
            self.squareLabel.center.x = self.view.frame.maxX + (self.squareLabel.frame.size.width / 2)
        })
        
        // Change the location enum
        self.location = Location.offScreenRight
        
        // Start the animation
        animator.startAnimation()
    }
    
    // Function to handle all taps
    @IBAction func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        // If the user has finished tapping
        if recognizer.state == .ended {
            
            // Determine the position of the label
            var movePoints = CGFloat(-50)
            
            // Get the left and right edges of the label
            let labelLeftEdge: CGFloat = squareLabel.frame.minX
            let labelRightEdge: CGFloat = squareLabel.frame.maxX
            
            // Get the frame of the parent view
            let viewRightEdge = self.view.frame.maxX
            
            // Determine what the tap should do based on its location
            if self.location == Location.offScreenLeft {
                // Get the center of the square the square's width from the edge
                movePoints = self.squareLabel.frame.size.width
                self.location = Location.movingRight
            }
            
            else if self.location == Location.offScreenRight {
                movePoints = -self.squareLabel.frame.size.width
                self.location = Location.movingLeft
            }
            
            else if self.location == Location.movingLeft {
                
                movePoints = -50
                if labelLeftEdge - 50 <= 0 {
                    movePoints = -labelLeftEdge
                    self.location = Location.movingRight
                }
            }
            
            else if self.location == Location.movingRight {
                movePoints = 50
                if labelRightEdge + 50 >= viewRightEdge {
                    
                    // Move points is the distance to the edge of the view from the edge of square
                    movePoints = self.view.frame.maxX - self.squareLabel.frame.maxX
                    self.location = Location.movingLeft
                }
            }
            
            // Create the animation
            let animator = UIViewPropertyAnimator(duration: 0.50, curve: .linear, animations: {
                self.squareLabel.center.x += movePoints
            })
            
            // Start the animation
            animator.startAnimation()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

