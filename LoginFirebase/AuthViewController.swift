//
//  AuthViewController.swift
//  LoginFirebase
//
//  Created by KMMX on 26/10/20.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    
    @IBOutlet weak var btnIniciarSesion: UIButton!
    
    @IBOutlet weak var btnRegistrarse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarSesion(_ sender: Any) {
        if let usuario = tfUsuario.text, let contrasena = tfContrasena.text{
            Auth.auth().signIn(withEmail: usuario, password: contrasena) { (result, error) in
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!,provider: .basic), animated: true)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Se ha producido un error al validar el usuario.", preferredStyle:  .alert)
                    let alertAction = UIAlertAction(title: "Aceptar", style: .default)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func registrarse(_ sender: Any) {
        if let usuario = tfUsuario.text, let contrasena = tfContrasena.text{
            Auth.auth().createUser(withEmail: usuario, password: contrasena) { (result, error) in
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!,provider: .basic), animated: true)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Se ha producido un error al registrar el usuario.", preferredStyle:  .alert)
                    let alertAction = UIAlertAction(title: "Aceptar", style: .default)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    
}

