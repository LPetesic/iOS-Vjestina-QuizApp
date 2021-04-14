//
//  LoginViewController.swift
//  QuizApp
//
//  Created by five on 14.04.2021..
//

import Foundation
import UIKit

class LoginViewController :
    UIViewController{
    
    class LoginView: UIView {
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: 200, height: 100)
        }
        
    }
    
    
    let disFTop : Int = 50
    private var username : String = "!"
    private var password : String = "_"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        var loginView = LoginView()
        view.addSubview(loginView)
        addElements(targetView : loginView)
        
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    private func addElements(targetView : UIView){
        let label = UILabel(frame: CGRect(x: 0, y: -50, width: 200, height: 30 ))
        label.text = "Pop Quiz :O"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        
        let emailTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200
                                                       , height: 30 ))
            
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = .white
        emailTextField.textColor = .black
        emailTextField.borderStyle = .roundedRect
        
        
        
        let passwordTextField = UITextField(frame: CGRect(x: 0, y: 50 , width: 200, height: 30 ))
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: 100 , width: 200, height: 30 ))
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .white
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 5
        
        emailTextField.addTarget(self, action: #selector(saveEmail(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(savePassword(sender:)), for: .editingChanged)
        

        loginButton.addTarget(self, action: #selector(highlight(sender:)), for: .touchDown)
        loginButton.addTarget(self, action: #selector(login(sender:)), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(highlightOff(sender:)), for: .touchUpOutside)
        
        
        targetView.addSubview(label)
        targetView.addSubview(emailTextField)
        targetView.addSubview(passwordTextField)
        targetView.addSubview(loginButton)
        
        
        
            }
    @objc
    func highlight(sender : UIButton){
        sender.backgroundColor = .lightGray
    }
    @objc
    func highlightOff(sender : UIButton){
        sender.backgroundColor = .white
    }
    @objc
    func saveEmail(sender : UITextField){
        username = sender.text!
    }
    @objc
    func savePassword(sender : UITextField){
        password = sender.text!
    }
    @objc
    func login(sender: UIButton){
        sender.backgroundColor = .white
        view.backgroundColor = .red
        //let result : LoginStatus = DataService.init().login(email: username, password: password)
        
        //bypassing enums because I couldn't figure out how to compare values in two enums
        if (username == "ios-vjestina@five.agency" && password == "password"){
            print("Sucess for email \(username) and password \(password)")
        } else {
            print("Error 400, Bad request for email \(username) and password \(password)")
        }
    }
        
}
