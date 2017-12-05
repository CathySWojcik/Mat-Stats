//
//  FirebaseViewController.swift
//  Mat Stats
//
//  Created by SAMUEL WOJCIK and CATHY WOJCIK on 12/6/16.
//  Copyright © 2016 Sam and Cathy Wojcik. All rights reserved..
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseDatabase
//import GoogleSignIn


class FirebaseViewController: UIViewController, UITextFieldDelegate
{
    var refName: DatabaseReference!
    
//    //func childByAutoID() -> FIRDatabaseReference {
//        return refName
//    }
    
    
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    var emailName:String = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        textFieldShouldReturn(passwordField)
        textFieldShouldReturn(emailField)
        
        refName = Database.database().reference()
        
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func handleCreateAccount(_ sender: AnyObject)
    {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            else
            {
                print("User Created...")
            }
 
        })

    }
    
        @IBAction func handleSignIn(_ sender: UIButton)
        {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    print("User Logged In...")
                }
                
                
            
            })
            func prepare(for segue: UIStoryboardSegue, sender: Any?)
            {
                let dvc = segue.destination as! ViewController
                dvc.emailName = emailField.text!
                //childByAutoID()
//            self.refName.child("Wrestler").setValue(["Wrestlers Name":emailName])
//        refName.child("Wrestlers").childByAutoId().setValue(["Wrestlers Name":emailName])
//        
            
            }
    }
}
