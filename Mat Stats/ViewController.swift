//
//  ViewController.swift
//  Mat Stats
//
//  Created by SAMUEL WOJCIK and CATHY WOJCIK on 12/6/16.
//  Copyright © 2016 Sam and Cathy Wojcik. All rights reserved.ved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITextFieldDelegate
{

    var strat1 = stat()
     var emailName:String = ""
    var refStat: DatabaseReference!
    
//func childByAutoID() -> FIRDatabaseReference {
//    return refStat
// }
    
    @IBOutlet weak var WinsLabel: UILabel!
    @IBOutlet weak var TechsLabel: UILabel!
    @IBOutlet weak var PinsLabel: UILabel!
    @IBOutlet weak var LosesLabel: UILabel!

    
    @IBOutlet weak var losesNumber: UILabel!
    @IBOutlet weak var pinNumber: UILabel!
    @IBOutlet weak var techNumber: UILabel!
    @IBOutlet weak var winNumber: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        WinsLabel!.delegate = self
//        TechsLabel!.delegate = self
//        PinsLabel!.delegate = self
//        LosesLabel!.delegate = self
        
        refStat = Database.database().reference()
        
       
    
    }
    
    @IBAction func winStepper(_ sender: UIStepper)
    {
        winNumber.text = String(sender.value)
     self.winNumber.text = Int(sender.value).description
      
    }
    
    @IBAction func losesStepper(_ sender: UIStepper)
    {
        losesNumber.text = String(sender.value)
        self.losesNumber.text = Int(sender.value).description
    }
    
    @IBAction func techStepper(_ sender: UIStepper)
    {
        techNumber.text = String(sender.value)
        self.techNumber.text = Int(sender.value).description
    }
    
    @IBAction func pinStepper(_ sender: UIStepper)
    {
        pinNumber.text = String(sender.value)
        self.pinNumber.text = Int(sender.value).description
    }
    
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
       let dvc = segue.destination as! totalStatsViewController
        
        let finalWinNumber = Int(winNumber.text!)
        let finalLosesNumber = Int(losesNumber.text!)
        let finalPinNumber = Int(pinNumber.text!)
        let finalTechNumber = Int(techNumber.text!)
        
        strat1.wins = finalWinNumber!
        strat1.loses = finalLosesNumber!
        strat1.pins = finalPinNumber!
        strat1.techs = finalTechNumber!
      
        dvc.stats2 = strat1
        
        let wins: String = winNumber.text!
        let losses:String = losesNumber.text!
        let tech: String = techNumber.text!
        let pins: String = pinNumber.text!
        let email: String = emailName
    //childByAutoID()
        
        //self.refStat.child("Wrestlers").setValue(["Total Wins":wins, "Total Losses": losses,"Total Techs":tech, "Total Pins": pins])
        refStat.child("Wrestler").childByAutoId().setValue(["Email": emailName,"Total Wins": wins, "Total Losses": losses, "Total Techs":tech, "Total Pins":pins])
    }
    
    
    

}

