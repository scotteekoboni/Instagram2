//
//  ComposeViewController.swift
//  Instagram2
//
//  Created by Scott Guidoboni on 2/5/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var post: Post?
    @IBOutlet weak var composeImageView: UIImageView!
    
    @IBOutlet weak var composeCaptionField: UITextView!
    
    @IBAction func postButton(_ sender: Any) {
        Post.postUserImage(image: self.composeImageView!.image, withCaption: composeCaptionField!.text, withCompletion: { (complete, error) in
            self.dismiss(animated: true, completion: nil)
           
        })
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        //vc.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(vc, animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //var post: Post! {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        
        var originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        var editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.composeImageView!.image = editedImage
        
        
        //ComposeViewController.composeCaptionField!.text
        //composeImageView.UIImage = editedImage
        
        // Do something with the images (based on your use case)
        
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
        
        
        
        
        
        
        
        
        
        
        
        //   }
        
        
        
        
        
        
        
        
        
        //        self.composeCaptionField.text = "Kreason"
        //        let imagePicker = UIImagePickerController()
        //        imagePicker.delegate = self
        //        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //        imagePicker.allowsEditing = false
        //        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
}
