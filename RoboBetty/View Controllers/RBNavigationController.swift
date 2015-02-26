//
//  RBNavigationController.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/24/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class RBNavigationController: UINavigationController, UINavigationControllerDelegate
{
    private(set) var backgroundImageView: UIImageView!
    private(set) var progressBar: RBProgressBar!
    private(set) var bettyLabel: UILabel!
    
    private var progressBarVisible = false
    
    var progressBarConstraint: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupViews()
        self.navigationBar.hidden = true;
        
        delegate = self
    }
    
    func isProgressBarVisible() -> Bool
    {
        return progressBarVisible
    }
    
    func showProgressBar( animated: Bool )
    {
        if progressBarConstraint != nil
        {
            view.removeConstraint( progressBarConstraint )
        }
        
        progressBarConstraint = progressBar.autoPinEdgeToSuperviewEdge( ALEdge.Top, withInset: 100 )
        
        let duration = animated ? 0.3 : 0.0
        
        UIView.animateWithDuration( duration, animations:
        {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        })
        
        progressBarVisible = true
    }
    
    func hideProgressBar( animated: Bool )
    {
        if progressBarConstraint != nil
        {
            view.removeConstraint( progressBarConstraint )
        }
        
        progressBarConstraint = progressBar.autoPinEdge( ALEdge.Bottom, toEdge: ALEdge.Top, ofView: view, withOffset: -10 )
        
        let duration = animated ? 0.3 : 0.0
        
        UIView.animateWithDuration( duration, animations:
        {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        })
        
        progressBarVisible = false
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        let manager = RBNavigationTransitionManager()
        manager.operation = operation
        return manager
    }
    
    private func setupViews()
    {
        backgroundImageView = UIImageView()
        backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        backgroundImageView.image = UIImage( named: "background" )
        view.insertSubview( backgroundImageView, atIndex: 0 )
        backgroundImageView.autoPinEdgesToSuperviewEdgesWithInsets( UIEdgeInsetsZero )
        
        bettyLabel = UILabel()
        bettyLabel.attributedText = RBConstants.logoStringWithSize( 30.0 )
        bettyLabel.textColor = UIColor.whiteColor()
        bettyLabel.sizeToFit()
        view.insertSubview( bettyLabel, aboveSubview: backgroundImageView )
        bettyLabel.autoPinToBottomLayoutGuideOfViewController( self, withInset: 5 )
        bettyLabel.autoSetDimensionsToSize( bettyLabel.frame.size )
        bettyLabel.autoPinEdgeToSuperviewEdge( ALEdge.Left, withInset: 10 )
        
        progressBar = RBProgressBar( numberOfSteps: 5 )
        progressBar.setProgressBarColor( UIColor( red: 0.11, green: 0.73, blue: 0.6, alpha: 1.0 ) )
        view.insertSubview( progressBar, aboveSubview: backgroundImageView )
        progressBar.autoAlignAxisToSuperviewAxis( ALAxis.Vertical )
        progressBarConstraint = progressBar.autoPinEdge( ALEdge.Bottom, toEdge: ALEdge.Top, ofView: view, withOffset: -10 )
        progressBar.autoSetDimension( ALDimension.Height, toSize: 25 )
        progressBar.autoSetDimension( ALDimension.Width, toSize: 600 )
        
        let completionLabel = UILabel()
        completionLabel.text = "Your checkin completion:"
        completionLabel.textColor = UIColor.whiteColor()
        completionLabel.font = RBConstants.primaryFont( 20.0 )
        completionLabel.sizeToFit()
        view.insertSubview( completionLabel, aboveSubview: progressBar )
        completionLabel.autoSetDimensionsToSize( completionLabel.frame.size )
        completionLabel.autoPinEdge( ALEdge.Left, toEdge: ALEdge.Left, ofView: progressBar )
        completionLabel.autoPinEdge( ALEdge.Bottom, toEdge: ALEdge.Top, ofView: progressBar, withOffset: -5.0 )
    }
}


class RBNavigationTransitionManager: NSObject, UIViewControllerAnimatedTransitioning
{
    var operation = UINavigationControllerOperation.Push
    
    func animateTransition( transitionContext: UIViewControllerContextTransitioning )
    {
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey( UITransitionContextFromViewKey )!
        let toView = transitionContext.viewForKey( UITransitionContextToViewKey )!
        
        var offScreenTo: CGAffineTransform
        var offScreenFrom: CGAffineTransform
        
        if operation == UINavigationControllerOperation.Push
        {
            offScreenTo = CGAffineTransformMakeTranslation( container.frame.width, 0 )
            offScreenFrom = CGAffineTransformMakeTranslation( -container.frame.width, 0 )
        }
        else
        {
            offScreenTo = CGAffineTransformMakeTranslation( -container.frame.width, 0 )
            offScreenFrom = CGAffineTransformMakeTranslation( container.frame.width, 0 )
        }
        
        toView.transform = offScreenTo
        
        container.addSubview( toView )
        container.addSubview( fromView )
        
        let duration = self.transitionDuration( transitionContext )
        let options = UIViewAnimationOptions.CurveEaseIn
        
        UIView.animateWithDuration( duration, delay: 0.0, options: options,
        animations:
        {
            fromView.transform = offScreenFrom
            toView.transform = CGAffineTransformIdentity
        },
        completion:
        {
            finished in
            transitionContext.completeTransition( true )
            fromView.transform = CGAffineTransformIdentity
        })
    }
    
    func transitionDuration( transitionContext: UIViewControllerContextTransitioning ) -> NSTimeInterval
    {
        return 0.3
    }
}