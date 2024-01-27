//
//  ViewController.swift
//  navtASK
//
//  Created by Arthur Sh on 27.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var openSheet: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Open sheet"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemOrange
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(openSheetTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(openSheet)
        setLayouts()
        
    }
    
    private func setLayouts() {
        NSLayoutConstraint.activate([
            openSheet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openSheet.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    private func openSheetTapped() {
        let pushSheetVc = SheetViewController()
        let navigation = UINavigationController(rootViewController: pushSheetVc)
        
        if let sheet = pushSheetVc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(navigation, animated: true)
    }
    
    
}

