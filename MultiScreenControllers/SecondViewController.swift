//
//  SecondViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 27.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

import UIKit
//Adding a second type so we can response to end button in keyboard
//UITextFieldDelegate -> gives more control over text fields
class SecondViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("I am second")
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
        textField.resignFirstResponder()
        //After that we go to the textfiled, ctrl + click it and drug the blue arrow to the yellow symbol of the view controller. and select -"delegete"
        
        return true
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
/*
How we created a second view controller-
    1) add a new viewcontroller to Main.storyboard. simply like adding a label or a text field.
    2) add a new file to project. A coca touch class of the kind - UIViewController
    3) press on the new view controller in main.story board and go to the third menu in the right
    4) under costum class -> add the new coca file you just created to reached to the viewcontroller. a swift file of cousr
    4) create a button, ctrl  + click it and drug the blue error to the other view controller. And that's how we connect them.
 
 How to shut down keyboard or other stuff -
 touchesBegan method
 
 */
