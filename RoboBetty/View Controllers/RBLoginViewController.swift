//
//  RBLoginViewController.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/10/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class RBLoginViewController: UIViewController
{
    private(set) var backgroundImageView: UIImageView!
    private(set) var robotImageView: UIImageView!
    private(set) var nameLabel: UILabel!
    private(set) var formBackgroundView: UIView!
    private(set) var usernameField: RBTextField!
    private(set) var passwordField: RBTextField!
    private(set) var loginButton: UIButton!
    
    private var shouldSplash = false
    
    init( splash: Bool )
    {
        super.init( nibName: nil, bundle: nil )
        shouldSplash = splash
    }
    
    required init( coder aDecoder: NSCoder)
    {
        super.init( coder: aDecoder )
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loginButton.addTarget( self, action: "submitLogin", forControlEvents: UIControlEvents.TouchUpInside )
    }
    
    override func touchesBegan( touches: NSSet, withEvent event: UIEvent )
    {
        super.touchesBegan( touches, withEvent: event )
        view.endEditing( true )
    }
    
    override func viewDidAppear( animated: Bool )
    {
        super.viewDidAppear( animated )
        
        UIView.animateWithDuration( 1.0, delay: 1.0, options: nil, animations:
        {
            self.setupLoginLayout()
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        },
        completion: nil )
    }
    
    func submitLogin()
    {
        RBAPIManager.manager.login( "", password: "" )
    }
    
    
    
    
    
    override func loadView()
    {
        view = UIView()
        setupInitialLayout()
        
        if shouldSplash != true
        {
            setupLoginLayout()
        }
    }
    
    private func setupInitialLayout()
    {
        backgroundImageView = UIImageView( image: UIImage( named: "background" ) )
        view.addSubview( backgroundImageView )
        backgroundImageView.autoPinEdgesToSuperviewEdgesWithInsets( UIEdgeInsetsZero )
        
        let robotImage = UIImage( named: "robot" )
        robotImageView = UIImageView( image: robotImage )
        robotImageView.contentMode = UIViewContentMode.ScaleAspectFit
        view.addSubview( robotImageView )
        robotImageView.autoCenterInSuperview()
        robotImageView.autoSetDimensionsToSize( CGSizeMake( robotImage!.size.width * 0.80, robotImage!.size.height * 0.8 ) )
        
        createLoginViews()
    }
    
    private func createLoginViews()
    {
        nameLabel = UILabel()
        nameLabel.text = "RoboBetty"
        nameLabel.font = RBConstants.primaryFont( 50.0 )
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.sizeToFit()
        
        formBackgroundView = UIView()
        formBackgroundView.backgroundColor = UIColor( red: 0, green: 0, blue: 0, alpha: 0.7 )
        
        let signInLabel = UILabel()
        signInLabel.font = RBConstants.primaryFont( 18.0 )
        signInLabel.textColor = UIColor.whiteColor()
        signInLabel.text = "Sign In"
        signInLabel.sizeToFit()
        formBackgroundView.addSubview( signInLabel )
        signInLabel.autoSetDimensionsToSize( signInLabel.frame.size )
        signInLabel.autoPinEdgeToSuperviewEdge( ALEdge.Top, withInset: 10 )
        signInLabel.autoPinEdgeToSuperviewEdge( ALEdge.Left, withInset: 15 )
        
        usernameField = RBTextField()
        usernameField.font = RBConstants.primaryFont( 18.0 )
        usernameField.placeholder = "Username / Email"
        usernameField.textColor = UIColor.blackColor()
        usernameField.backgroundColor = UIColor.whiteColor()
        formBackgroundView.addSubview( usernameField )
        usernameField.autoPinEdge( ALEdge.Top, toEdge: ALEdge.Bottom, ofView: signInLabel, withOffset: 10.0 )
        usernameField.autoPinEdgeToSuperviewEdge( ALEdge.Left, withInset: 15.0 )
        usernameField.autoPinEdgeToSuperviewEdge( ALEdge.Right, withInset: 15.0 )
        usernameField.autoSetDimension( ALDimension.Height, toSize: 40.0 )
        
        passwordField = RBTextField()
        passwordField.font = RBConstants.primaryFont( 18.0 )
        passwordField.placeholder = "Password"
        passwordField.textColor = UIColor.blackColor()
        passwordField.backgroundColor = UIColor.whiteColor()
        formBackgroundView.addSubview( passwordField )
        passwordField.autoPinEdge( ALEdge.Top, toEdge: ALEdge.Bottom, ofView: usernameField, withOffset: 10.0 )
        passwordField.autoPinEdge( ALEdge.Left, toEdge: ALEdge.Left, ofView: usernameField )
        passwordField.autoPinEdge( ALEdge.Right, toEdge: ALEdge.Right, ofView: usernameField )
        passwordField.autoMatchDimension( ALDimension.Height, toDimension: ALDimension.Height, ofView: usernameField )
        
        loginButton = UIButton.buttonWithType( UIButtonType.Custom ) as UIButton
        loginButton.setTitle( "Submit", forState: UIControlState.Normal )
        loginButton.titleLabel?.font = RBConstants.primaryFont( 20.0 )
        loginButton.setTitleColor( UIColor.whiteColor(), forState: UIControlState.Normal )
        loginButton.backgroundColor = UIColor.grayColor()
        loginButton.sizeToFit()
        formBackgroundView.addSubview( loginButton )
        loginButton.autoPinEdge( ALEdge.Top, toEdge: ALEdge.Bottom, ofView: passwordField, withOffset: 20 )
        loginButton.autoPinEdgeToSuperviewEdge( ALEdge.Bottom, withInset: 20.0 )
        loginButton.autoPinEdge( ALEdge.Left, toEdge: ALEdge.Left, ofView: passwordField )
        loginButton.autoPinEdge( ALEdge.Right, toEdge: ALEdge.Right, ofView: passwordField )
        
        nameLabel.alpha = 0
        view.addSubview( nameLabel )
        nameLabel.autoSetDimensionsToSize( nameLabel.frame.size )
        nameLabel.autoAlignAxisToSuperviewAxis( ALAxis.Vertical )
        
        formBackgroundView.alpha = 0
        view.addSubview( formBackgroundView )
        formBackgroundView.autoMatchDimension( ALDimension.Height, toDimension: ALDimension.Height, ofView: robotImageView )
        formBackgroundView.autoCenterInSuperview()
        formBackgroundView.autoMatchDimension( ALDimension.Width, toDimension: ALDimension.Width, ofView: nameLabel, withMultiplier: 1.50 )
        
         nameLabel.autoPinEdge( ALEdge.Bottom, toEdge: ALEdge.Top, ofView: formBackgroundView, withOffset: -10.0 )
    }
    
    private func setupLoginLayout()
    {
        robotImageView.removeFromSuperview()
        view.addSubview( robotImageView )
        
        robotImageView.autoPinEdge( ALEdge.Right, toEdge: ALEdge.Left, ofView: formBackgroundView, withOffset: -20.0 )
        robotImageView.autoPinEdge( ALEdge.Top, toEdge: ALEdge.Top, ofView: formBackgroundView )
        
        nameLabel.alpha = 1
        formBackgroundView.alpha = 1
    }
}