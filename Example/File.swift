//
//  File.swift
//  Example
//
//  Created by Nikita Prakash Patil on 2/10/17.
//  Copyright © 2017 Nikita Prakash Patil. All rights reserved.
//

import Foundation
import UIKit

class File: UIViewController {
    
    @IBOutlet var mylabel: UILabel!
    @IBOutlet var mylabel1: UILabel!
    @IBOutlet var mylabel2: UILabel!
    @IBOutlet var mylabel3: UILabel!
 
    //var answer = "A";
    var answer1 = "nil"
    var answer2 = "nil"
    var answer3 = "nil"
    var answer4 = "nil"

    override func viewDidLoad() {
        super.viewDidLoad()
        mylabel.text = answer1
        mylabel1.text = answer2
        mylabel2.text = answer3
        mylabel3.text = answer4
       // let defaults = UserDefaults.standard
        //value.text = defaults.string(forKey: "optionA")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    
}
