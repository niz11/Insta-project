//
//  tenthViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 05.06.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//
// last page - record a video

import UIKit
import UserNotifications

extension tenthViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}


class tenthViewController: UIViewController {
    
    var RecordNotification = true
    override func viewDidLoad() {
        super.viewDidLoad()
        createMicNotification()
    }
    //Notification function
    func createMicNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "What about your dickpics?"
        content.subtitle = "Be Careful"
        content.body = "It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb,It is crucial blablaalbaal importance of pasword most common passwordsbsadhbashdbashdb"
        
        ////// Adding an image to the notificatoin
        let imageName = "icon-man"
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
        RecordNotification = true;
    }

}

