//
//  CompletedFormsViewController.swift
//  RoboBetty
//
//  Created by Mike Griffin on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class CompletedFormsViewController: UIViewController
{
    @IBOutlet weak var submitFormsButton: UIButton!
    @IBOutlet var topBorder: UILabel!
    @IBOutlet var bottomBorder: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        submitFormsButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        submitFormsButton.layer.borderColor = UIColor.whiteColor().CGColor
        submitFormsButton.layer.cornerRadius = 5
        submitFormsButton.layer.borderWidth = 1
        
        topBorder.layer.borderColor = UIColor.blackColor().CGColor
        topBorder.layer.borderWidth = 1.0
        
        bottomBorder.layer.borderColor = UIColor.blackColor().CGColor
        bottomBorder.layer.borderWidth = 1.0
    }
}