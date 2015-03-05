//
//  RBSignatureViewController.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/25/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class RBSignatureViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear( animated: Bool )
    {
        super.viewWillAppear( animated )
        
        ( self.navigationController as? RBNavigationController )?.progressBar.setCurrentStep( 4, animated: true )
    }
    
    @IBAction func backButtonPressed()
    {
        navigationController?.popViewControllerAnimated( true )
    }
    
    @IBAction func submitButtonPressed()
    {
        performSegueWithIdentifier( "thankYou", sender: nil )
    }
}