//
//  AlertSheetController.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class AlertSheetController: UIViewController {
    
    private let actionButton: CustomButton = {
        let button = CustomButton(title: "Login")
        button.heightAnchor.constraint(equalToConstant: 53).isActive = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "64x64"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stack = VerticalStack([
        imageView,
        UILabel(text: "Password Reset Confirmation", .title1, .textPrimary, alignment: .center, nLines: 0),
        UILabel(text: "An email has been sent to blabla@gmail.com with further instructions.", .title2medium, .textSecondary, alignment: .center, nLines: 0),
        actionButton
    ], spacing: 24)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stack)
        stack.alignment = .fill
        
        stack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(36)
        }
        let panGesture = UITapGestureRecognizer(target: nil, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePan() {
        print("panning")
    }
    

}
