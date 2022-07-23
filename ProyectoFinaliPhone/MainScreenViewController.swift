//
//  MainScreenViewController.swift
//  ProyectoFinaliPhone
//
//  Created by Michael on 22/07/22.
//

import UIKit

class MainScreenViewController: UIViewController{
    
    @IBOutlet weak var emailLabel: UILabel!
    private let email: String
    
    init(email: String){
        self.email = email
        super.init(nibName: "MainScreenViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inicio"
        emailLabel.text = email
    }
}
