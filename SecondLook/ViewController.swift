//
//  ViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 27.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

/*
 First landing page - welcome to insta
 */
/*
 * Password
 * Contacnts
 * Terms and conditions
 * facebook
 * photo gallery
 * location
 * camera
 * mic
 */
import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        //making the button round
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("I am first")
    }

}

