//
//  ViewController.swift
//  ex00
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/09.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var dynamicAnimator: UIDynamicAnimator!
    
    let bounce = UIDynamicItemBehavior()
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet var drag: UIPanGestureRecognizer!
    
//    @IBAction func moving(_ sender: UIPanGestureRecognizer) {
//        let point = drag.location(in: view)
//        let shape = ShapeUIView(frame: CGRect(x: point.x, y: point.y, width: 100, height: 100))
//        shape.center = point
//        self.view.addSubview(shape)
//        print(point)
//    }
    
    @IBAction func screenTapped(_ sender: Any) {
        print("Tapped")
        let location = tap.location(in: view)
        let shape = ShapeUIView(frame: CGRect(x: location.x, y: location.y, width: 100, height: 100))
//        let pan_gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(panGesture:)))
//        let pinch_Gesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(pinchGesture:)))
        let pinch_Gesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
        let pan_gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))

        shape.addGestureRecognizer(pan_gesture)
        shape.addGestureRecognizer(pinch_Gesture)
        view.addSubview(shape)
        shape.center = location
        gravity.addItem(shape)
        collision.addItem(shape)
        bounce.addItem(shape)
    }
    
    @objc func panGesture (panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
        case .began:
            print("Began")
            self.gravity.removeItem(panGesture.view!)
        case .changed:
            print("Changed to \(panGesture.location(in: view))")
            panGesture.view?.center = panGesture.location(in: panGesture.view?.superview)
            dynamicAnimator?.updateItem(usingCurrentState: panGesture.view!)
        case .ended:
            print("Ended")
            self.gravity.addItem(panGesture.view!)
        case .failed, .cancelled:
            print("Failed or Cancelled")
        case .possible:
            print("Possible")
        }
    }
    
    @objc func pinchGesture(pinchGesture: UIPinchGestureRecognizer){
        switch pinchGesture.state {
        case .began:
            gravity.removeItem(view)
        case .changed:
            collision.removeItem(view)
            bounce.removeItem(view)
            if (view.bounds.size.width <= 20) {
                view.bounds.size.width = 21
                view.bounds.size.height = 21
            } else if (view.bounds.size.width >= 151) {
                view.bounds.size.width = 150
                view.bounds.size.height = 150
            } else {
                view.bounds.size.width = view.bounds.size.width * pinchGesture.scale
                view.bounds.size.height = view.bounds.size.height * pinchGesture.scale
            }
            collision.addItem(view)
            bounce.addItem(view)
            dynamicAnimator.updateItem(usingCurrentState: pinchGesture.view!)
        case .ended:
            gravity.addItem(view)
        default:
            break ;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        let gesture = UITapGestureRecognizer(target: self, action: #selector(screenTapped(_:)))
        view.addGestureRecognizer(gesture)
        gravity.magnitude = 0.6
        bounce.elasticity = 0.79
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        dynamicAnimator.addBehavior(gravity)
        dynamicAnimator.addBehavior(collision)
        dynamicAnimator.addBehavior(bounce)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
        
}

