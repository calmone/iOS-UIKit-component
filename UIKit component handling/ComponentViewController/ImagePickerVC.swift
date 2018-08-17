//
//  ImagePickerVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 17..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ImagePickerVC: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var selectedImageView: UIImageView!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            // Instantiation
            imagePicker = UIImagePickerController()
            
            // Delegate setting
            imagePicker.delegate = self
            
            // Image acquisition destination is Photo Library
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            // Disable editing after image acquisition
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        selectedImageView = UIImageView(frame: self.view.bounds)
        selectedImageView.contentMode = UIViewContentMode.scaleAspectFit
        self.view.addSubview(selectedImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // It is called when an image is selected.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Acquire the selected image.
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImageView.image = pickedImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // It is called when image selection is canceled.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Close the modal view
        self.dismiss(animated: true, completion: nil)
    }

}
