//
//  ViewController.swift
//  SkillBox13
//
//  Created by Илья Лобков on 12/10/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonAuthor: UIButton!
    @IBOutlet weak var bottonStandartTools: UIButton!
    @IBOutlet weak var buttonAkamofire: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        buttonAuthor.layer.cornerRadius = 10
        buttonAuthor.layer.borderWidth = 1
        buttonAuthor.layer.borderColor = UIColor.white.cgColor
        
        bottonStandartTools.layer.cornerRadius = 10
        bottonStandartTools.layer.borderWidth = 1
        bottonStandartTools.layer.borderColor = UIColor.white .cgColor
        
        buttonAkamofire.layer.cornerRadius = 10
        buttonAkamofire.layer.borderWidth = 1
        buttonAkamofire.layer.borderColor = UIColor.white .cgColor
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
    }
    
}



