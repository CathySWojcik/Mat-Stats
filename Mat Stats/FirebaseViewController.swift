//
//  FirebaseViewController.swift
//  Mat Stats
//
//  Created by Cathy Wojcik on 12/19/16.
//  Copyright © 2016 Sandburg. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseViewController: UIViewController, UITextFieldDelegate
{
   var refName: FIRDatabaseReference!
    
    func childByAutoID() -> FIRDatabaseReference {
        return refName
    }
    
    
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        textFieldShouldReturn(passwordField)
        textFieldShouldReturn(emailField)
        
        refName = FIRDatabase.database().reference()
        
    }
  
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func handleCreateAccount(sender: AnyObject)
    {
        FIRAuth.auth()?.createUserWithEmail(emailField.text!, password: passwordField.text!, completion: { (user, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            else
            {
                print("User Created...")
            }
 
        })

    }
    
        @IBAction func handleSignIn(sender: UIButton)
        {
            FIRAuth.auth()?.createUserWithEmail(emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    print("User Logged In...")
                }
            
            })
        
           
            let name: String = emailField.text!
            self.refName.child("Wrestler").setValue(["Wrestlers Name":name])
            
            }
    }
