//
//  LoginViewController.swift
//  ProyectoFinaliPhone
//
//  Created by Michael on 21/05/22.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController{
    
    @IBOutlet private weak var viewContent: UIView!
    @IBOutlet private weak var anchorCenterContentY: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    
    
    @IBAction func logInButtonAction(_ sender: Any){
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                if error != nil{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error al intentar ingresar", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
                else
                {
                    let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                    
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
}


//MARK - Life Cycle
extension LoginViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotification()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisteredKeyboardNotification()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
//MARK - Action Events
extension LoginViewController{
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)

    }
}

//MARK - Keyboard Events
extension LoginViewController{
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func unregisteredKeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        if keyboardFrame.origin.y < self.viewContent.frame.maxY{
            UIView.animate(withDuration: animationDuration){
                self.anchorCenterContentY.constant = keyboardFrame.origin.y - self.viewContent.frame.maxY
                self.view.layoutIfNeeded()
            }
        }
    }
    @objc private func keyboardWillHide(_ notification: Notification){
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration){
            self.anchorCenterContentY.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
}
