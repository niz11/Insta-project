//
//  SixthViewController.swift
//  MultiScreenControllers
//
//  Created by Nizan Goldstein on 30.05.19.
//  Copyright © 2019 Nizan Goldstein. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var AddPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changing style of buttons
        AddPhotoButton.layer.cornerRadius = 10
        AddPhotoButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
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
