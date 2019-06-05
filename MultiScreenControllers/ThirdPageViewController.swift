//
//  ThirdPageViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 28.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

// Third landing page - input name and pass

import UIKit

class ThirdPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FullNameButton: UITextField!
    @IBOutlet weak var PasswordButton: UITextField!
    
    @IBOutlet weak var ContinueAndSync: UIButton!
    
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
    }
    

    @IBAction func OnClickName(_ sender: Any) {
        print("HEllo2")
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
    
    @IBAction func OnTouchPass(_ sender: Any) {
        print("HEllo2")
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
        if ContinueAndSync.isEnabled {
            performSegue(withIdentifier: "segue", sender: self)
        }
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
    
    

}
