//
//  FeedFilterViewController.swift
//  ParkShare
//
//  Created by Michael Zetune on 4/22/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit

protocol FilterDelegate : NSObjectProtocol{
    func changeMaxCostValue(newValue: Int!)
}

class FeedFilterViewController: UIViewController {

    @IBOutlet weak var costFilterLabel: UILabel!
    @IBOutlet weak var costFilterSlider: UISlider!
    
    weak var delegate : FilterDelegate?
    var currentCostValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        costFilterSlider.value = Float(currentCostValue)
        costFilterLabel.text = "Max Price: $\(currentCostValue)"
    }
    
    
    @IBAction func costFilterSliderChanged(_ sender: UISlider) {
        currentCostValue = Int(sender.value)
        costFilterLabel.text = "Max Price: $\(currentCostValue)"
        if let delegate = delegate {
            delegate.changeMaxCostValue(newValue: currentCostValue)
        }
    }

    
    // MARK: - Navigation

}
