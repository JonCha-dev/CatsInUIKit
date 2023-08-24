//
//  ViewController.swift
//  CatsInUIKit
//
//  Created by Jon Chang on 8/23/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadHomeView()
    }

    func loadHomeView() {
        let hostingVC = UIHostingController(rootView: HomeView())
        
        addChild(hostingVC)
        view.addSubview(hostingVC.view)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingVC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingVC.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingVC.didMove(toParent: self)
    }
    
    
}

