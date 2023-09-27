//
//  ViewController.swift
//  Chats
//
//  Created by Akyl Mukatay  on 25.09.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let headerStack = UIStackView()
    private let profileImage = UIImageView()
    private let textFieldsStack = UIStackView()
    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    func configure() {
        view.addSubview(headerStack)
        let welcomeLabel = UILabel()
        let nameLabel = UILabel()
        let descriptionLabel = UILabel()
        headerStack.addArrangedSubview(welcomeLabel)
        headerStack.addArrangedSubview(nameLabel)
        headerStack.addArrangedSubview(descriptionLabel)
        headerStack.axis = .vertical
        headerStack.spacing = 4
        headerStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().inset(40)
            make.width.equalTo(200)
        }
        
        welcomeLabel.text = "Welcome to"
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        
        nameLabel.text = "Chats"
        nameLabel.font = UIFont.systemFont(ofSize: 46, weight: .bold)
        
        descriptionLabel.text = "Enter the following details and get connected..."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .systemGray
        
        view.addSubview(profileImage)
        profileImage.image = UIImage(named: "user1")
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom).offset(64)
            make.left.equalToSuperview().inset(80)
            make.width.height.equalTo(90)
        }
        profileImage.layer.cornerRadius = 16
        profileImage.clipsToBounds = true
        
        view.addSubview(textFieldsStack)
        let loginTextField = UITextField()
        let passwordTextField = UITextField()
        textFieldsStack.addArrangedSubview(loginTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)
        textFieldsStack.axis = .vertical
        textFieldsStack.spacing = 40
        textFieldsStack.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(32)
            make.left.equalToSuperview().inset(80)
            make.right.equalToSuperview()
        }
        loginTextField.placeholder = "Login"
        loginTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: loginTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: passwordTextField)
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(80)
            make.left.right.equalToSuperview().inset(96)
            make.height.equalTo(48)
        }
        button.backgroundColor = UIColor.systemGreen
        button.setTitle("Connect", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func addBottomBorder(to textField: UITextField) {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        textField.addSubview(lineView)
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    @objc func buttonTapped() {
        print("buttonTapped()")
    }


}

