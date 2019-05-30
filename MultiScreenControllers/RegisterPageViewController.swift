//
//  RegisterPageViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 27.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//
/*
    Second landing page - input Email
*/
import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    
    var Input_Email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //making the button round
        NextButton.layer.cornerRadius = 10
        NextButton.clipsToBounds = true
        // Do any additional setup after loading the view.
        
        //Styling text field
        EmailTextField.translatesAutoresizingMaskIntoConstraints = false
        EmailTextField.placeholder = "Email"
        EmailTextField.borderStyle = .roundedRect
        EmailTextField.font = .systemFont(ofSize: 14)
        EmailTextField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        NextButton.isEnabled = false
    }
    
    
    @IBAction func OnTypeEventEmail(_ sender: Any) {
        Input_Email = String(EmailTextField.text!)
        //Checking if email is valid
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        NextButton.isEnabled  = emailTest.evaluate(with: Input_Email)
        
        //Changing the color of the next button
        NextButton.alpha = 1
        
    }
    

}
