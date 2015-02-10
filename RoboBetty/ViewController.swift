//
//  ViewController.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/2/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var checkInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        checkInButton.layer.borderColor = UIColor.whiteColor().CGColor
        checkInButton.layer.cornerRadius = 5
        checkInButton.layer.borderWidth = 1
        // Do any additional setup after loading the view, typically from a nib
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

