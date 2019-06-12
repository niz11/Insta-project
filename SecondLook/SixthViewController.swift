//
//  SixthViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//
// Sixth landing page, Add profile picture page


import UIKit
import UserNotifications

extension SixthViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}
//UINavigationControllerDelegate - allow our app to jump to other apps
//UIImagePickerControllerDelegate - allow user to pick images

class SixthViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //give the notification only once
    var galleryNotification = true;

    @IBOutlet weak var AddPhotoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelSkipToContinue: UILabel!
    
    //Updating the image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //User finished picking an image
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        } else{
            print("Had a problem getting the image")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changing style of buttons
        AddPhotoButton.layer.cornerRadius = 10
        AddPhotoButton.clipsToBounds = true
        
        
    }
    
    //User adds a photo
    @IBAction func addPicture(_ sender: Any) {
        //Calls notification
        if galleryNotification {
            createGalleryotification()
        }
        
        let imagePickerController = UIImagePickerController()
        //Current view controller
        imagePickerController.delegate = self
        
        //Can change photoLibrary to camera and then it will accesses the camera
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
    
        imagePickerController.allowsEditing = false
        
        //Display viewcontroller
        self.present(imagePickerController, animated: true, completion: nil)
        
        labelSkipToContinue.text = "Continue"
    }
    
    
    
    
    
    //Notification function
    func createGalleryotification() {
        
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
        galleryNotification = true;
    }


}
