//
//  SheetViewController.swift
//  navtASK
//
//  Created by Arthur Sh on 27.01.2024.
//

import UIKit

class SheetViewController: UIViewController {
    
    private lazy var pushView: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Push to 3rd view"
        config.baseForegroundColor = .magenta
        config.baseBackgroundColor = .white
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
        let pushVc = PushViewController()
        
        if let foundNavigation = navigationController { // нашел навигацию на которую можно сделать пуш следующего vc , если вернётся nil - это значит что текущий vc не в навигационном стэке.
            print("нашел навигацию")
            foundNavigation.pushViewController(pushVc, animated: true) // pushVc добавляется в стэк для возможности вернуться.
        }
        }
}
