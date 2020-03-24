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
    
    var timer : Timer!
    
    func displayPhoto(){
        
        let name = imageArray[selectNumber]
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "photo0")
        imageView.image = image
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        self.imageView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            
            let nextVC = segue.destination as! PhotoViewController
            nextVC.photo = imageView.image
        }
    }

    @objc func tapImage(){
        
        performSegue(withIdentifier: "segue" , sender: nil)
        
        if timer != nil{
            self.timer.invalidate()
            self.timer = nil
            
            self.nextButton.isEnabled = true
            self.backButton.isEnabled = true
            
            self.switchButton.setTitle("再生", for: .normal)
            
        }
       

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
        if timer == nil{
            self.nextButton.isEnabled = false
            self.backButton.isEnabled = false
            
            self.switchButton.setTitle("停止", for: .normal)
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideShowTimer(_:)), userInfo: nil, repeats: true)
            
        } else {
            self.nextButton.isEnabled = true
            self.backButton.isEnabled = true
            
            self.switchButton.setTitle("再生", for: .normal)
            
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @objc func slideShowTimer(_ timer: Timer){
        if selectNumber < imageArray.count - 1 {
            selectNumber += 1
            displayPhoto()
        } else {
            selectNumber = 0
            displayPhoto()
        }
    }
    
    
}

