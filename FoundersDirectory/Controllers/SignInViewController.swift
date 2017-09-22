//
//  SignInViewController.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/21/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().clientID = "471967146678-dtioqbk6ljjtv3618n0dokt56ut231df.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        // GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
