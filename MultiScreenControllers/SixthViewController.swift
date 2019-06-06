//
//  SixthViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

import UIKit
import UserNotifications

extension SixthViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}

class SixthViewController: UIViewController {
    //give the notification only once
    var galleryNotification = true;

    @IBOutlet weak var AddPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changing style of buttons
        AddPhotoButton.layer.cornerRadius = 10
        AddPhotoButton.clipsToBounds = true
        
        //Calls notification
        if galleryNotification {
            createPasswordNotification()
        }
        
    }
    
    func createPasswordNotification() {
        
        
        let content = UNMutableNotificationContent()
        content.title = "What about your dickpics?"
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
        galleryNotification = true;
    }


}
