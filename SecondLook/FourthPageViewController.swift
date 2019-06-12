//
//  FourthPageViewController.swift
//  SecondLook
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
        content.title = "Take a second look down the page"
        content.subtitle = ""
        content.body = "As Instagram user you have to agree to the Terms & Privacy Policy before you create your Instagram account. When you agree with this terms you give permission to Insagram to collect, keep, analyze, share and transfer your data in particular way, which is described in the documents. We advice you to read this terms carefully, or at least look the summary from Terms of Serveice; \nSummary - https://tosdr.org/#instagram"
        
        ////// Adding an image to the notificatoin
        let imageName = "terms"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        content.attachments = [attachment]
        /////
        
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
