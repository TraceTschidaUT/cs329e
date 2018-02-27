//
//  WondersPageViewController.swift
//  TschidaTrace-hw6
//
//  Created by Trace Tschida on 2/27/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class WondersPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // Properties
    let wonderImages: [String] = ["wonders1.png", "wonders2.png", "wonders3.png", "wonders4.png", "wonders5.png", "wonders6.png", "wonders7.png"]
    
    var wondersImageViewControllers: [WondersImageViewController] = []
    
    // Methods
    func loadWonderImageViewControllers() {
        
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
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // Get the index of the current view
        guard let viewControllerIndex = wondersImageViewControllers.index(of: viewController as! WondersImageViewController) else {
            return nil
        }
        
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
        
        return wondersImageViewControllers[previousIndex]
        
    }
    
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
        
        return wondersImageViewControllers[nextIndex]
    }
    
    // Number of Dots to display
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return wondersImageViewControllers.count
    }
    
    // Presentation of the dots
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        // Load the views
        loadWonderImageViewControllers()
        
        // Return the first image view controller
        self.setViewControllers([self.wondersImageViewControllers[0] as UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        // Set the navigation title
        self.title = "Images"
        
        // Set colors for the page control.
        // Set the global page control appearance object.
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.backgroundColor = UIColor.gray
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
