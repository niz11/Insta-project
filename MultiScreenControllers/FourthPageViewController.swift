//
//  FourthPageViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

// Fourth landing page, welcome and agree to Terms

import UIKit

class FourthPageViewController: UIViewController {
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var UserName: UILabel!
    var input_user_name = String()
    
    override func viewDidLoad() {
        //Changing style of buttons
        NextButton.layer.cornerRadius = 10
        NextButton.clipsToBounds = true
        
        super.viewDidLoad()
        //Showing the username
        UserName.text = input_user_name
    }

}
