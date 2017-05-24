//
//  ViewController.swift
//  DemoPageControl
//
//  Created by winify on 5/24/17.
//  Copyright © 2017 com.muume.sdk.FCBayernMunich. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var myControllers = [UIViewController]()
    var currentVC: Int = 0
    
    var firstVC = FirstViewController()
    var secondVC = SecondViewController()
    var thirdVC = ThirdViewController()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.delegate = self
        self.dataSource = self        
        
        
        self.currentVC = 1
        myControllers.append(firstVC)
        myControllers.append(secondVC)
        myControllers.append(thirdVC)
        
        
//        myControllers.a
        
        
        self.setViewControllers([secondVC],
                                direction: .forward,
                                animated: true) { (finished) in
                                    
                                    print("finished")
                                    
        }
        
    }

    
    
    func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        print(viewController)
        
        
        print("viewControllerBefore index: \(String(describing: myControllers.index(of: viewController)))" )
        
        guard let index = myControllers.index(of: viewController) else {
            return nil
        }

        if index == 0 {
            return nil
        } else {
            return myControllers[index - 1]
        }
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        print(viewController)
        print("viewControllerAfter index: \(String(describing: myControllers.index(of: viewController)))" )
        
        guard let index = myControllers.index(of: viewController) else {
            return nil
        }

        
        if index == self.myControllers.count - 1 {
            return nil
        } else {
            
            return myControllers[index + 1]
        }
        
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return myControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        
        return self.currentVC
    }
    
}





