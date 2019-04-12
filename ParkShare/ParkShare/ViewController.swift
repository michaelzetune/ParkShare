//
//  ViewController.swift
//  ParkShare
//
//  Created by Michael Zetune on 4/7/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func searchListingButton(_ sender: Any) {
        tabBarController?.selectedIndex = 0
        //self.performSegue(withIdentifier: "gotoListings", sender: self)
    }
    
    
    
    @IBAction func postListingButton(_ sender: Any) {
        tabBarController?.selectedIndex = 1
        //self.performSegue(withIdentifier: "gotoPostings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

