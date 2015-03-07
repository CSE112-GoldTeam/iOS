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
    @IBOutlet var hiLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var firstName:NSString!
    var lastName:NSString!
    var dateOfBirth:NSString!
    var email:NSString!
    var information:NSMutableDictionary!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nextSignInButton.backgroundColor = UIColor.grayColor()
        nextSignInButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextSignInButton.layer.borderWidth = 1
        
        notYouButton.backgroundColor = UIColor.redColor()
        notYouButton.layer.borderColor = UIColor.whiteColor().CGColor
        notYouButton.layer.borderWidth = 1
        
        firstName = information.valueForKey("fname") as NSString
        lastName = information.valueForKey("lname") as NSString
        dateOfBirth = information.valueForKey("dob") as NSString
        email = information.valueForKey("email") as NSString
        
        hiLabel.text = "Hi, " + firstName
        nameLabel.text = firstName + " " + lastName
        dobLabel.text = dateOfBirth
        emailLabel.text = email
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