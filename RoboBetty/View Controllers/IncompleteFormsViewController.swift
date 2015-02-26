//
//  IncompleteFormsViewController.swift
//  RoboBetty
//
//  Created by Mike Griffin on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class IncompleteFormsViewController: UIViewController
{
    @IBOutlet var topBorder: UILabel!
    @IBOutlet var bottomBorder: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        topBorder.layer.borderColor = UIColor.blackColor().CGColor
        topBorder.layer.borderWidth = 1.0
        
        bottomBorder.layer.borderColor = UIColor.blackColor().CGColor
        bottomBorder.layer.borderWidth = 1.0
    }
    
    override func viewWillAppear( animated: Bool )
    {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear( animated: Bool )
    {
        super.viewWillDisappear( animated )
    }
}