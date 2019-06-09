//
//  FifthViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//
// Fifth landing page, log in with facebook


import UIKit
import UserNotifications

extension FifthViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}

class FifthViewController: UIViewController {
    @IBOutlet weak var ConnectToFaceBottun: UIButton!
    @IBOutlet weak var skipOrContinueLabel: UILabel!
    @IBOutlet weak var skipLabel: UILabel!
    
    //give the notification only once
    var facebookNotification = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changing style of buttons
        ConnectToFaceBottun.layer.cornerRadius = 10
        ConnectToFaceBottun.clipsToBounds = true
        
        //notification
        UNUserNotificationCenter.current().delegate = self
    }
    
    //Connect with facebook is clicked
    @IBAction func connectWithFacebook(_ sender: Any) {
        //Calls notification
        if facebookNotification {
            createFacebookNotification()
        }
        skipOrContinueLabel.text = "Continue"
        skipLabel.alpha = 1
    }
    
    func createFacebookNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Facebook are the bad guys"
        content.subtitle = "Be Careful"
        content.body = "It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb"
        
        content.sound = UNNotificationSound.default
        
        print(content)
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
        
        
        let request = UNNotificationRequest( identifier: "Identifier", content: content, trigger: triger)
        
        UNUserNotificationCenter.current().add(request)  { (error) in
            
            print(error as Any)
        }
        
        //Just for testing
        facebookNotification = true;
    }

}
