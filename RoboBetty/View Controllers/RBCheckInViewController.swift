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
    @IBOutlet weak var centerBackground: UIView!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var checkinView: UIView!
    @IBOutlet weak var nameField: RBTextField!
    @IBOutlet weak var emailField: RBTextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var verticalCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var formViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var checkinConstraint: NSLayoutConstraint!
    
    private var keyboardVisible = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        checkInButton.backgroundColor = UIColor.grayColor()
        checkInButton.layer.borderColor = UIColor.whiteColor().CGColor
        checkInButton.layer.borderWidth = 1
        
        nextButton.backgroundColor = UIColor.grayColor()
        nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextButton.layer.borderWidth = 1
        
        cancelButton.backgroundColor = UIColor.redColor()
        cancelButton.layer.borderColor = UIColor.whiteColor().CGColor
        cancelButton.layer.borderWidth = 1
        
        formView.hidden = true
    }
    
    override func viewWillAppear( animated: Bool )
    {
        super.viewWillAppear( animated )
        
        if ( self.navigationController as? RBNavigationController )?.isProgressBarVisible() == true
        {
            ( self.navigationController as? RBNavigationController )?.progressBar.setCurrentStep( 1, animated: true )
        }
        
        NSNotificationCenter.defaultCenter().addObserver( self, selector: "didReceiveKeyboardNotification:", name: UIKeyboardWillHideNotification, object: nil )
        NSNotificationCenter.defaultCenter().addObserver( self, selector: "didReceiveKeyboardNotification:", name: UIKeyboardWillShowNotification, object: nil )
    }
    
    override func viewWillDisappear( animated: Bool )
    {
        super.viewWillDisappear( animated )
        NSNotificationCenter.defaultCenter().removeObserver( self )
    }

    override func touchesBegan( touches: NSSet, withEvent event: UIEvent )
    {
        super.touchesBegan( touches, withEvent: event )
        view.endEditing(true)
    }
    
    @objc func didReceiveKeyboardNotification( notification: NSNotification )
    {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = ( info[UIKeyboardFrameEndUserInfoKey] as NSValue ).CGRectValue()
        let duration = info[UIKeyboardAnimationDurationUserInfoKey] as Double
        let curve = info[UIKeyboardAnimationCurveUserInfoKey] as UInt
        let options = UIViewAnimationOptions( curve << 16 )
        
        if notification.name == UIKeyboardWillShowNotification
        {
            let keyboardY = keyboardFrame.origin.y
            let difference = ( centerBackground.frame.origin.y + centerBackground.frame.size.height ) - keyboardY
            
            verticalCenterConstraint.constant = difference + 20
            ( self.navigationController as? RBNavigationController )?.hideProgressBar( true )
            
            keyboardVisible = true
        }
        else
        {
            verticalCenterConstraint.constant = 20
            ( self.navigationController as? RBNavigationController )?.showProgressBar( true )
            
            keyboardVisible = false
        }
        
        UIView.animateWithDuration( duration, delay: 0, options: options, animations:
        {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        },
        completion: nil )
    }
    
    @IBAction func checkInButtonPressed()
    {
        ( self.navigationController as? RBNavigationController )?.showProgressBar( true )
        ( self.navigationController as? RBNavigationController )?.progressBar.setCurrentStep( 1, animated: true )
        showForm()
    }
    
    private func showCheckin()
    {
        checkinView.hidden = false
        removeFormAndCheckinConstraints()
        
        formViewConstraint = formView.autoPinEdge( ALEdge.Left, toEdge: ALEdge.Right, ofView: view )
        checkinConstraint = checkinView.autoAlignAxisToSuperviewAxis( ALAxis.Vertical )
        
        UIView.animateWithDuration( 0.3, animations:
        {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        },
        completion:
        {
            finished in
            
            self.formView.hidden = true
        })
    }
    
    private func showForm()
    {
        formView.hidden = false
        removeFormAndCheckinConstraints()
        
        formViewConstraint = formView.autoAlignAxisToSuperviewAxis( ALAxis.Vertical )
        checkinConstraint = checkinView.autoPinEdge( ALEdge.Right, toEdge: ALEdge.Left, ofView: view )
        
        UIView.animateWithDuration( 0.3, animations:
        {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        },
        completion:
        {
            finished in
            
            self.checkinView.hidden = true

            let nameField = self.nameField
            self.performAfterDelay( 0.4, block:
            {
                let open = nameField.becomeFirstResponder()
            })
        })
    }
    
    func performAfterDelay( delay: Double, block: () -> () )
    {
        var dispatchTime: dispatch_time_t = dispatch_time( DISPATCH_TIME_NOW, Int64( delay * Double( NSEC_PER_SEC ) ) )
        dispatch_after( dispatchTime, dispatch_get_main_queue(),
        {
            block()
        })
    }
    
    private func removeFormAndCheckinConstraints()
    {
        if formViewConstraint != nil
        {
            view.removeConstraint( formViewConstraint )
        }
        
        if checkinConstraint != nil
        {
            view.removeConstraint( checkinConstraint )
        }
    }
    
    @IBAction func cancelButtonPressed()
    {
        let duration = keyboardVisible == true ? 0.3 : 0.0

        view.endEditing( true )
        
        performAfterDelay( duration, block:
        {
            ( self.navigationController as? RBNavigationController )?.hideProgressBar( true )
            ( self.navigationController as? RBNavigationController )?.progressBar.setCurrentStep( 0, animated: true )
            self.showCheckin()
        })
    }
    
    override func prepareForSegue( segue: UIStoryboardSegue, sender: AnyObject? )
    {
        if segue.identifier == "thankYou"
        {
            let dest = segue.destinationViewController as RBThankYouViewController
            dest.previous = "No Appointment"
        }
    }
    
    @IBAction func noAppointmentButtonPressed()
    {
        performSegueWithIdentifier( "thankYou", sender: nil )
    }
    
    @IBAction func nextButtonPressed()
    {
        let duration = keyboardVisible == true ? 0.3 : 0.0

        view.endEditing( true )
        
        performAfterDelay( duration, block:
        {
            let userInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier( "confirmUser" ) as UIViewController
            self.navigationController?.pushViewController( userInfoViewController, animated: true )
        })
    }
}