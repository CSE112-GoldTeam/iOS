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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        okButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        okButton.layer.borderColor = UIColor.whiteColor().CGColor
        okButton.layer.cornerRadius = 5
        okButton.layer.borderWidth = 1
    }

    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = true
    }
}