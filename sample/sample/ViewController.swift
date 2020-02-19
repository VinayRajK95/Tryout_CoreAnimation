//
//  ViewController.swift
//  sample
//
//  Created by Vinay Raj K on 30/07/19.
//  Copyright © 2019 Vinay Raj K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var loading : CustomLoader!
    
    var loading : WebLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading = WebLoader()
        view.addSubview(loading)
        addConstraints()
        loading.startAnimation()
        
//        loading = CustomLoader(frame: CGRect.zero)
//        view.addSubview(loading)
//        addConstraints()
//        loading.backgroundColor = UIColor.cyan
//        loading.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    func addConstraints() {
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),loading.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        loading.layoutSubviews()
    }

}

