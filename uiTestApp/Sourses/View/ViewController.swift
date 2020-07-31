//
//  ViewController.swift
//  uiTestApp
//
//  Created by Diana Tsarkova on 30.07.2020.
//  Copyright © 2020 Diana Tsarkova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Private Properties
    private var commonStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 9
        return stack
    }()
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.48
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.backgroundColor = AppColor.liteGray
        return view
    }()
    private var buttonsStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    private var securityButton = CustomButton()
    private var speedButton = CustomButton()
    private var manualButton = CustomButton()
    private var infoCardView = CardView()
    private var button = CustomButton()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    // MARK: - Private Methods
    private func configureView() {
        view.backgroundColor = AppColor.background
        if #available(iOS 13.0, *) {
            view.overrideUserInterfaceStyle = .light
        }
        configureNavigationBar()
        addSubviews()
        configureSubviews()
        configureAnchors()
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: prepareButton(name: "others", to: #selector(leftButtonTapped)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: prepareButton(name: "info", to: #selector(rightButtonTapped)))
    }
    
    private func addSubviews() {
        view.addSubview(commonStackView.prepare())
        view.insertSubview(backView.prepare(), at: 0)
        commonStackView.addArrangedSubview(logoImageView.prepare())
        commonStackView.addArrangedSubview(buttonsStack.prepare())
        commonStackView.addArrangedSubview(infoCardView.prepare())
        commonStackView.addArrangedSubview(button.prepare())
        
        buttonsStack.addArrangedSubview(securityButton.prepare())
        buttonsStack.addArrangedSubview(speedButton.prepare())
        buttonsStack.addArrangedSubview(manualButton.prepare())
        
        
    }
    
    private func configureSubviews() {
        logoImageView.image = UIImage(named: "shield")
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.configure(active: false, text: "Manage", green: true)
        securityButton.configure(active: true, text: "Security")
        speedButton.configure(active: false, text: "Speed Up")
        manualButton.configure(active: false, text: "Manual")
    }
    
    private func configureAnchors() {
        commonStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        commonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        commonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24).isActive = true
        commonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -24).isActive = true
        buttonsStack.leadingAnchor.constraint(equalTo: commonStackView.leadingAnchor).isActive = true
        buttonsStack.trailingAnchor.constraint(equalTo: commonStackView.trailingAnchor).isActive = true
        backView.pin(to: buttonsStack)
        button.leadingAnchor.constraint(equalTo: commonStackView.leadingAnchor).isActive = true
    }
    
    private func prepareButton(name image: String, to selector: Selector) -> UIButton {
        let image = UIImage(named: image)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    // MARK: - Objc Methods
    @objc func leftButtonTapped() {
        // logic
    }
    @objc func rightButtonTapped() {
        // logic
    }
    @objc func buttonPressed() {
        // logic
    }
}
