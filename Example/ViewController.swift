//
//  ViewController.swift
//  Example
//
//  Created by Nikita Prakash Patil on 2/10/17.
//  Copyright © 2017 Nikita Prakash Patil. All rights reserved.
//

import UIKit
import Foundation
import SwiftyDropbox
class ViewController: UIViewController, XMLParserDelegate {
    @IBOutlet weak var imageview: UIImageView!
    
 

    @IBOutlet weak var optA: UIButton!
    @IBOutlet weak var optB: UIButton!
    @IBOutlet weak var optC: UIButton!
    @IBOutlet weak var optD: UIButton!
    var question1 = Questions()
    var question2 = Questions()
    var question3 = Questions()
    var question4 = Questions()
    var ques = Questions()
    var flag = 0
    var eName: String = String()
    var opt1 = String()
    var opt2 = String()
    var opt3 = String()
    var opt4 = String()
    var count = 1
    var imageName = String()
    var correctAnswer = String()
    //var answer1:[String]? = nil
    var x = 0
    var answer1 = "nil"
    var answer2 = "nil"
    var answer3 = "nil"
    var answer4 = "nil"

    @IBOutlet var upload: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //correctAnswer = Questions.correctAnswer
        // Do any additional setup after loading the view, typically from a nib.
        if let path = Bundle.main.url(forResource: "questionsXML", withExtension: "xml") {    //parsing the questions xml
            
            if let parser = XMLParser(contentsOf: path) {
                
                parser.delegate = self
                parser.parse()
            }
        }
        optA.setTitle(question1.possible1, for: .normal)
        optB.setTitle(question1.possible2, for: .normal)
        optC.setTitle(question1.possible3, for: .normal)
        optD.setTitle(question1.possible4, for: .normal)
        imageview.image = UIImage(named: question1.picture)
        count = count+1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
      
