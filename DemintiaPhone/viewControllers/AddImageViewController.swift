//
//  AddImageViewController.swift
//  DemintiaPhone
//
//  Created by Victoria Everts on 4/23/18.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

import UIKit


class AddImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    @IBOutlet weak var contactYear: UITextField!
    //@IBOutlet weak var contactNumber: UITextField!
    //@IBOutlet weak var contactName: UITextField!
    //@IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    //@IBOutlet weak var chooseButton: UIButton!
    //@IBOutlet weak var addImage: UIButton!
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
    /*@IBAction func btnClicked(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func btnClicked(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }*/
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imageView.image = image
    }
    
    // Data Structure
    /*private var contacts = [Contact]()
    private var contactsImages = [(Contact,ContactImage)]()
    
    contacts.append(Contact(name: "Jeff", phone: "3039288922", contactImages: [ContactImage(imageURL: "jeff_1", date: "1997"),ContactImage(imageURL: "jeff_2", date: "2010")]))*/
    
}
