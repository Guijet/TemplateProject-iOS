//
//  SwipePageController.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-08-14.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class SwipePageController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var imagesArray:[UIImage]?
    private var firstImageView:UIImageView!
    private lazy var controllersArray:[VCShowcasePicture] = [VCShowcasePicture]()
    private var currentController:VCShowcasePicture!
    private var firstIndex:Int!
    private var currentIndex:Int!
    var btnDismiss = UIButton()
    var btnMoreOptions = UIButton()
    
    private var previousBarStyle:UIStatusBarStyle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        self.view.backgroundColor = .black
        
        //set up buttons and swipes
        setUpButtons()
        setUpDismissSwipes()
        
        //set top bar color to white
        previousBarStyle = UIApplication.shared.statusBarStyle
        UIApplication.shared.setStatusBarWhite()
        
        //set up controller array
        setUpControllers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //set top bar color back to normal
        if !(previousBarStyle == .lightContent) {
            UIApplication.shared.setStatusBarBlack()
        }
    }
    
    init(style: UIPageViewControllerTransitionStyle = .scroll, navigationOrientation: UIPageViewControllerNavigationOrientation = .horizontal, options:[String:Any]? = nil, imagesArray:[UIImage], firstIndex:Int = 0, firstImageView:UIImageView) {
        self.imagesArray = imagesArray
        self.firstIndex = firstIndex
        self.firstImageView = firstImageView
        
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpButtons() {
        //x button
        btnDismiss.frame = CGRect(x: rw(20), y: rh(43), width: rw(40), height: rw(40))
        btnDismiss.setImage(UIImage(named:"ShowcaseCloseButton"), for: .normal)
        btnDismiss.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        btnDismiss.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        btnDismiss.isHidden = true
        self.view.addSubview(btnDismiss)
        
        //save btn
        btnMoreOptions.frame = CGRect(x: rw(315), y: rh(45), width: rw(40), height: rw(40))
        btnMoreOptions.setImage(UIImage(named:"ShowcaseDownloadButton"), for: .normal)
        btnMoreOptions.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        btnMoreOptions.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        btnMoreOptions.isHidden = true
        self.view.addSubview(btnMoreOptions)
    }
    
    private func setUpDismissSwipes() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(gesture:)))
        swipeUp.direction = .up
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(gesture:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
    }
    
    private func setUpControllers() {
        if imagesArray != nil {
            for x in imagesArray! {
                let showcase = VCShowcasePicture(image: x)
                controllersArray.append(showcase)
            }
            
            if let firstFeature = controllersArray[firstIndex] as? VCShowcasePicture {
                setViewControllers([firstFeature], direction: .forward, animated: true, completion: nil)
                currentController = controllersArray[firstIndex]
                currentIndex = firstIndex
            }
        }
    }
    
    @objc private func saveImage() {
        let vc = UIActivityViewController(activityItems: [currentController.imvImage.image!], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func closeView() {
        dismissShowcase()
    }
    
    @objc private func swiped(gesture:UISwipeGestureRecognizer) {
        if gesture.direction == .up || gesture.direction == .down {
            dismissShowcase()
        }
    }
    
    private func dismissShowcase() {
        if currentIndex != firstIndex {
            dismissImage()
        } else {
            dismissFirstImage()
        }
    }
    
    private func dismissImage() {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.backgroundColor = .clear
            self.btnDismiss.isHidden =  true
            self.btnMoreOptions.isHidden = true
            self.currentController.imvImage.alpha = 0.5
            self.currentController.imvImage.frame = CGRect(x: 0, y: 0, width: self.currentController.imvImage.frame.width * 0.5, height: self.currentController.imvImage.frame.height * 0.5)
            self.currentController.imvImage.center = self.view.center
        }, completion: { _ in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    private func dismissFirstImage() {
        self.firstImageView.isHidden = true
        UIView.animate(withDuration: 0.2, animations: {
            self.view.backgroundColor = .clear
            self.btnDismiss.isHidden =  true
            self.btnMoreOptions.isHidden = true
            self.currentController.imvImage.frame = self.firstImageView.frame
        }, completion: { _ in
            self.dismiss(animated: false, completion: {
                self.firstImageView.isHidden = false
            })
        })
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = controllersArray.index(of: viewController as! VCShowcasePicture) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard controllersArray.count > previousIndex else {
            return nil
        }
        
        return controllersArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllersArray.index(of: viewController as! VCShowcasePicture) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard controllersArray.count != nextIndex else {
            return nil
        }
        
        guard controllersArray.count > nextIndex else {
            return nil
        }
        
        return controllersArray[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let vc = pageViewController.viewControllers![0]
        self.currentIndex = controllersArray.index(of: vc as! VCShowcasePicture)
        self.currentController = controllersArray[self.currentIndex]
    }
}
