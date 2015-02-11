//
//  ViewController.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/2/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class RBCheckInViewController: UIViewController
{
    @IBOutlet weak var checkInButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        checkInButton.backgroundColor = UIColor.grayColor()
        checkInButton.layer.borderColor = UIColor.whiteColor().CGColor
        checkInButton.layer.borderWidth = 1
    }

    override func viewWillAppear( animated: Bool )
    {
        super.viewWillAppear( animated )
        self.navigationController?.navigationBarHidden = true
    }
}