          if flag == 0{
            let alertController = UIAlertController(title: "Caution!", message: "Select an option!", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(cancelAction)
        }
//          else{
//           
//            if count==1{
//                optA.setTitle(question1.possible1, for: .normal)
//                                optB.setTitle(question1.possible2, for: .normal)
//                                optC.setTitle(question1.possible3, for: .normal)
//                                 optD.setTitle(question1.possible4, for: .normal)
//                imageview.image = UIImage(named: question1.picture)
//                count = count+1
//            }
             if count==2{
                optA.setTitle(question2.possible1, for: .normal)
                optB.setTitle(question2.possible2, for: .normal)
                optC.setTitle(question2.possible3, for: .normal)
                optD.setTitle(question2.possible4, for: .normal)
                imageview.image = UIImage(named: question2.picture)
                count = count+1

            }
            else if count==3{
                optA.setTitle(question3.possible1, for: .normal)
                optB.setTitle(question3.possible2, for: .normal)
                optC.setTitle(question3.possible3, for: .normal)
                optD.setTitle(question3.possible4, for: .normal)
                imageview.image = UIImage(named: question3.picture)
                count = count+1

            }
            else if count==4{
                optA.setTitle(question4.possible1, for: .normal)
                optB.setTitle(question4.possible2, for: .normal)
                optC.setTitle(question4.possible3, for: .normal)
                optD.setTitle(question4.possible4, for: .normal)
                imageview.image = UIImage(named: question4.picture)
                
                upload.isEnabled = true

            }
            //else if count>4{
             //   self.performSegue(withIdentifier: "uploadSegue", sender: self)
           // }
//            if count<4{
//                 optA.setTitle(questions[count].possible1, for: .normal)
//                optB.setTitle(questions[count].possible2, for: .normal)
//                optC.setTitle(questions[count].possible3, for: .normal)
//                 optD.setTitle(questions[count].possible4, for: .normal)
//            }
           
        
       // count = count+1
    }

 
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        eName = elementName
        if elementName == "question" {
            
             opt1 = String()
             opt2  = String()
             opt3  = String()
             opt4  = String()
             imageName = ""
             correctAnswer = String()
                    }
                }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: .whitespacesAndNewlines)
        if (!data.isEmpty) {
            
            if eName == "possible1" {
                   print(data)
                opt1 += data
               
            } else if eName == "possible2" {
                   print(data)
                opt2 += data
                
            }
            else if eName == "possible3" {
                   print(data)
                opt3 += data
                
            }
            else if eName == "possible4" {
                print(data)
                opt4 += data
               
            }else if eName == "correctAnswers" {
                correctAnswer += data
            }
            else if eName == "qPicture" {
                print("QID is "+data)
                imageName += data
                imageview.image = UIImage.init(named: imageName)
            }
            
            
        }
      
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "question"{
    
            
//            ques.possible1 = opt1
//            ques.possible2 = opt2
//            ques.possible3 = opt3
//            ques.possible4 = opt4
//            ques.correctAnswer = correctAnswer
//            ques.picture = imageName
            if(imageName == "001.png"){
                question1.possible1 = opt1
                            question1.possible2 = opt2
                            question1.possible3 = opt3
                            question1.possible4 = opt4
                            question1.correctAnswer = correctAnswer
                            question1.picture = imageName
            }
            else if(imageName == "002.png"){
                question2.possible1 = opt1
                question2.possible2 = opt2
                question2.possible3 = opt3
                question2.possible4 = opt4
                question2.correctAnswer = correctAnswer
                question2.picture = imageName            }
            else if(imageName == "003.png"){
                question3.possible1 = opt1
                question3.possible2 = opt2
                question3.possible3 = opt3
                question3.possible4 = opt4
                question3.correctAnswer = correctAnswer
                question3.picture = imageName            }
            else if(imageName == "004.png"){
                question4.possible1 = opt1
                question4.possible2 = opt2
                question4.possible3 = opt3
                question4.possible4 = opt4
                question4.correctAnswer = correctAnswer
                question4.picture = imageName
            }
            else if count>4{
                self.performSegue(withIdentifier: "uploadSegue", sender: self)
               
            }
        }
        

        
    }
   
    

    
    
    @IBAction func optA1(_ sender: Any) {
        
         answer1 = optA.currentTitle!
        flag = 1
        //optA.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
       // let defaults = UserDefaults.standard
        //defaults.set("optionA", forKey:labelText)
        //UserDefaults.standard.synchronize()
    }
    
    
    @IBAction func optB1(_ sender: Any) {
       answer2 = optB.currentTitle!
        flag = 1
        //optB.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
        // defaults.set("optionB", forKey:labelText1)

    }
    
    @IBAction func optC1(_ sender: Any) {
        answer3 = optC.currentTitle!
        flag = 1
       // optC.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        // let defaults = UserDefaults.standard
        // defaults.set("optionC", forKey:labelText2)

    }
    @IBAction func optD1(_ sender: Any) {
        
         answer4 = optD.currentTitle!
        flag = 1
        //optD.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //let defaults = UserDefaults.standard
        // defaults.set("optionD", forKey:labelText3)
    }
    
    
    @IBAction func upload1(_ sender: Any) {
    
   
//        if answer4 == "nil" {
//            let alertController = UIAlertController(title: "Caution!", message: "Select an option!", preferredStyle: .alert)
//            self.present(alertController, animated: true, completion: nil)
//            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alertController.addAction(cancelAction)
//        }
        let uploadFilename = "answersFile.txt"
        let textContent = answer1.appending(answer2).appending(answer3).appending(answer4)
        let textData:NSData? = textContent.data(using: String.Encoding.utf8) as NSData?
        let sourcePath = "/Users/bd/Downloads/Example/Example/answer.xml"
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
    
//   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      
//    if count>4{
//        if segue.identifier == "uploadSegue" {
//            
//            let dest =  segue.destination as? ViewController3
//            //dest?.answer1 = answer1
//            
//        }
//        
//    }
//}


}

