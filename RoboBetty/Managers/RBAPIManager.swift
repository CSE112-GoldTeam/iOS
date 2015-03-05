//
//  RBAPIManager.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/10/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

public let RBAPILoggedInNotificationKey  = "RoboBetty Logged In"
public let RBAPILoggedOutNotificationKey = "RoboBetty Logged Out"

private let SharedManager = RBAPIManager()

import Foundation
import Alamofire

class RBAPIManager
{
    private var accessToken: String?
    
    class var manager: RBAPIManager
    {
        return SharedManager
    }
    
    init()
    {
        accessToken = NSUserDefaults.standardUserDefaults().objectForKey( "token" ) as? String
    }
    
    func isLoggedIn() -> Bool
    {
        return accessToken != nil
    }
    
    func login( username: String!, password: String! )
    {
        accessToken = "temp"
        NSNotificationCenter.defaultCenter().postNotificationName( RBAPILoggedInNotificationKey, object: nil )
    }
    
    func logout()
    {
        accessToken = nil
    }
}