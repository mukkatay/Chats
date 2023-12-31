//
//  ViewController.swift
//  Chats
//
//  Created by Akyl Mukatay  on 25.11.2023.
//

import UIKit
import SnapKit
import ProgressHUD

class LoginViewController: UIViewController {
    private let headerStack = UIStackView()
    private let profileImage = UIImageView()
    private let emailTextFieldStack = UIStackView()
    private let passwordTextFieldStack = UIStackView()
    private let repeatPasswordTextFieldStack = UIStackView()
    private let textFieldsButtonStack = UIStackView()
    private let connectButton = UIButton(type: .system)
    private let signUpButton = UIButton(type: .system)
    
    private let welcomeLabel = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let repeatPasswordLabel = UILabel()
    private let repeatPasswordTextField = UITextField()
    private let forgotPasswordButton = UIButton(type: .system)
    private let resendEmailButton = UIButton(type: .system)
    
    var isLogin = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        setViewConstraints()
        stylizeViews()
        
        updateUIFor(login: isLogin)
        setupTextFieldDelegates()
        setupBackgroundTap()
    }
    
    //MARK: -- Add subviews
    func addSubviews() {
        view.addSubview(headerStack)
        view.addSubview(profileImage)
        view.addSubview(emailTextFieldStack)
        view.addSubview(passwordTextFieldStack)
        view.addSubview(repeatPasswordTextFieldStack)
        view.addSubview(textFieldsButtonStack)
        view.addSubview(signUpButton)
        view.addSubview(connectButton)
        
        headerStack.addArrangedSubview(welcomeLabel)
        headerStack.addArrangedSubview(nameLabel)
        headerStack.addArrangedSubview(descriptionLabel)
        emailTextFieldStack.addArrangedSubview(emailLabel)
        emailTextFieldStack.addArrangedSubview(emailTextField)
        passwordTextFieldStack.addArrangedSubview(passwordLabel)
        passwordTextFieldStack.addArrangedSubview(passwordTextField)
        repeatPasswordTextFieldStack.addArrangedSubview(repeatPasswordLabel)
        repeatPasswordTextFieldStack.addArrangedSubview(repeatPasswordTextField)
        textFieldsButtonStack.addArrangedSubview(forgotPasswordButton)
        textFieldsButtonStack.addArrangedSubview(resendEmailButton)
    }
    
    //MARK: -- Setup constraints
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
        emailTextFieldStack.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(32)
            make.left.equalToSuperview().inset(80)
            make.right.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        passwordTextFieldStack.snp.makeConstraints { make in
            make.top.equalTo(emailTextFieldStack.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(80)
            make.right.equalToSuperview()
        }
        passwordLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        repeatPasswordTextFieldStack.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFieldStack.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(80)
            make.right.equalToSuperview()
        }
        repeatPasswordLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        textFieldsButtonStack.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextFieldStack.snp.bottom).offset(16)
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
    
    //MARK: -- Setup views
    func stylizeViews() {
        headerStack.axis = .vertical
        headerStack.spacing = 4
        
        welcomeLabel.text = "Welcome to"
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        
        nameLabel.text = "Chats"
        nameLabel.font = UIFont.systemFont(ofSize: 46, weight: .bold)
        nameLabel.textColor = .purple
        
        descriptionLabel.text = "Enter the following details and get connected..."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .systemGray
        
        profileImage.image = UIImage(named: "User1")
        profileImage.layer.cornerRadius = 16
        profileImage.clipsToBounds = true
        
        emailTextFieldStack.axis = .vertical
        emailTextFieldStack.spacing = 8
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: emailTextField)
        
        passwordTextFieldStack.axis = .vertical
        passwordTextFieldStack.spacing = 8
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: passwordTextField)
        
        repeatPasswordTextFieldStack.axis = .vertical
        repeatPasswordTextFieldStack.spacing = 8
        repeatPasswordLabel.font = UIFont.systemFont(ofSize: 16)
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.isSecureTextEntry = true
        repeatPasswordTextField.font = UIFont.systemFont(ofSize: 18)
        addBottomBorder(to: repeatPasswordTextField)
        
        textFieldsButtonStack.axis = .horizontal
        textFieldsButtonStack.spacing = 75
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.backgroundColor = .clear
        forgotPasswordButton.addTarget(
            self, action: #selector(forgotPasswordButtonTapped(_:)), for: .touchUpInside
        )
        
        resendEmailButton.setTitle("Resend email", for: .normal)
        resendEmailButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        resendEmailButton.backgroundColor = .clear
        resendEmailButton.addTarget(
            self, action: #selector(resendEmailButtonTapped(_:)), for: .touchUpInside
        )
        
        signUpButton.setTitle("Don't have account? Sing up", for: .normal)
        signUpButton.backgroundColor = .clear
        signUpButton.addTarget(
            self, action: #selector(signUpButtonTapped(_:)), for: .touchUpInside
        )
        
        connectButton.backgroundColor = UIColor.systemGreen
        connectButton.setTitle("Connect", for: .normal)
        connectButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        connectButton.setTitleColor(UIColor.white, for: .normal)
        connectButton.layer.cornerRadius = 12
        connectButton.addTarget(self, action: #selector(connectButtonTapped(_:)), for: .touchUpInside)
    }
    
    //MARK: -- Setup button actions
    @objc func connectButtonTapped(_ sender: Any) {
        if isDataInputedFor(type: isLogin ? "Connect" : "Register") {
           //login or register
            print("have data for login/register")
        } else {
            ProgressHUD.failed("All Fields are required")
        }
    }
    
    @objc func forgotPasswordButtonTapped(_ sender: Any) {
        if isDataInputedFor(type: "Password") {
           //reset password
            print("have data for forgot password")
        } else {
            ProgressHUD.failed("Email is required")
        }
    }
    
    @objc func resendEmailButtonTapped(_ sender: Any) {
        if isDataInputedFor(type: "Password") {
            //resend varification Email
            print("have data for resend email")
        } else {
            ProgressHUD.failed("Email is required")
        }
    }

    @objc func signUpButtonTapped(_ sender : UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Have an account? Log in")
        isLogin.toggle()
    }
    
    //MARK: -- Setup
    private func setupTextFieldDelegates() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updatePlaceholderLabels(textField: textField)
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap() {
        view.endEditing(false)
    }
    
    private func addBottomBorder(to textField: UITextField) {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        textField.addSubview(lineView)
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    //MARK: -- Animations
    private func updateUIFor(login: Bool) {
        connectButton.setTitle(login ? "Connect" : "Register", for: .normal)
        signUpButton.setTitle(login ? "Don't have account? Sing up" : "Have an account? Log in", for: .normal)
        
        UIView.animate(withDuration: 0.3) {
            self.repeatPasswordTextField.isHidden = login
            self.repeatPasswordLabel.isHidden = login
        }
    }
    
    private func updatePlaceholderLabels(textField: UITextField) {
        switch textField {
        case emailTextField:
            emailLabel.text = textField.hasText ? "Email" : ""
        case passwordTextField:
            passwordLabel.text = textField.hasText ? "Password" : ""
        case repeatPasswordTextField:
            repeatPasswordLabel.text = textField.hasText ? "Repeat password" : ""
        default:
            break
        }
    }
    
    //MARK: -- Helpers
    private func isDataInputedFor(type: String) -> Bool {
        switch type {
        case "Connect":
            return emailTextField.text != "" && passwordTextField.text != ""
        case "Register":
            return emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != ""
        default:
            return emailTextField.text != ""
        }
    }
}

