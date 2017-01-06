//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Sanjay Mali on 06/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var customView: UIView!
    @IBOutlet var done: UIButton!
    
    var effect:UIVisualEffect!
    @IBOutlet weak var blur_effect: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = blur_effect.effect
        blur_effect.effect = nil
        customView.layer.cornerRadius = 5
        done.layer.cornerRadius = 3.0
        done.layer.borderColor = UIColor.lightGray.cgColor
        done.layer.borderWidth = 3
    }
    @IBAction func popUP(_ sender: Any) {
        animateIn()
    }

    @IBAction func dismiss(_ sender: Any) {
        animateOut()
    }
    func animateIn(){
        self.view.addSubview(customView)
        customView.center = self.view.center
        customView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        customView.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.blur_effect.effect = self.effect
            self.customView.alpha = 1
            self.customView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.4,animations:{
            self.customView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.customView.alpha = 0
            self.blur_effect.effect = nil
        }){(success:Bool) in
           self.customView.removeFromSuperview()
        }
    }
}

