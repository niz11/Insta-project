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
    
    @IBOutlet weak var CameraPermission: UIImageView!
    //Just for testing
    var LocationNotification = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Image round corners
        self.CameraPermission.layer.cornerRadius = self.CameraPermission.frame.size.width / 10
        CameraPermission.alpha = 0

    }
    @IBAction func TakePhotoEvent(_ sender: Any) {
         createCameraNotification()
        CameraPermission.alpha = 1
    }
    @IBAction func ClosePermissionMessage(_ sender: Any) {
        CameraPermission.alpha = 0
    }
    
    
    //Notification function
    func createCameraNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Give me the access to your camera"
        content.subtitle = ""
        content.body = "In order to use the complete variety of services, that Instagram has to offer you, you have to give access to your personal camera - both the front and the back one. After giving your agreement the app can observe you live activities, detect if you are alone on your phone, estimate your mood and also localize you based on the image data.\nEven if you deside to give this permission you still can protect yourself by using a camera cover"
        ////// Adding an image to the notificatoin
        let imageName = "camera"
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
