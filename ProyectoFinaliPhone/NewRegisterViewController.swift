//
//  NewRegisterViewController.swift
//  ProyectoFinaliPhone
//
//  Created by Michael on 22/07/22.
//

import UIKit
import Firebase
class NewRegisterViewController: UIViewController{
    
    @IBOutlet private weak var anchorBottomScroll: NSLayoutConstraint!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.registerKeyboardNotification()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.unregisterKeyboardNotification()
        }
    
    @IBAction func signUpButtonAction(_ sender: Any){
        
        
    }
    
}

//MARK: Keyboard Events
extension NewRegisterViewController{
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func unregisterKeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    @objc private func keyboardWillShow(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect ?? .zero
        UIView.animate(withDuration: animationDuration){
            self.anchorBottomScroll.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    @objc private func keyboardWillHide(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration){
            self.anchorBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

