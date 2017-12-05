//
//  totalStatsViewController.swift
//  Mat Stats
//
//  Created by SAMUEL WOJCIK and CATHY WOJCIK on 12/6/16.
//  Copyright © 2016 Sam and Cathy Wojcik. All rights reserved.
//

import UIKit

import Firebase

class totalStatsViewController: UIViewController {

    var stats2 = stat()
   
    
//    @IBOutlet weak var recordTF: UITextField!
//    @IBOutlet weak var techsTF: UITextField!
//    @IBOutlet weak var pinsTF: UITextField!
//
    
    @IBOutlet weak var recordTotal: UILabel!
    
    @IBOutlet weak var recordTech: UILabel!
    
    @IBOutlet weak var recordPin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        recordTF.text = "\(stats2.wins) - \(stats2.loses)"
//        techsTF.text = "\(stats2.techs)"
//        pinsTF.text = "\(stats2.pins)"
        
        recordTotal.text = "\(stats2.wins) - \(stats2.loses)"
        recordTech.text = "\(stats2.techs)"
        recordPin.text = "\(stats2.pins)"
    }
    @IBAction func toWebsite(_ sender: AnyObject)
    {
          if let url = URL(string:"https://tpbulldogs.org/wrestling")
          {
//               UIApplication.shared.openURL(url)
//            //UIApplication.shared.open(url, options: [http://www.tinleyparkbulldogs.net/Default.aspx?tabid=479113:], completionHandler: nil)
//
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
          }
    }
}
