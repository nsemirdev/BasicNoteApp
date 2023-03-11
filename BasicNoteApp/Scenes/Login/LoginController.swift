//
//  LoginController.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class LoginController: UIViewController, InputStackDelegate {
    func didValidForm() {
        loginButton.isEnabled = true
    }
    
    func didInvalidForm() {
        loginButton.isEnabled = false
    }
    
    private let labelsStack = VerticalStack([
        UILabel(text: "Login", .title1, .textPrimary, alignment: .center),
        UILabel(text: "Login or sign up to continue using our app.", .title3, .textSecondary, alignment: .center)
    ], spacing: 16)
    
    private let forgotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.textPrimary, for: .normal)
        button.titleLabel?.font = .title4medium
        return button
    }()
    
    private lazy var forgotPassword = HorizontalStack([
        UIView(), forgotButton
    ])
    
    private let loginButton: CustomButton = {
        let button = CustomButton(title: "Login")
        button.heightAnchor.constraint(equalToConstant: 53).isActive = true
        button.isEnabled = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let inputStack = InputStack([InputArea(.email), InputArea(.password)])
    private let signUpButton = UIButton(title: "Sign up now", textColor: .purple100, font: .title3medium)

    private lazy var toSignInStack = HorizontalStack([
        UILabel(text: "New user?", .title3medium, .textSecondary),
        signUpButton
    ], spacing: 2)
    
    private lazy var overallStack = VerticalStack([
        labelsStack, inputStack, bottomStack
    ], spacing: 30)
    
    private lazy var bottomStack = VerticalStack([
        forgotPassword, loginButton
    ], spacing: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputStack.delegate = self
        inputStack.resultArray[.name] = true
        setupViews()
        setupGesture()
        signUpButton.addTarget(self, action: #selector(handleTapSignUpButton), for: .touchUpInside)
    }
    
    private func setupGesture() {
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleTap))
        )
    }
    
    @objc private func handleTap() { view.endEditing(true) }
    @objc private func handleTapSignUpButton() {
        let destVC = RegisterController()
        destVC.modalPresentationStyle = .fullScreen
        destVC.modalTransitionStyle = .flipHorizontal
        present(destVC, animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews(overallStack, toSignInStack)
        labelsStack.alignment = .center
                
        overallStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        toSignInStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
}
