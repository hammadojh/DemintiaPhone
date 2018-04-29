//
//  AddImageViewController.swift
//  DemintiaPhone
//
//  Created by Victoria Everts on 4/23/18.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

import UIKit


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    var imagePicker = UIImagePickerController()
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
<<<<<<< HEAD
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
=======
    @IBAction func submitClicked(_ sender: Any) {
        
        print(contactsImages.count)
        
        // get information
        
        let name = nameField.text!
        let phone = numberField.text!
        
        let imageName = nameField.text! + "_1"
        let image = store(image: imageName, imageFile: imageView.image!)
                
        let contactImages = [ContactImage(imageURL: image.1.absoluteString, date: yearField.text!)]
        
        // add new contact to the array
        
        let contact = Contact(name: name, phone: phone, contactImages: contactImages)
        contacts.append(contact)
        contactsImages.append((contact,contactImages[0]))
        
        
        // dismiss the modal
        
        print(contactsImages.count)
        
        dismiss(animated: true, completion: { () -> Void in
            self.collectionView?.reloadData()
>>>>>>> parent of d86eef2... Add image to contact works
        })
        
        imageView.image = image
    }
}
