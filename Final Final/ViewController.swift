//
//  ViewController.swift
//  Final Final
//
//  Created by Lenora Duong on 11/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let usernameText = defaults.value(forKey: "User Name") as? String {
            usernameTextField.text = usernameText
        }
        
        if let passwordText = defaults.value(forKey: "Password") as? String {
            passwordTextField.text = passwordText
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        if let usernameText = usernameTextField.text {
            defaults.setValue(usernameText, forKey: "User Name")
        }
        
        if let passwordText = passwordTextField.text {
            defaults.setValue(passwordText, forKey: "Password")
        }
    }
    
}
