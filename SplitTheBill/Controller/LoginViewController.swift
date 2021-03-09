//
//  LoginViewController.swift
//  SplitTheBill
//
//  Created by Jaival Bhuptani on 2021-02-25.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender: UIButton) {
        if let e = email.text, let p = pass{
            Auth.auth().signIn(withEmail: e, password: p.text!) { (authRes, error) in
                if let e = error{
                    print("error \(e)")
                }
                else{
                    self.performSegue(withIdentifier: "LoginToEvent", sender: self)
                }
            }
    }
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventsViewController{
            destination.userEmail = email.text ?? "eg@123.com"
        }
    }
}