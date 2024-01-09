//
//  LogInPage.swift
//  ConjugActionApp
//
//  Created by Bruno Lopes on 2023-10-13.
//

import UIKit

class LogInPageViewController: UIViewController, passSignUpInformation {
    
    var email: String?
    var password: String?
    var name: String?
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLoginUIButton: UIButton!
    @IBOutlet weak var btnSignUpUIButton: UIButton!
    @IBOutlet weak var btnRevealPassword: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize(){
        
        txtPassword.isSecureTextEntry = true
        btnLoginUIButton.layer.shadowColor = UIColor.gray.cgColor
        btnLoginUIButton.layer.shadowOpacity = 0.8
        btnLoginUIButton.layer.shadowOffset = .init(width: 5, height: 5)
        btnLoginUIButton.layer.cornerRadius = 25
        
        btnSignUpUIButton.layer.shadowColor = UIColor.gray.cgColor
        btnSignUpUIButton.layer.shadowOpacity = 0.8
        btnSignUpUIButton.layer.shadowOffset = .init(width: 5, height: 5)
        btnSignUpUIButton.layer.cornerRadius = 25
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toViewController{
            (segue.destination as! ViewController).username = self.name?.capitalized
        }
        if segue.identifier == Segue.toSignupPage {
            (segue.destination as! SignUpPageViewController).delegate = self
        }
    }
    
    @IBAction func btnLoginTouchUpInside(_ sender: Any) {
        
        let email = txtEmail.text!.lowercased()
        let password = txtPassword.text!
        
        FrenchVerbAPI.signIn(email: email, password: password) { token,name in
            
            Context.loggedUserToken = token
            self.name = name
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: Segue.toViewController, sender: self)
            }
            
        } failHandler: { httpStatusCode, errorMessage in
            DispatchQueue.main.async {
                Toast.ok(view: self, title: "An error occurred", message: errorMessage)
            }
        }
    }
    
    @IBAction func btnRevealTouchUpInside(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func btnRevealTouchDown(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    
    func passSignUpInformation(_ email: String, _ password: String) {
        txtEmail.text = email
        txtPassword.text = password
    }
}
