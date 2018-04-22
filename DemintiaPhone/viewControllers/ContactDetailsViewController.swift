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
    
    
    var contactImage:(Contact,ContactImage)?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var imgButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = UIImage(named: (contactImage?.1.imageURL)!){
            imageView.image = imageURL
        }
    }
    
    // Call
    
    @IBAction func callButtonClicked(_ sender: Any) {
        
        // call
        
        let url: NSURL = URL(string: "TEL://7206063096")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler:{ (called:Bool) -> () in
            
            // message
            
            if called {
                if MFMessageComposeViewController.canSendText(){
                    let controller = MFMessageComposeViewController()
                    controller.body = "Hello..Dongyao is calling you from 2018/4/22"
                    controller.recipients = ["7206063096"]
                    controller.messageComposeDelegate = self
                    self.present(controller, animated: false, completion: nil)
                }else{
                    print("can not send text")
                }
            }
        })
        
        
        
    }
    
    // clicking on the image
    
    @IBAction func imgClicked(_ sender: Any) {
        performSegue(withIdentifier: "showImagesHistory", sender: sender)
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
        nextScreen.images = (contactImage?.0.contactImages)!
    }
    
}
