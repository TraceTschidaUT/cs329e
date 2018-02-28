//
//  WondersPageViewController.swift
//  TschidaTrace-hw6
//
//  Created by Trace Tschida on 2/27/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class WondersPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // Controller Properties
    // The names of the image files
    let wonderImages: [String] = ["wonders1.png", "wonders2.png", "wonders3.png", "wonders4.png", "wonders5.png", "wonders6.png", "wonders7.png"]
    
    // An array for view controller for the page to access
    var wondersImageViewControllers: [WondersImageViewController] = []
    
    // Controller Methods
    // Loop through each image and create a new view controller
    fileprivate func loadWonderImageViewControllers() {
        
        for index in 0...6 {
            
            // Get the View Controller
            guard let wondersImageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WondersImageViewController") as? WondersImageViewController else {
                return
            }
            
            // Create an UIImage
            guard let currentImage: UIImage = UIImage(named: wonderImages[index]) else {
                return
            }
            
            // Set the current image property on the ImageViewController
            // Cannot set the outlet directly because the view has not been added to the hiearchy yet
            wondersImageViewController.currentImage = currentImage
            
            // Add the newly created view controller to the list of view controllerss
            wondersImageViewControllers.append(wondersImageViewController)
        }
    }
    
    // If the user is swiping back to an previous view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // Get the index of the current view
        guard let viewControllerIndex = wondersImageViewControllers.index(of: viewController as! WondersImageViewController) else {
            return nil
        }
        
        // Go to the previous view controller index
        let previousIndex = viewControllerIndex - 1
        
        // If the index is going to negative means they are on the first image about to cycle back
        // Return the last image which will reset the index as well
        guard previousIndex >= 0 else {
            return wondersImageViewControllers.last
        }
        
        // Check to make sure the count if always greater than the index of the previous
        guard wondersImageViewControllers.count > previousIndex else {
            return nil
        }
        
        // Return the previous view controller
        return wondersImageViewControllers[previousIndex]
        
    }
    
    // If the user is swiping forward to the next view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // Get the view controller from the storyboard
        guard let viewControllerIndex = wondersImageViewControllers.index(of: viewController as! WondersImageViewController) else {
            return nil
        }
        
        // Get the next ViewController's index
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = wondersImageViewControllers.count
        
        // The edge case is if the user if on the last view and is about to swipe to the first image
        guard orderedViewControllersCount != nextIndex else {
            return wondersImageViewControllers.first
        }
        
        // Check to make sure the count if always greater than the index of the previous
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        // Return the next view controller
        return wondersImageViewControllers[nextIndex]
    }
    
    // Number of Dots to display
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return wondersImageViewControllers.count
    }
    
    // Presentation of the dots order
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstViewController = viewControllers?.first as? WondersImageViewController,
            let firstViewControllerIndex = wondersImageViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the PageViewController's data source (view controllers) to this viewcontroller
        self.dataSource = self
        
        // Set the PageViewController's delegate (controls the presentation of the PageViewController)
        self.delegate = self
        
        // Set the navigation title
        self.title = "Wonders of the World"
        
        // Set colors for the page control.
        // Set the global page control appearance object.
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.backgroundColor = UIColor.lightGray
        
        // Create the new views
        loadWonderImageViewControllers()
        
        // Return the first image view controller
        self.setViewControllers([self.wondersImageViewControllers[0] as UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
