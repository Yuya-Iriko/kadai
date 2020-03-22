//
//  ViewController.swift
//  SecondKadaiApp
//
//  Created by 入子優哉 on 2020/03/22.
//  Copyright © 2020 yuya.iriko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let nextViewController:NextViewController = segue.destination as! NextViewController
        nextViewController.name = self.textField?.text
    }

    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}

