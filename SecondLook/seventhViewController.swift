//
//  seventhViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//
//SEVENTHPAGE - mainpage of insta
import UIKit
import UserNotifications

extension seventhViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}


class seventhViewController: UIViewController {
    //Just for testing
    var LocationNotification = true;
    
    @IBOutlet weak var LocationPerm: UIImageView!
    @IBOutlet weak var backGroundPicture: UIImageView!
    @IBOutlet weak var backGroundPicture2: UIImageView!
    @IBOutlet weak var buttomBar: UIImageView!
    
    @IBOutlet weak var topMenu: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundPicture.alpha = 0.3
        backGroundPicture2.alpha = 0.3
        buttomBar.alpha = 0.3
        topMenu.alpha = 0.3
        self.LocationPerm.layer.cornerRadius = self.LocationPerm.frame.size.width / 10
        createLocationNotification()
    }
    
    @IBAction func takePermAway(_ sender: Any) {
        LocationPerm.alpha = 0
        backGroundPicture.alpha = 1
        backGroundPicture2.alpha = 1
        buttomBar.alpha = 1
        topMenu.alpha = 1
    }
    
    
    //Notification function
    func createLocationNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "What about your cat?"
        content.subtitle = ""
        content.body = "Be aware, that by giving Instagram access to your location you can always be localized, even if you do not share your location on your posts. Instagram could also have access to the locational data stored from the geo-tagging (the process of adding geographical identification metadata to various media) and use that data for marketing purposes. \nIf you really want to share your location on a post, another more safe option will be to use hashtag (e.g. #berlin) in the description of the post."
        
        ////// Adding an image to the notificatoin
        let imageName = "location-new"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "jpeg") else { return }
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
        LocationNotification = true;
    }
    

}
