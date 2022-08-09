//
//  ViewController.swift
//  login
//
//  Created by Hyojeong_Jun on 2022/08/09.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    // sign up
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        let email = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
        }
    }
    
    // login
    @IBAction func tapLogInBtn(_ sender: UIButton) {
        let email = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
        }
        
        if Auth.auth().currentUser != nil {
            errorLabel.text = email
        } else {
            errorLabel.text = ""
        }
    }
    
}

