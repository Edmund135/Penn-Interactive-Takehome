//
//  PITDataLoadingVC.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-07-01.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

class PITDataLoadingVC: UIViewController {

    lazy var containerView: UIView = {
        var containerView = UIView()
        containerView.frame = view.bounds
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        return containerView
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    func presentLoadingView() {
        view.addSubview(containerView)
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }
        containerView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }

    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
        }
    }
}
