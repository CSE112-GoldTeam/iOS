//
//  UserInfoViewController.swift
//  RoboBetty 
//
//  Created by Mike Griffin on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class RBUserInfoViewController: UIViewController, UINavigationBarDelegate
{
    @IBOutlet weak var nextSignInButton: UIButton!
    @IBOutlet weak var notYouButton: UIButton!
    
    var firstName:NSString!
    var email:NSString!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        println("NAMEEEE: \(firstName)")
        println("EMAIL: \(email)")
        
        nextSignInButton.backgroundColor = UIColor.grayColor()
        nextSignInButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextSignInButton.layer.borderWidth = 1
        
        notYouButton.backgroundColor = UIColor.redColor()
        notYouButton.layer.borderColor = UIColor.whiteColor().CGColor
        notYouButton.layer.borderWidth = 1
    }
    
    override func viewWillAppear( animated: Bool )
    {
        super.viewWillAppear( animated )
        
        ( self.navigationController as? RBNavigationController )?.progressBar.setCurrentStep( 2, animated: true )
    }
    
    @IBAction func nextButtonPressed()
    {
        performSegueWithIdentifier( "moreInfo", sender: nil )
    }
    
    override func viewWillDisappear( animated: Bool )
    {
        super.viewWillDisappear( animated )
    }
    
    @IBAction func notYouButtonPressed()
    {
        navigationController?.popViewControllerAnimated( true )
    }
}