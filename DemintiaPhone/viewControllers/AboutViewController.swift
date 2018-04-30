//
//  AboutViewController.swift
//  DementiaPhone
//
//  Created by Omar on 29/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var iconImageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        iconImageView.layer.cornerRadius = CORNER_RADIUS*3
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
