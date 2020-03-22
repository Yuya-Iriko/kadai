//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 入子優哉 on 2020/03/22.
//  Copyright © 2020 yuya.iriko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    let imageArray = ["photo0", "photo1", "photo2", "photo3", "photo4"]
    
    var selectNumber = 0
    
    func displayPhoto(){
        
        let name = imageArray[selectNumber]
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "photo0")
        imageView.image = image
        // Do any additional setup after loading the view.
    }

    @IBAction func nextTap(_ sender: Any) {
        if selectNumber < imageArray.count - 1 {
            selectNumber += 1
            displayPhoto()
        } else {
            selectNumber = 0
            displayPhoto()
        }
    }
    
    @IBAction func backTap(_ sender: Any) {
        if selectNumber != 0 {
            selectNumber -= 1
            displayPhoto()
        } else {
            selectNumber = imageArray.count - 1
            displayPhoto()
        }
        
    }
    
    @IBAction func switchTap(_ sender: Any) {
    }
    
    
}

