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
    
    //contacts table view
    var collectionView:UICollectionView?
    
<<<<<<< HEAD
    
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
=======
    // outlets
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    // image picker
    private var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
>>>>>>> bea252d865e33b5cda2f517d31db4bb9d58296ad
    
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
            
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            imagePicker.modalPresentationStyle = .popover

            //show
            present(imagePicker, animated: true, completion: nil)
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
    
    @IBAction func submitClicked(_ sender: Any) {
        
        print(contactsImages.count)
        
        // get information
        
        let name = nameField.text!
        let phone = numberField.text!
        let imageName = nameField.text! + "_1"
        let image = store(image: imageName, imageFile: imageView.image!)
        
        // add new contact to the array
        
        let contactImages = [ContactImage(imageURL: image.1.absoluteString, date: yearField.text!)]
        let contact = Contact(name: name, phone: phone, contactImages: contactImages)
        contacts.append(contact)
        contactsImages.append((contact,contactImages[0]))
        
        // dismiss the modal
        
        print(contactsImages.count)
        
        dismiss(animated: true, completion: { () -> Void in
            self.collectionView?.reloadData()
        })
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    // image picker delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info.count)
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Data Structure
    /*private var contacts = [Contact]()
    private var contactsImages = [(Contact,ContactImage)]()
    
    contacts.append(Contact(name: "Jeff", phone: "3039288922", contactImages: [ContactImage(imageURL: "jeff_1", date: "1997"),ContactImage(imageURL: "jeff_2", date: "2010")]))*/
    
}

