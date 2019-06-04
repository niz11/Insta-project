//
//  FifthViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    @IBOutlet weak var ConnectToFaceBottun: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changing style of buttons
        ConnectToFaceBottun.layer.cornerRadius = 10
        ConnectToFaceBottun.clipsToBounds = true
    }
    

}
