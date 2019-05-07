//
//  PostViewController.swift
//  ParkShare
//
//  Created by Jonathan Bautista on 4/8/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//
import Parse
import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var PriceField: UITextField!
    @IBOutlet weak var typeCovering: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PostViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pictureButtonPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else{
            picker.sourceType = .photoLibrary
        }
        present(picker, animated:true, completion: nil)
    }
    
    @IBAction func createListingButtonPressed(_ sender: Any) {
        let post = PFObject(className: "Post")
        post["author"] = PFUser.current()!
        post["title"] = titleField.text
        post["description"] = descriptionTextView.text
        post["monthlyPrice"] = Int(PriceField.text!)
        post["parkingType"] = typeCovering.titleForSegment(at: typeCovering.selectedSegmentIndex)
        post["phoneNumber"] = Int(phoneNumber.text!)
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["parkingImage"] = file
        
            post.saveInBackground { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("saved!")
                } else {
                    print("error!")
                }
        }
        performSegue(withIdentifier: "postToFeed", sender: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
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
