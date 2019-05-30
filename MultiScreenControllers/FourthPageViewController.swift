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

    @IBOutlet weak var UserName: UILabel!
    var input_user_name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Showing the username
        UserName.text = input_user_name
        print("Fourth page")
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
