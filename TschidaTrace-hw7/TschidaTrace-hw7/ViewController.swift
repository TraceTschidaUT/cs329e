//
//  ViewController.swift
//  TschidaTrace-hw7
//
//  Created by user135456 on 3/3/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // View Properties
    @IBOutlet weak var squareLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attach a UISwipeGR to the view for left and right swipes
        // Define the gesture recognizer with the handler function
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe(_:)))
        swipeLeft.direction = .left
        
        // Add the recognizer to the view
        self.view.addGestureRecognizer(swipeLeft)
        
        // Right Swipe gesture recog.nizer
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        
        }
    
    // View Properties
    var moveLeft: Bool = true
    
    @IBAction func handleLeftSwipe(_ recognizer: UISwipeGestureRecognizer) {
        
        
        print("awesome")
        if recognizer.state == .ended {
            
            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .linear, animations: {
                self.squareLabel.center = CGPoint(x: 0, y: 0)
            })
            
            // Start the animation
            animator.startAnimation()
        }
        
    }
    
    @IBAction func handleRightSwipe (_ recognizer: UISwipeGestureRecognizer) {
        
    }
    
    @IBAction func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        // Make sure the view exists
        guard let label = recognizer.view as? UILabel else {
            return
        }
        
        // If the user has finished tapping
        if recognizer.state == .ended {
            
            // Determine the position of the label
            var movePoints = CGFloat(-50)
            
            // Get the left and right edges of the label
            let labelLeftEdge: CGFloat = label.frame.minX
            let labelRightEdge: CGFloat = label.frame.maxX
            
            // Get the frame of the parent view
            let viewLeftEdge = self.view.frame.minX
            let viewRightEdge = self.view.frame.maxX
            
            if moveLeft {
                movePoints = -50
                if labelLeftEdge - 50 <= 0 {
                    movePoints = 50
                    moveLeft = false
                }
            }
            
            if !moveLeft {
                movePoints = 50
                if labelRightEdge + 50 >= viewRightEdge {
                    movePoints = -50
                    moveLeft = true
                }
            }
            
            let animator = UIViewPropertyAnimator(duration: 0.50, curve: .linear, animations: {
                recognizer.view?.center.x += movePoints
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

