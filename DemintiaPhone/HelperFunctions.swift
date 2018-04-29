//
//  HelperFunctions.swift
//  DemintiaPhone
//
//  Created by Omar on 28/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation
import UIKit

// helper functions

public func loadImage(image imageName: String) -> (UIImage,URL) {
    // declare image location
    let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(imageName).png"
    let imageUrl: URL = URL(fileURLWithPath: imagePath)
    
    // check if the image is stored already
    if FileManager.default.fileExists(atPath: imagePath),
        let imageData: Data = try? Data(contentsOf: imageUrl),
        let image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
        return (image,imageUrl)
    }
    
    // return anything if image doesn't exist
    return (UIImage(),URL(fileURLWithPath: ""))
}

public func loadImage(imageUrl : String) -> UIImage {
    
    let url = URL(string: imageUrl)
    
    // check if the image is stored already
    if let imageData: Data = try? Data(contentsOf: url!),
        let image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
        return image
    }
    return UIImage(named: "")!
}

public func store(image imageName:String, imageFile:UIImage) -> (UIImage,URL){
    
    // declare image location
    let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(imageName).png"
    let imageUrl: URL = URL(fileURLWithPath: imagePath)
    
    // check if the image is stored already
    if FileManager.default.fileExists(atPath: imagePath),
        let imageData: Data = try? Data(contentsOf: imageUrl),
        let image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
        return (image,imageUrl)
    }
    
    // image has not been created yet: create it, store it, return it
    let newImage: UIImage = imageFile
    try? UIImagePNGRepresentation(newImage)?.write(to: imageUrl)
    return (newImage,imageUrl)
    
}
