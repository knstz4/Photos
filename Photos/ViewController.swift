//
//  ViewController.swift
//  Photos
//
//  Created by Kartik Sharma on 10/18/19.
//  Copyright © 2019 Kartik Sharma. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBAction func cameraButton(_ sender: Any) {
        openCamera()
    }
    @IBAction func organizeButton(_ sender: Any) {
        openPhotoLibrary()
    }
    
    
    let imagePicker = UIImagePickerController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func openCamera() {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("This device does not support camera.")
            return
        }
        
        
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    func openPhotoLibrary() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("Cannot open photo library.")
            return
        }
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        imageView.image = image
    }
    



}

