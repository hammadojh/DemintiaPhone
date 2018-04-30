//
//  AppDelegate.swift
//  DemintiaPhone
//
//  Created by Omar on 08/04/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

var contacts = [Contact]()
var contactsImages = [(Contact,ContactImage)]()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // status bar
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        // read contacts
        
        contacts.append(Contact(name: "Mohammed Ali", phone: "18003310500", contactImages: [ContactImage(imageURL: "moh_1", date: "1962"),ContactImage(imageURL: "moh_2", date: "2010")]))
        
        contacts.append(Contact(name: "Tom Cruise", phone: "18003310500", contactImages: [ContactImage(imageURL: "tom_1", date: "1983"),ContactImage(imageURL: "tom_2", date: "2016")]))
        
        contacts.append(Contact(name: "Barrak Obama", phone: "18003310500", contactImages: [ContactImage(imageURL: "obama_1", date: "1980"),ContactImage(imageURL: "obama_2", date: "2012")]))
        
        contacts.append(Contact(name: "Jeff Bezos", phone: "18003310500", contactImages: [ContactImage(imageURL: "jeff_1", date: "1988"),ContactImage(imageURL: "jeff_2", date: "2017")]))
        
        
        // initialzie contactsImages
        for contact in contacts {
            for image in contact.contactImages {
                contactsImages.append((contact,image))
            }
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

