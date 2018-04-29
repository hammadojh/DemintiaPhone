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

class ImagesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showContactSeg" {
            if let indexPath = self.collectionView?.indexPath(for: sender as! ImageViewCell){
                let nextScreen = segue.destination as? ContactDetailsViewController
                nextScreen?.contactImage = contactsImages[indexPath.item]
            }
        }else{
            let nextScreen = segue.destination as? AddImageViewController
            nextScreen?.collectionView = self.collectionView
        }
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactsImages.count+1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.item == contactsImages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addContactCell", for: indexPath)
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor(red:0.65, green:0.56, blue:0.92, alpha:1.0).cgColor
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageViewCell
            cell.backgroundColor = UIColor.black
            
            if let image = UIImage(named: contactsImages[indexPath.item].1.imageURL!){
                cell.image.image = image
            }else{
                let imageUrl = contactsImages[indexPath.item].1.imageURL
                if let image =  loadImage(imageUrl: imageUrl!) {
                    cell.image.image = image
                }
            }
            
            return cell
        }
        
        // Configure the cell
    
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == contactsImages.count {
            performSegue(withIdentifier: "addContactSeg", sender: self.collectionView?.cellForItem(at: indexPath))
        }else{
            performSegue(withIdentifier: "showContactSeg", sender: self.collectionView?.cellForItem(at: indexPath))
        }
        
        
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
