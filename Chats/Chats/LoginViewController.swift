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
    private let registrationButton = UIButton(type: .system)
    
    private let welcomeLabel = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        setViewConstraints()
        stylizeViews()
    }
    
    func addSubviews() {
        view.addSubview(headerStack)
        headerStack.addArrangedSubview(welcomeLabel)
        headerStack.addArrangedSubview(nameLabel)
        headerStack.addArrangedSubview(descriptionLabel)
        
        view.addSubview(profileImage)
        view.addSubview(textFieldsStack)
        view.addSubview(registrationButton)
        view.addSubview(button)
    }
    
    func setViewConstraints() {
        headerStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().inset(40)
            make.width.equalTo(200)
        }
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom).offset(64)
            make.left.equalToSuperview().inset(80)
            make.width.height.equalTo(90)
        }
        textFieldsStack.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(32)
            make.left.equalToSuperview().inset(80)
            make.right.equalToSuperview()
        }
        registrationButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.bottom.equalTo(registrationButton.snp.bottom).inset(60)
            make.left.right.equalToSuperview().inset(80)
            make.height.equalTo(48)
        }
    }
    
    func stylizeViews() {
        headerStack.axis = .vertical
        headerStack.spacing = 4
        
        welcomeLabel.text = "Welcome to"
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        
        nameLabel.text = "Chats"
        nameLabel.font = UIFont.systemFont(ofSize: 46, weight: .bold)
        
        descriptionLabel.text = "Enter the following details and get connected..."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .systemGray
        
        profileImage.image = UIImage(named: "user1")
        profileImage.layer.cornerRadius = 16
        profileImage.clipsToBounds = true
        
        textFieldsStack.addArrangedSubview(loginTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)
        textFieldsStack.axis = .vertical
        textFieldsStack.spacing = 40
        
        loginTextField.placeholder = "Login"
        loginTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: loginTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: passwordTextField)
        
        registrationButton.setTitle("Don't have account? Sing up", for: .normal)
        registrationButton.backgroundColor = .clear
        registrationButton.addTarget(
            self, action: #selector(registrationButtonTapped), for: .touchUpInside
        )
        
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

    @objc func registrationButtonTapped() {
        print("registrationButtonTapped()")
    }
}

