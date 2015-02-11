//
//  UserInfoViewController.swift
//  RoboBetty 
//
//  Created by Mike Griffin on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController
{
    @IBOutlet weak var nextSignInButton: UIButton!
    @IBOutlet weak var notYouButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nextSignInButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        nextSignInButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextSignInButton.layer.cornerRadius = 5
        nextSignInButton.layer.borderWidth = 1
        
        notYouButton.backgroundColor = UIColor (red:0.863, green:0, blue:0, alpha:1)
        notYouButton.layer.borderColor = UIColor.whiteColor().CGColor
        notYouButton.layer.cornerRadius = 5
        notYouButton.layer.borderWidth = 1
    }
}