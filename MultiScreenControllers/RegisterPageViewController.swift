//
//  RegisterPageViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 27.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//
/*
    Second landing page
*/
import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NextButton: UIButton!
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
    }
    
    
    @IBAction func OnStartTyping(_ sender: Any) {
        //Changing Next button color
        NextButton.alpha = 1
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
