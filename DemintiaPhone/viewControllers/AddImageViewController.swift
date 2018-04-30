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
    @IBOutlet weak var submitBtn: UIBarButtonItem!
    
    // image picker
    private var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        submitBtn.isEnabled = false
        
        // ui
        
        addImageButton.layer.cornerRadius = CORNER_RADIUS*3
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
    
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        
        
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
        
        
        dismiss(animated: true, completion: { () -> Void in
            self.collectionView?.reloadData()
        })
        
    }
    
    @IBAction func fieldDidFinishEditing(_ sender: Any) {
        
        enableSubmitBtn()
        
    }
    
    
    // image picker delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: {
            self.enableSubmitBtn()
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // helper funcrtions
    
    func enableSubmitBtn(){
        
    // check if all is filled
        
        if let _ = nameField.text, let _ = nameField.text, let _ = yearField.text, let _ = imageView.image
        {
            submitBtn.isEnabled = true
            
        }
        
    }
    
    
    
}

