//
//  FourthPageViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

// Fourth landing page, welcome and agree to Terms

import UIKit
import UserNotifications


extension FourthPageViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}

class FourthPageViewController: UIViewController {
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var UserName: UILabel!
    var input_user_name = String()
    
    //give the notification only once
    var termsConditionsNotification = true;
    
    override func viewDidLoad() {
        //Changing style of buttons
        NextButton.layer.cornerRadius = 10
        NextButton.clipsToBounds = true
        
        super.viewDidLoad()
        //Showing the username
        UserName.text = input_user_name
        
        //notification
        UNUserNotificationCenter.current().delegate = self
        
        if termsConditionsNotification {
            createTermsConditionsNotification()
        }
    }
    
    func createTermsConditionsNotification() {
        
        
        let content = UNMutableNotificationContent()
        content.title = "Take a look down the page, you sign here a constarct"
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
        termsConditionsNotification = true;
    }

}
