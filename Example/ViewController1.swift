//
//  ViewController1.swift
//  Sample
//
//  Created by Nikita Prakash Patil on 2/10/17.
//  Copyright © 2017 Nikita Prakash Patil. All rights reserved.
//

import Foundation
import UIKit



class ViewController1: UIViewController {
    
    @IBOutlet weak var optnA1: UIButton!
    @IBOutlet weak var optnB1: UIButton!
    @IBOutlet weak var optnC1: UIButton!
    @IBOutlet weak var optnD1: UIButton!
    var answer1 = "nil"
    var answer2 = "nil"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next1(_ sender: Any) {
        if answer2 == "nil" {
            let alertController = UIAlertController(title: "Caution!", message: "Select an option!", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(cancelAction)
        }
    }
    
    @IBAction func Aopt(_ sender: Any) {
        
       answer2 =  optnA1.currentTitle!
        optnA1.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText11)
        
    }
    
    
    @IBAction func Bopt(_ sender: Any) {
        
         answer2 =  optnB1.currentTitle!
        optnB1.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
       // let labelText12 =  Bopt.currentTitle!
        //let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText12)
    }
    
    @IBAction func Copt(_ sender: Any) {
         answer2 =  optnC1.currentTitle!
        optnC1.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       // let labelText13 =  Copt.currentTitle!
       // let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText13)
    }
    
    @IBAction func Dopt(_ sender: Any) {
    answer2 =  optnD1.currentTitle!
        optnD1.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let labelText14 =  Copt.currentTitle!
        //let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText14)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "question2" {
            let dest =  segue.destination as? ViewController2
            dest?.answer1 = answer1
            dest?.answer2 = answer2

            
            
        }
    }
}

