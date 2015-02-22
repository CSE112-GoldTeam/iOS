//
//  CheckInViewController.swift
//  RoboBetty
//
//  Created by Jason Dizon on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController
{
    @IBOutlet weak var codeInstruction: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nextButton.backgroundColor = UIColor.grayColor()
        nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextButton.layer.borderWidth = 1
        
    }
    
    override func viewWillAppear( animated: Bool )
    {
        self.navigationController?.navigationBarHidden = false
        //self.navigationItem.title = "Check In"
    }
}