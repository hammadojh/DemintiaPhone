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
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            imagePicker.modalPresentationStyle = .popover

            //show
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
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
}

