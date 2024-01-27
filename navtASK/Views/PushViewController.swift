//
//  PushViewController.swift
//  navtASK
//
//  Created by Arthur Sh on 27.01.2024.
//

import UIKit

class PushViewController: UIViewController {
    
    private lazy var popView: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "pop to sheet"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemPink
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(popViewTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var pushView: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "push to first sheet"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemPink
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(pushViewTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(pushView)
        view.addSubview(popView)
        setLayouts()
    }
    
    
    private func setLayouts() {
        NSLayoutConstraint.activate([
            popView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pushView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushView.centerYAnchor.constraint(equalTo: popView.bottomAnchor, constant:  100 )
        ])
    }
    
    @objc
    private func popViewTapped() {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @objc
    private func pushViewTapped() {
        let vc = ViewController()
        
        if let foundNavigation = navigationController {
            
            print("found navigation")
            
            foundNavigation.pushViewController(vc, animated: true)
        } else {
            print("did not found navigation")
        }
    }
}
