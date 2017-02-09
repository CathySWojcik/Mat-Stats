//
//  totalStatsViewController.swift
//  Mat Stats
//
//  Created by Cathy Wojcik on 2/8/17.
//  Copyright © 2017 Sandburg. All rights reserved.
//

import UIKit

import Firebase

class totalStatsViewController: UIViewController {

    var stats2 = stat()
   
    
    @IBOutlet weak var recordTF: UITextField!
    @IBOutlet weak var techsTF: UITextField!
    @IBOutlet weak var pinsTF: UITextField!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordTF.text = "\(stats2.wins) - \(stats2.loses)"
        techsTF.text = "\(stats2.techs)"
        pinsTF.text = "\(stats2.pins)"
        
    
    }
    @IBAction func toWebsite(sender: AnyObject)
    {
          if let url = NSURL(string:"http://www.tinleyparkbulldogs.net/Default.aspx?tabid=479113")
          {
               UIApplication.sharedApplication().openURL(url)
          }
    }
}
