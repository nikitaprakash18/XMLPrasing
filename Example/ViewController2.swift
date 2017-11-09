//
//  ViewController2.swift
//  Sample
//
//  Created by Nikita Prakash Patil on 2/10/17.
//  Copyright © 2017 Nikita Prakash Patil. All rights reserved.
//

import Foundation
import UIKit



class ViewController2: UIViewController {

    

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var optA2: UIButton!
    @IBOutlet weak var optB2: UIButton!
    @IBOutlet weak var optC2: UIButton!
    @IBOutlet weak var optD2: UIButton!
    var answer1 = "nil"
    var answer2 = "nil"
    var answer3 = "nil"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next2(_ sender: Any) {
        if answer3 == "nil" {
            let alertController = UIAlertController(title: "Caution!", message: "Select an option!", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(cancelAction)
        }
    }
    
    @IBAction func Aopt2(_ sender: Any) {
    
         answer3 =  optA2.currentTitle!
        optA2.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText21)
    }
    
    @IBAction func Bopt2(_ sender: Any) {
    
         answer3 =  optB2.currentTitle!
        optB2.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
       // defaults.set("optionB", forKey:labelText22)

    }
    
    
    @IBAction func Copt2(_ sender: Any) {
          answer3 =  optC2.currentTitle!
        optC2.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
       // let defaults = UserDefaults.standard
       // defaults.set("optionC", forKey:labelText23)
    }
    
    @IBAction func Dopt2(_ sender: Any) {
    
         answer3 =  optD2.currentTitle!
        optD2.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       // let defaults = UserDefaults.standard
        //defaults.set("optionC", forKey:labelText24)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "question3" {
            let dest =  segue.destination as? ViewController3
            dest?.answer1 = answer1
            dest?.answer2 = answer2
            dest?.answer3 = answer3
            
        }
            
        }


    
}
