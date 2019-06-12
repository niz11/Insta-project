//
//  ThirdPageViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 28.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

// Third landing page - input name and pass

import UIKit
import UserNotifications

extension ThirdPageViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        
        
        completionHandler([.alert, .sound, .badge])
        
    }
}


class ThirdPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FullNameButton: UITextField!
    @IBOutlet weak var PasswordButton: UITextField!
    
    @IBOutlet weak var ContinueAndSync: UIButton!
    
    @IBOutlet weak var ContinueLabel: UILabel!
    
    @IBOutlet weak var continueWithoutSync: UIButton!
    
    var lengthOfUserName = 0
    var lengthOfUPassword = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FullNameButton.delegate = self
        PasswordButton.delegate = self
        //Changing style of buttons
        ContinueAndSync.layer.cornerRadius = 10
        ContinueAndSync.clipsToBounds = true
        FullNameButton.translatesAutoresizingMaskIntoConstraints = false
        FullNameButton.placeholder = "Full Name"
        FullNameButton.borderStyle = .roundedRect
        FullNameButton.font = .systemFont(ofSize: 14)
        FullNameButton.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        PasswordButton.translatesAutoresizingMaskIntoConstraints = false
        PasswordButton.placeholder = "Password"
        PasswordButton.isSecureTextEntry = true
        PasswordButton.borderStyle = .roundedRect
        PasswordButton.font = .systemFont(ofSize: 14)
        PasswordButton.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        ContinueAndSync.isEnabled = false;
        continueWithoutSync.isEnabled = false;
        
        //notification
        UNUserNotificationCenter.current().delegate = self
    }
    

    @IBAction func OnClickName(_ sender: Any) {
        
    }
    
    
    @IBAction func OnTypeName(_ sender: Any) {
        lengthOfUserName = String(FullNameButton.text!).count
        
        if lengthOfUserName > 3 && lengthOfUPassword > 3{
            ContinueAndSync.alpha = 1
            ContinueAndSync.isEnabled = true;
            continueWithoutSync.isEnabled = true;
            
        } else {
            ContinueAndSync.alpha = 0.6
            ContinueAndSync.isEnabled = false;
            continueWithoutSync.isEnabled = false;
        }
    }
    
    //give the notification only once
    var passwordNotification = true;
    
    @IBAction func OnTouchPass(_ sender: Any) {
        if passwordNotification {
            createPasswordNotification()
        }
    }
    
    @IBAction func OnTypePass(_ sender: Any) {
        lengthOfUPassword = String(PasswordButton.text!).count
        
        if lengthOfUserName > 3 && lengthOfUPassword > 3{
            ContinueAndSync.alpha = 1
            ContinueAndSync.isEnabled = true;
            continueWithoutSync.isEnabled = true;
            
        } else {
            ContinueAndSync.alpha = 0.6
            ContinueAndSync.isEnabled = false;
            continueWithoutSync.isEnabled = false;
        }
    }
    
    @IBAction func OnClickContinue(_ sender: Any) {
        ContinueLabel.alpha = 1
        ContinueLabel.text = "Continue"
        createContactsNotification()
        
    }
    //Pusing values to next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FourthPageViewController{
            let FourthViewController = segue.destination as? FourthPageViewController;
            
            FourthViewController?.input_user_name = String(FullNameButton.text!)
        }
        
    }
    
    @IBAction func LearnMoreButton(_ sender: Any) {
        print("clicked on learn more")
    }
    //Will run when touching the main screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self == viewcontroller
        //That thrws away the keyboard
        self.view.endEditing(true)
    }
    //Telling when happens when return button in keyboard is presssed -> closing keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //functions get the textfield as var, and we run on it a functuins that closes it.
        FullNameButton.resignFirstResponder()
        PasswordButton.resignFirstResponder()

        //After that we go to the textfiled, ctrl + click it and drug the blue arrow to the yellow symbol of the view controller. and select -"delegete"
        
        return true
    }
    
    func createPasswordNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Choose your password wisely"
        content.subtitle = ""
        content.body = "The authenticaion with username and password always has a potential risk of application attacks.\nTo make your password more secure here are find some tips: \n* Use at least 12 characters \n* Mix numbers, symbols and uppercase letters \n* Do not use dictionary words, e.g. 'Red house' \n* Do not reuse passwords \n* Use a password generator"
        
        ////// Adding an image to the notificatoin
        let imageName = "password"
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
        passwordNotification = true;
    }
    
    @IBAction func asdasd(_ sender: Any) {
//        if ContinueAndSync.isEnabled {
//            performSegue(withIdentifier: "segue", sender: self)
//        }
        print("hi")
    }
    
    
    
    func createContactsNotification() {
        
        
        let content = UNMutableNotificationContent()
        content.title = "Think twice about the contact permission"
        content.subtitle = ""
        content.body = "When you connect Instagram with your device's contact list you will be able to find easily new contacts to follow, but in this way Instagram will store and periodically sync your local saved information about your contact list. Note, that you can delete all your contacts and stop syncing them from Instagram at anytime. \nFor information how to do this, visit:\nhttps://help.instagram.com/227486307449481?helpref=search&sr=3&query=contacts "
        content.categoryIdentifier = "Contacts"
        
        ////// Adding an image to the notificatoin
        let imageName = "contacts"
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
        
        
    }
    
    

}
