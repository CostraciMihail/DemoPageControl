//
//  ViewController.swift
//  DemoPageControl
//
//  Created by winify on 5/24/17.
//  Copyright © 2017 com.muume.sdk.FCBayernMunich. All rights reserved.
//

import UIKit


let screenBounds = UIScreen.main.bounds

class ViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var myControllers = [UIViewController]()
    var currentIndex: Int?
    var pendingIndex: Int?
    
    var firstVC = FirstViewController()
    var secondVC = SecondViewController()
    var thirdVC = ThirdViewController()
    private var pageControl = UIPageControl()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.delegate = self
        self.dataSource = self
        
        self.currentIndex = 1
        myControllers.append(firstVC)
        myControllers.append(secondVC)
        myControllers.append(thirdVC)

        self.setViewControllers([secondVC],
                                direction: .forward,
                                animated: true) { (finished) in
                                    
                                    print("animated finished")
                                    
        }
        
        self.addPageControl()
        
    }

    func addPageControl() {
        
        pageControl = UIPageControl(frame: CGRect(x: screenBounds.size.width/2 - 50, y: screenBounds.size.height - 60, width: 100, height: 40))
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.backgroundColor = UIColor.white
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        self.view.addSubview(pageControl)
        self.view.bringSubview(toFront: pageControl)
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

    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        pendingIndex = myControllers.index(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }
    
    //uncoment to add defaul pagecontrol of UIPageViewController
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        
//        return myControllers.count
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int{
//        
//        return self.currentVC
//    }
    
}



