//
//  ViewController3.swift
//  Sample
//
//  Created by Nikita Prakash Patil on 2/10/17.
//  Copyright © 2017 Nikita Prakash Patil. All rights reserved.
//

import Foundation
import UIKit
import SwiftyDropbox


class ViewController3: UIViewController {
    
    
    
    
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var iboptA: UIButton!
    @IBOutlet weak var iboptB: UIButton!
    @IBOutlet weak var iboptC: UIButton!
    @IBOutlet weak var iboptD: UIButton!
    let client = DropboxClientsManager.authorizedClient
    @IBOutlet weak var upload: UIButton!
    
    var answer1 = "nil"
    var answer2 = "nil"
    var answer3 = "nil"
    var answer4 = "nil"
   
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
    
   
    
    @IBAction func Aopt4(_ sender: Any) {
        
       answer4 =  iboptA.currentTitle!
        iboptA.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText31)
    }
    
    @IBAction func Bopt4(_ sender: Any) {
        
        answer4 =  iboptB.currentTitle!
        iboptB.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       // let defaults = UserDefaults.standard
        //defaults.set("optionB", forKey:labelText32)
    }
    
    @IBAction func Copt4(_ sender: Any) {
    
        
        answer4 =  iboptC.currentTitle!
        iboptC.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
        //defaults.set("optionC", forKey:labelText33)
    }
    
    @IBAction func Dopt4(_ sender: Any) {
            answer4 =  iboptD.currentTitle!
        iboptD.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        //let defaults = UserDefaults.standard
        //defaults.set("optionC", forKey:labelText34)
    }
    
    @IBAction func update(_ sender: Any) {
        if answer4 == "nil" {
            let alertController = UIAlertController(title: "Caution!", message: "Select an option!", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(cancelAction)
        }
        let uploadFilename = "answersFile.txt"
        let textContent = answer1.appending(answer2).appending(answer3).appending(answer4)
         let textData:NSData? = textContent.data(using: String.Encoding.utf8) as NSData?
         let sourcePath = "/Users/nipatil/Desktop/Example/Example/answersFile.txt"
      //  let s1 = Bundle.main.path(forResource: "answersFile", ofType: "txt")! as String
//        let fm = FileManager.default
//        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        let s1 = docsurl.appendingPathComponent("answersFile.txt") as! String
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let path = dir.appendingPathComponent(uploadFilename)
            
            //writing
            do {
                try textContent.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
        }
        let client = DropboxClientsManager.authorizedClient!
        
            DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                          controller: self,
                                                          openURL: { (url: URL) -> Void in
                                                            UIApplication.shared.openURL(url)
                                                            
                                                            
            })
        
        client.files.upload(path: sourcePath, input: textData as! Data).response { response, error in
            if let metadata = response {
                print("Uploaded file name: \(metadata.name)")
                print("Uploaded file revision: \(metadata.rev)")
                
                // Get file (or folder) metadata
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "questionsample" {
            let dest =  segue.destination as? File
            
            dest?.answer1 = answer1
            dest?.answer2 = answer2
            dest?.answer3 = answer3
            dest?.answer4 = answer4
            
        }
        
    }

}
