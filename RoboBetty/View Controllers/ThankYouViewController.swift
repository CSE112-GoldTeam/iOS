//
//  ThankYouViewController.swift
//  RoboBetty
//
//  Created by Brian Fong on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController
{
    @IBOutlet var okButton: UIButton!
    @IBOutlet var pic: UIImageView!
    @IBOutlet var background: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        okButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        okButton.layer.borderColor = UIColor.whiteColor().CGColor
        okButton.layer.cornerRadius = 5
        okButton.layer.borderWidth = 1
        
        pic.image = UIImage(named: "gold-wreath-md.png")
        //background.image = UIImage(named: "background")
    }

    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = true
    }
    
}