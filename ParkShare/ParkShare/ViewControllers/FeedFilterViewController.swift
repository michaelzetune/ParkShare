//
//  FeedFilterViewController.swift
//  ParkShare
//
//  Created by Michael Zetune on 4/22/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit

class FeedFilterViewController: UIViewController {

    @IBOutlet weak var costFilterLabel: UILabel!
    @IBOutlet weak var costFilterSlider: UISlider!
    
    var currentCostValue: Int = Int.max
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        costFilterSlider.value = Float(currentCostValue)
        costFilterLabel.text = "Max Price: \(currentCostValue)"

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func costFilterSliderChanged(_ sender: UISlider) {
        currentCostValue = Int(sender.value)
        costFilterLabel.text = "Max Price: $\(currentCostValue)"
    }
    
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             currentCostValue = Int(costFilterSlider.value)
             let destinationFeedTableViewController = segue.destination as! FeedTableViewController
             destinationFeedTableViewController.currentMaxCostFilter = currentCostValue
     }

}
