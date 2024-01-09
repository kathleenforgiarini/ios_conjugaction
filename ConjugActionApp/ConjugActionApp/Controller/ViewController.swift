//
//  ViewController.swift
//  ConjugActionApp
//
//  Created by Bruno Lopes, Bonnie Ives and Kathleen Forgiarini on 2023-10-04.
//

import UIKit

class ViewController: UIViewController {
    
    var username: String?
    var verbFromAPI: FrenchVerb!
    
    @IBOutlet weak var lblGreetings: UILabel!
    @IBOutlet weak var txtInputVerb: UITextField!
    @IBOutlet weak var btnConjuguerUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize(){
        
        btnConjuguerUIButton.layer.cornerRadius = 25
        btnConjuguerUIButton.layer.shadowColor = UIColor.gray.cgColor
        btnConjuguerUIButton.layer.shadowOpacity = 0.8
        btnConjuguerUIButton.layer.shadowOffset = .init(width: 5, height: 5)
        
        txtInputVerb.text = "aimer"
        lblGreetings.text = "Bonjour " + username!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toConjugationPage{
            
            (segue.destination as! ConjugationPageViewController).verb = txtInputVerb.text
            (segue.destination as! ConjugationPageViewController).verbFromAPI = self.verbFromAPI
        }
    }
    
    
    @IBAction func btnConjuguerTouchUpInside(_ sender: Any) {
        
        FrenchVerbAPI.getVerb(verb: txtInputVerb.text!) { verb in
            
            DispatchQueue.main.async {
                self.verbFromAPI = verb

                self.performSegue(withIdentifier: Segue.toConjugationPage, sender: self)
            }
            
        } failHandler: { httpStatusCode, errorMessage in
            
            DispatchQueue.main.async {
                
                Toast.ok(view: self, title: "An error occurred", message: errorMessage)

            }
        }
    }
}
