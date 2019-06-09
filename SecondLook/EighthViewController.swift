//
//  EighthViewController.swift
//  SecondLook
//
//  Created by Nizan Goldstein on 04.06.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

import UIKit

class EighthViewController: UIViewController {

    @IBOutlet weak var labelOnTop: UILabel!
        @IBOutlet weak var PhotoButton: UITabBarItem!

    @IBOutlet weak var VideoButton: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickedPhotoButton(_ sender: Any) {
        labelOnTop.text = "Photo"
            PhotoButton.badgeColor = UIColor.blue
    }
    
    @IBAction func clickVideoButton(_ sender: Any) {
             labelOnTop.text = "Video"
    }
    
}
