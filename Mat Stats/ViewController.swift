//
//  ViewController.swift
//  Mat Stats
//
//  Created by SAMUEL WOJCIK on 12/6/16.
//  Copyright © 2016 Sandburg. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITextFieldDelegate
{

    var strat1 = stat()
    
    var refName: FIRDatabaseReference!
    
    @IBOutlet weak var WinsLabel: UITextField!
    @IBOutlet weak var TechsLabel: UITextField!
    @IBOutlet weak var PinsLabel: UITextField!
    @IBOutlet weak var LosesLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WinsLabel.delegate = self
        TechsLabel.delegate = self
        PinsLabel.delegate = self
        LosesLabel.delegate = self
        
        refName = FIRDatabase.database().reference()
    
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       let dvc = segue.destinationViewController as! totalStatsViewController
        strat1.wins = Int(WinsLabel.text!)!
        strat1.loses = Int(LosesLabel.text!)!
        strat1.pins = Int(PinsLabel.text!)!
        strat1.techs = Int(TechsLabel.text!)!
        dvc.stats2 = strat1
        
        let wins: String = WinsLabel.text!
        let losses:String = LosesLabel.text!
        let tech: String = TechsLabel.text!
        let pins: String = PinsLabel.text!
        
        self.refName.child("Wrestler").setValue(["Total Wins":wins, "Total Losses": losses,"Total Techs":tech, "Total Pins": pins])
    }
}

