//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by EsAdmin on 2020/02/29.
//  Copyright © 2020 seiya.yokoyama. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var img:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = img
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
