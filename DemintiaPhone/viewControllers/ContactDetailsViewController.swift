//
//  ContactDetailsViewController.swift
//  DemintiaPhone
//
//  Created by Omar on 22/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit
import MessageUI

class ContactDetailsViewController: UIViewController, MFMessageComposeViewControllerDelegate{
    
    //model
    var contactImage:(Contact,ContactImage)?
    
    //outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imgButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageDateLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var callMeBtn: UIButton!
    @IBOutlet weak var sharedLinkBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = UIImage(named: (contactImage?.1.imageURL)!){
            imageView.image = imageURL
        }else{
            imageView.image = loadImage(imageUrl: (contactImage?.1.imageURL)!)
        }
        
        nameLabel.text = contactImage?.0.name
        imageDateLabel.text = contactImage?.1.date
        
        // btns ui
        callButton.layer.cornerRadius = CORNER_RADIUS
        callMeBtn.layer.cornerRadius = CORNER_RADIUS
        sharedLinkBtn.layer.cornerRadius = CORNER_RADIUS*5
        
    }
    
    // Call
    
    @IBAction func callButtonClicked(_ sender: Any) {
        
        // call
        
        let phone = "TEL://"+(contactImage?.0.phone)!
        let url: NSURL = URL(string: phone)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    }
    
    
    @IBAction func callMeBtnClicked(_ sender: Any) {
        
    
        if MFMessageComposeViewController.canSendText(){
            let controller = MFMessageComposeViewController()
            
            if let date = contactImage?.1.date, let name = contactImage?.0.name {
                controller.body = "Hello..please call me ..  I recognize you from \(date) .. and after the call please send any relevent information to this link https://drive.google.com/open?id=1IRR6KMFTOomqUqkge4XITXGcXhSreW6U. Thank you  \(name)"
            }
            
        
            controller.recipients = ["7206063096"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: false, completion: nil)
        }
        
    }
    
    // clicking on the image
    
    @IBAction func imgClicked(_ sender: Any) {
        performSegue(withIdentifier: "showImagesHistory", sender: sender)
    }
    
    
    @IBAction func linkClicked(_ sender: Any) {
        
        let url: NSURL = URL(string: "https://drive.google.com/open?id=1IRR6KMFTOomqUqkge4XITXGcXhSreW6U")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MFMSG
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! ImagesHistoryTableViewController
        nextScreen.contact = contactImage?.0
    }
    
}
