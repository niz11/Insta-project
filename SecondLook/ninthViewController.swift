//
//  ninthViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 05.06.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

import UIKit
import UserNotifications

extension ninthViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}


class ninthViewController: UIViewController {
    //Just for testing
    var LocationNotification = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCameraNotification()
    }
    
    //Notification function
    func createCameraNotification() {
        
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
        LocationNotification = true;
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//For taking a photo with camera
//    var imagePicker: UIImagePickerController!
    //    @IBOutlet weak var imageView: UIImageView!
    //Event from clicking the camera icon
    //    @IBAction func takePhoto(_ sender: Any) {
    //        imagePicker =  UIImagePickerController()
    //        imagePicker.delegate = self
    //
    //        imagePicker.sourceType = .camera
    //        print("hi")
    //        present(imagePicker, animated: true, completion: nil)
    //
    //    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        imageView.image = info[.originalImage] as? UIImage
//    }
    
}
