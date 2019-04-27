//
//  ViewPostingViewController.swift
//  ParkShare
//
//  Created by Jonathan Bautista on 4/8/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit
import MessageUI

class ViewPostingViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    

    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var posttitleLabel: UILabel!
    @IBOutlet weak var postinfoLabel: UILabel!
    @IBOutlet weak var locationpictureImage: UIImageView!
    @IBOutlet weak var profilepicImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        messageImage.isUserInteractionEnabled = true
        messageImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // same for call image and message image
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let alert = UIAlertController(title: "Message or Phone?", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Text Message", style: .default, handler: { action in
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = self
            
            // Configure the fields of the interface.
            composeVC.recipients = ["5121234567"]
            composeVC.body = "Test message"
            
            // Present the view controller modally.
            if MFMessageComposeViewController.canSendText() {
                self.present(composeVC, animated: true, completion: nil)
            } else {
                print("Can't send messages.")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Phone Call", style: .default, handler: { action in
            let number = URL(string: "tel://5121234567")
            UIApplication.shared.open(number!, options: [:], completionHandler: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
