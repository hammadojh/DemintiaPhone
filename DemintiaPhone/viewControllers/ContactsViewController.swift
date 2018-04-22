//
//  ImagesController.swift
//  DemintiaPhone
//
//  Created by Omar on 08/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
fileprivate let itemsPerRow: CGFloat = 2
fileprivate let numberOfImagesToShow = 2 // the max number of images to show for each person
fileprivate var currentImageIndex = 0 // the index of the current image to show

// Data Structure
private var contacts = [Contact]()
private var contactsImages = [(Contact,ContactImage)]()

class ImagesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // read contacts
        
        contacts.append(Contact(name: "Ali", phone: "3033123112", contactImages: [ContactImage(imageURL: "moh_1", date: "1997"),ContactImage(imageURL: "moh_2", date: "2010")]))
            
        contacts.append(Contact(name: "Tom", phone: "3039287382", contactImages: [ContactImage(imageURL: "tom_1", date: "1997"),ContactImage(imageURL: "tom_2", date: "2010")]))
        
        contacts.append(Contact(name: "Obama", phone: "3039284324", contactImages: [ContactImage(imageURL: "obama_1", date: "1997"),ContactImage(imageURL: "obama_2", date: "2010")]))
        
        contacts.append(Contact(name: "Jeff", phone: "3039288922", contactImages: [ContactImage(imageURL: "jeff_1", date: "1997"),ContactImage(imageURL: "jeff_2", date: "2010")]))
        
        // initialzie contactsImages
        for contact in contacts {
            for image in contact.contactImages {
                contactsImages.append((contact,image))
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.collectionView?.indexPath(for: sender as! ImageViewCell){
            let nextScreen = segue.destination as? ContactDetailsViewController
            nextScreen?.contactImage = contactsImages[indexPath.item]
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactsImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageViewCell
        
        cell.backgroundColor = UIColor.black
        if let image = UIImage(named: contactsImages[indexPath.item].1.imageURL!){
            cell.image.image = image
        }
        
        
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showContactSeg", sender: self.collectionView?.cellForItem(at: indexPath))
        
    }

    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
