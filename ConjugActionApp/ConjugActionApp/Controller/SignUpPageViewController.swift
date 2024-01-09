//
//  SignUpPageViewController.swift
//  ConjugActionApp
//
//  Created by Bruno Lopes on 2023-11-22.
//

import UIKit

protocol passSignUpInformation {
    
    func passSignUpInformation(_ email : String, _ password : String)
}

class SignUpPageViewController: UIViewController{
    
    public var delegate : passSignUpInformation?
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize(){
        btnSignUp.layer.cornerRadius = 25
        txtPassword.isSecureTextEntry = true
    }
    
    @IBAction func btnShowPasswordTouchUpInside(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    @IBAction func btnShowPasswordTouchDown(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func btnSignUpTouchUpInside(_ sender: Any) {
        let email = txtEmail.text!.lowercased()
        let name = txtName.text!
        let password = txtPassword.text!
        
        if email.isEmpty{
            Toast.ok(view: self, title: "Error", message: "E-mail can not be empty")
        }
        else if name.isEmpty{
            Toast.ok(view: self, title: "Error", message: "Name can not be empty")
        }
        else if password.isEmpty{
            Toast.ok(view: self, title: "Error", message: "Password can not be empty")
        }
        else {
            FrenchVerbAPI.signUp(name: name, email: email, password: password) { id in

                DispatchQueue.main.async{
                    if self.delegate != nil {
                        self.navigationController?.popViewController(animated: true)
                        self.delegate!.passSignUpInformation(email, password)
                    }
                }
            } failHandler: { httpStatusCode, errorMessage in
                DispatchQueue.main.async{
                    Toast.ok(view: self, title: "An error ocurred", message: errorMessage)
                }
            }
        }
    }
}
