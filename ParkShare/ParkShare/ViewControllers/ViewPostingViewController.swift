//
//  ViewPostingViewController.swift
//  ParkShare
//
//  Created by Jonathan Bautista on 4/8/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit
import MessageUI
import Parse

class ViewPostingViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    

    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var posttitleLabel: UILabel!
    @IBOutlet weak var postinfoLabel: UILabel!
    @IBOutlet weak var locationpictureImage: UIImageView!
    @IBOutlet weak var profilepicImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    

    var pickedPost: PFObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let query = PFQuery(className: "Post")
        query.includeKeys(["author", "title", "parkingImage", "description"])
        
        
            
        let user = pickedPost!["author"] as! PFUser
        posttitleLabel!.text = pickedPost!["title"] as? String
        postinfoLabel!.text = pickedPost!["description"] as? String
        userLabel!.text = user["name"] as? String
        
        if let profilePicFile = user["profilePicture"] as? PFFileObject {
            let profilePicUrlString = profilePicFile.url!
            let profilePicUrl = URL(string: profilePicUrlString)!
            profilepicImage.af_setImage(withURL: profilePicUrl)
        } else {
            profilepicImage.image = UIImage(named: "default-avatar")
        }
        
        if let parkingImageFile = pickedPost!["parkingImage"] as? PFFileObject {
            let parkingImageUrlString = parkingImageFile.url!
            let parkingImageUrl = URL(string: parkingImageUrlString)!
            locationpictureImage.af_setImage(withURL: parkingImageUrl)
        } else {
            // do nothing, we can leave the pic blank for now.
        }
        
        
        
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
