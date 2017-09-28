//
//  ViewController.swift
//  KeyChainDemo
//
//  Created by Abhishek Khedekar on 28/09/17.
//  Copyright © 2017 Abhishek Khedekar. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {
    @IBOutlet weak var txtfieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func savePassword(_ sender: Any) {
        
        if let password = txtfieldPassword.text {
            let saveSuccesful:Bool = KeychainWrapper.standard.set(password, forKey: "UserPassword")
            print("save was successful : \(saveSuccesful)")
            self.view.endEditing(true)
        }
        
    
        }
    
    @IBAction func retrivePassword(_ sender: Any) {
     
        if let savedPassword = KeychainWrapper.standard.string(forKey: "UserPassword") {
            print("password is : \(savedPassword)")
        }
    }
    
    @IBAction func deleteKeyFromKeychain(_ sender: Any) {
        let deleteSuccessful:Bool = KeychainWrapper.standard.removeObject(forKey: "UserPassword")
        print("key deleted : \(deleteSuccessful)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

