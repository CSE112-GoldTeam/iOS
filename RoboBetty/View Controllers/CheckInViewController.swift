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

        codeInstruction.alpha = 0.5
        
        nextButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
    }
    
    override func viewWillAppear( animated: Bool )
    {
        self.navigationController?.navigationBarHidden = false
    }
}