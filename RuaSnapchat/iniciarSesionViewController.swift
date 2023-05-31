//
//  ViewController.swift
//  RuaSnapchat
//
//  Created by Mac 11 on 31/05/23.
//

import UIKit
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentando Iniciar Sesión")
            if error != nil{
                print("Se presentó el siguiente error: \(error)")
            }else{
                print("Inicio de sesión exitoso")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

