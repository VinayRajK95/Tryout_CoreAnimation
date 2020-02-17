//
//  ViewController.swift
//  sample
//
//  Created by Vinay Raj K on 30/07/19.
//  Copyright © 2019 Vinay Raj K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loading : CustomLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading = CustomLoader(frame: CGRect.zero)
        view.addSubview(loading)
        addConstraints()
        loading.backgroundColor = UIColor.cyan
        loading.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    func addConstraints() {
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),loading.widthAnchor.constraint(equalToConstant: 100),loading.heightAnchor.constraint(equalToConstant: 100)])
        loading.layoutSubviews()
    }

}

