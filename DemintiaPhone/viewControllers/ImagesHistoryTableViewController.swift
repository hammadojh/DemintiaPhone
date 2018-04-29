//
//  ImagesHistoryTableViewController.swift
//  DemintiaPhone
//
//  Created by Omar on 22/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ImagesHistoryTableViewController: UITableViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var contact : Contact!
    
    private var imagePicker = UIImagePickerController()

    
    // image picker delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info.count)
        
        var url:String?
        var date:String?
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            // store image and get url
            
            let imageName = contact.name! + "_\(contact.contactImages.count)"
            url = store(image: imageName, imageFile: pickedImage).1.absoluteString
            
            
        }
        
        dismiss(animated: true, completion: { (() -> Void).self
            
            // prompt for date
            
            self.showAlert(title: "Enter Date", message: "Enter the date of the image", completion: { textField in (()->Void).self
                
                // get date value
                
                date = textField.text!
                
                // add image and date to array
                
                let newContactImage = ContactImage(imageURL: url!, date: date!)
                self.contact.contactImages.append(newContactImage)
                contactsImages.append((self.contact,newContactImage))
                self.tableView.reloadData()
                
            })
            
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 150
        imagePicker.delegate = self


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contact.contactImages.count+1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == contact.contactImages.count{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "addImageCell")
            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageDetailsCell", for: indexPath) as! ImageDetailsTableViewCell
            
            // Configure the cell...
            if let image = UIImage(named: contact.contactImages[indexPath.item].imageURL!) {
                cell.imageView?.image = image
            }else{
                cell.imageView?.image = loadImage(imageUrl: (contact.contactImages[indexPath.item].imageURL)!)
            }
            
            cell.dateLabel?.text = contact.contactImages[indexPath.item].date!
            
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == contact.contactImages.count{
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                imagePicker.modalPresentationStyle = .popover
                
                //show
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // helper functions
    
    func showAlert(title:String, message:String, completion:@escaping ((_ textField:UITextField)->Void)){
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: nil)
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            completion(textField!)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
}
