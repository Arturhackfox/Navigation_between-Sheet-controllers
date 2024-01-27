//
//  PushViewController.swift
//  navtASK
//
//  Created by Arthur Sh on 27.01.2024.
//

import UIKit

class PushViewController: UIViewController {
    
    private lazy var pushView: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "pop to sheet"
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
        setLayouts()
    }
    
    
    private func setLayouts() {
        NSLayoutConstraint.activate([
            pushView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    private func pushViewTapped() {
        let pushView = ViewController()
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
}
