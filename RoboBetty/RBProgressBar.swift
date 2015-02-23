//
//  RBProgressBarViewController.swift
//  RoboBetty
//
//  Created by Brian Chin on 2/22/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

var progressBar: RBProgressBar = RBProgressBar()

class RBProgressBar: NSObject {
    var outerProgressBar = UILabel(frame: CGRectMake(240, 120, 550, 30))
    var innerProgressBar:UILabel!
    var progressBarLabel = UILabel(frame: CGRectMake(240, 83, 400, 40))
    let numSteps = 6
    var currStep = 0
    
    func initBars(){
        var barArray = Array<UILabel>()
        let incAmount = 550/numSteps
        var temp = 0
        
        for(var i=0; i<numSteps-1; i++){
            var tempLabel = UILabel(frame: CGRectMake(CGFloat(temp+incAmount), 0, 3, 30))
            tempLabel.backgroundColor = UIColor.redColor()
            barArray.append(tempLabel)
            temp += incAmount
        }
        
        outerProgressBar.backgroundColor = UIColor.lightGrayColor()
        outerProgressBar.layer.masksToBounds = true
        outerProgressBar.layer.cornerRadius = 10.0
        
        innerProgressBar = initInnerBar(currStep)
        innerProgressBar.backgroundColor = UIColor.greenColor()
        innerProgressBar.layer.masksToBounds = true
        innerProgressBar.layer.cornerRadius = 10.0
        
        outerProgressBar.addSubview(innerProgressBar)
        for(var i=0; i<barArray.count; i++){
            outerProgressBar.addSubview(barArray[i])
        }
        
        progressBarLabel.text = "Your Checkin Completion:"
    }
    
    func initInnerBar(step:Int) -> UILabel{
        let incAmount = 550/numSteps
        var tempInnerProgressBar = UILabel(frame: CGRectMake(2, 3, CGFloat(incAmount * (step+1)), 24))
        return tempInnerProgressBar
    }
}
