//
//  HomeViewController.swift
//  LoginFirebase
//
//  Created by KMMX on 26/10/20.
//

import UIKit
import FirebaseAuth

enum ProviderType: String{
    case basic
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnCerrarSesion: UIButton!
    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType){
        self.email=email
        self.provider=provider
        
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cerrarSesion(_ sender: Any) {
        switch provider {
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch {
                print("Error on logout")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
