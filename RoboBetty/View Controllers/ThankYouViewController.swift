//
//  ThankYouViewController.swift
//  RoboBetty
//
//  Created by Brian Fong on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController
{
    @IBOutlet var okButton: UIButton!
    @IBOutlet var pic: UIImageView!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var background: UIImageView!
    
    var previous:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        okButton.backgroundColor = UIColor.grayColor()
        okButton.layer.borderColor = UIColor.whiteColor().CGColor
        okButton.layer.borderWidth = 1
        pic.image = UIImage(named: "gold-wreath-md.png")
        
        if(previous == "No Appointment"){
            topLabel.text = "Please wait, someone will be with you shortly."
            bottomLabel.hidden = false
        }
        else{
            bottomLabel.hidden = true
        }
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        progressBar.currStep = progressBar.numSteps
        progressBar.defaultPosition()
        progressBar.initBars()
        self.background.addSubview(progressBar.outerProgressBar)
        self.background.addSubview(progressBar.progressBarLabel)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        progressBar.currStep = 0
        progressBar.defaultPosition()
    }
}