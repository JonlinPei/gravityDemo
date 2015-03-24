//
//  ViewController.swift
//  gravityDemo
//
//  Created by Jonlin Pei on 3/23/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blackView: UIView!
    
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collision.collisionDelegate = self
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        gravity.gravityDirection = CGVector(dx: 0, dy: 0.5)
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior()
        animator.addBehavior(collision)
        
        collision.addBoundaryWithIdentifier("ground", fromPoint: CGPoint(x: 0, y: self.view.frame.height), toPoint: CGPointMake(self.view.frame.width, self.view.frame.height))
        
        collision.addItem(whiteView)
        collision.addItem(blackView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressGoButton(sender: AnyObject) {
        gravity.addItem(whiteView)
        gravity.addItem(blackView)

    }

}

