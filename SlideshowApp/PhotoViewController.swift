//
//  PhotoViewController.swift
//  SlideshowApp
//
//  Created by 入子優哉 on 2020/03/22.
//  Copyright © 2020 yuya.iriko. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photo: UIImage?
    
    @IBOutlet weak var image: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Test")
        self.image?.image = photo
        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        let preVC = self.presentingViewController as! ViewController
        preVC.imageView.image = self.photo
        self.dismiss(animated: true, completion: nil)
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
