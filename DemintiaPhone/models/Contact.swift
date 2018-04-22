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
    var contactImages:[ContactImage]
    
    init(name:String,phone:String,contactImages:[ContactImage]) {
        self.name = name
        self.phone = phone
        self.contactImages = contactImages
    }
    
}
