//
//  ViewController.swift
//  RuaSnapchat
//
//  Created by Mac 11 on 31/05/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var googleButton: UIButton!
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentando Iniciar Sesión")
            if error != nil{
                print("Se presentó el siguiente error: \(error)")
                let alerta = UIAlertController(title: "Creación de Usuario", message: "Este usuario no está registrado, ¿desea registrarlo?", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Crear", style: .default) { (UIAlertAction) in
                    self.performSegue(withIdentifier: "registroSegue", sender: nil)
                }
                let btnCANCEL = UIAlertAction(title: "Cancelar", style: .cancel) { (UIAlertAction) in
                    alerta.dismiss(animated: true, completion: nil)
                }
                alerta.addAction(btnOK)
                alerta.addAction(btnCANCEL)
                self.present(alerta, animated: true, completion: nil)
            
            }else{
                print("Inicio de sesión exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
