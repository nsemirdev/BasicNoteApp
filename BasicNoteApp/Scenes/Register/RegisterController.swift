//
//  RegisterController.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class RegisterController: UIViewController {
    private let labelsStack = VerticalStack([
        UILabel(text: "Sign Up", .title1, .textPrimary),
        UILabel(text: "Login or sign up to continue using our app.", .title3, .textSecondary)
    ], spacing: 16)
    
    private let inputStack = InputStack(
        [InputArea(.name), InputArea(.email), InputArea(.password)]
    )

    private let forgotButton = UIButton(title: "Forgot Password?", textColor: .textPrimary, font: .title4medium)
    private lazy var forgotPassword = HorizontalStack([UIView(), forgotButton])
    private let signUpButton = CustomButton(title: "Sign Up")
    private let signInButton = UIButton(title: "Sign in now", textColor: .purple100, font: .title3medium)
    
    private lazy var overallStack = VerticalStack([
        labelsStack, inputStack, bottomStack
    ], spacing: 30)
    
    private lazy var bottomStack = VerticalStack([forgotPassword, signUpButton], spacing: 12)
    
    private lazy var toSignInStack = HorizontalStack([
        UILabel(text: "Already have an account?", .title3medium, .textSecondary), signInButton
    ], spacing: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputStack.delegate = self
        setupViews()
        setupGesture()
        setupButtons()
    }
    
    private func setupButtons() {
        signInButton.addTarget(self, action: #selector(handleTapSignInButton), for: .touchUpInside)
        forgotButton.addTarget(self, action: #selector(handleForgotButton), for: .touchUpInside)
        signUpButton.isEnabled = false
    }
    
    private func setupGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap() { view.endEditing(true) }
    
    @objc private func handleTapSignInButton() {
        let destVC = LoginController()
        destVC.modalPresentationStyle = .fullScreen
        destVC.modalTransitionStyle = .flipHorizontal
        present(destVC, animated: true)
    }
    
    @objc private func handleForgotButton() {
        presentVC(from: self, to: ForgotPasswordController())
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

extension RegisterController: InputStackDelegate {
    func didValidForm() { signUpButton.isEnabled = true }
    func didInvalidForm() { signUpButton.isEnabled = false }
}
