//
//  Contact.swift
//  DemintiaPhone
//
//  Created by Omar on 08/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    
    var name:String?
    var phone:String?
    var imagesURL:[String]
    
    init(name:String,phone:String,imagesURL:[String]) {
        self.name = name
        self.phone = phone
        self.imagesURL = imagesURL
    }
    
    
}
