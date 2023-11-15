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
    private let textFieldsButtonStack = UIStackView()
    private let connectButton = UIButton(type: .system)
    private let signUpButton = UIButton(type: .system)
    
    private let welcomeLabel = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let forgotPasswordButton = UIButton(type: .system)
    private let resendEmailButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        setViewConstraints()
        stylizeViews()
    }
    
    func addSubviews() {
        view.addSubview(headerStack)
        view.addSubview(profileImage)
        view.addSubview(textFieldsStack)
        view.addSubview(textFieldsButtonStack)
        view.addSubview(signUpButton)
        view.addSubview(connectButton)
        
        headerStack.addArrangedSubview(welcomeLabel)
        headerStack.addArrangedSubview(nameLabel)
        headerStack.addArrangedSubview(descriptionLabel)
        textFieldsStack.addArrangedSubview(emailTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)
        textFieldsButtonStack.addArrangedSubview(forgotPasswordButton)
        textFieldsButtonStack.addArrangedSubview(resendEmailButton)
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
        textFieldsButtonStack.snp.makeConstraints { make in
            make.top.equalTo(textFieldsStack.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(80)
            make.right.equalToSuperview()
        }
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
        connectButton.snp.makeConstraints { make in
            make.bottom.equalTo(signUpButton.snp.bottom).inset(60)
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
        
        textFieldsStack.axis = .vertical
        textFieldsStack.spacing = 40
        
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont.systemFont(ofSize: 18)
        emailTextField.addTarget(self, action: #selector(asd(_:)), for: .editingChanged)
        addBottomBorder(to: emailTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: passwordTextField)
        
        textFieldsButtonStack.axis = .horizontal
        textFieldsButtonStack.spacing = 75
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.backgroundColor = .clear
        forgotPasswordButton.addTarget(
            self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside
        )
        
        resendEmailButton.setTitle("Resend email", for: .normal)
        resendEmailButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        resendEmailButton.backgroundColor = .clear
        resendEmailButton.addTarget(
            self, action: #selector(resendEmailButtonTapped), for: .touchUpInside
        )
        
        signUpButton.setTitle("Don't have account? Sing up", for: .normal)
        signUpButton.backgroundColor = .clear
        signUpButton.addTarget(
            self, action: #selector(signUpButtonTapped), for: .touchUpInside
        )
        
        connectButton.backgroundColor = UIColor.systemGreen
        connectButton.setTitle("Connect", for: .normal)
        connectButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        connectButton.setTitleColor(UIColor.white, for: .normal)
        connectButton.layer.cornerRadius = 12
        connectButton.addTarget(self, action: #selector(connectButtonTapped), for: .touchUpInside)
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
    
    @objc func connectButtonTapped() {
        print("buttonTapped()")
    }
    
    @objc func forgotPasswordButtonTapped() {
        print("forgotPasswordButtonTapped()")
    }
    
    @objc func resendEmailButtonTapped() {
        print("resendEmailButtonTapped()")
    }

    @objc func signUpButtonTapped() {
        print("registrationButtonTapped()")
    }
    
    @objc func asd(_ textField: UITextField) {
        print("asd")
    }
}

