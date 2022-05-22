//
//  RegisterViewController.swift
//  ProyectoFinaliPhone
//
//  Created by Michael on 21/05/22.
//

import UIKit

class ProyectoFinaliPhone: UIViewController{
    
}

extension ProyectoFinaliPhone{
    override func viewDidLoad() {
        super.viewDidLoad()
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

//MARK - Keyboard Events
extension ProyectoFinaliPhone{
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func unregisteredKeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
    
    }
    @objc private func keyboardWillHide(_ notification: Notification){
        
    }
}
