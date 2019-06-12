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
    
    @IBOutlet weak var MicPermm: UIImageView!
    var RecordNotification = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Image round corners
        self.MicPermm.layer.cornerRadius = self.MicPermm.frame.size.width / 10
        MicPermm.alpha = 0
    }
    
    @IBAction func TakeVideoEvent(_ sender: Any) {
        print("Take a video bitch")
        MicPermm.alpha = 1
        createMicNotification()
    }
    
    @IBAction func takePermAway(_ sender: Any) {
        MicPermm.alpha = 0
    }
    //Notification function
    func createMicNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "The Mic is always in your pocket"
        content.subtitle = ""
        content.body = "Instagram provide you also the activity to share live photos and videos. By using this service the app maintain your camera and microphone. Please note, that after you finish the distribution of the live content Instagram can still use your devices properties on the background. So always make sure, that after such activity everything is closed!"
        
        ////// Adding an image to the notificatoin
        let imageName = "mic"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "jpg") else { return }
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

