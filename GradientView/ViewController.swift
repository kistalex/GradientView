//
//
// GradientView
// ViewController.swift
//
// Created by Alexander Kist on 04.07.2023.
//


import UIKit
import Foundation

class ViewController: UIViewController {
    
    private let gradientView = UIView()
    private  let gradientLayer = CAGradientLayer()
    
    private let cornerRadius: CGFloat = 20
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupGradientView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
       setupGradientLayer()
    }
    
    private func setupGradientView(){
               
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        gradientView.layer.cornerRadius = cornerRadius
        
        gradientView.layer.shadowColor = UIColor.black.cgColor
        gradientView.layer.shadowOpacity = 0.8
        gradientView.layer.shadowOffset = CGSize(width: 0, height: 0)
        gradientView.layer.shadowRadius = 20
                
    }
    
    private func setupGradientLayer(){
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.shouldRasterize = true
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.cornerRadius = cornerRadius
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 120),
            gradientView.widthAnchor.constraint(equalTo: gradientView.heightAnchor)
        ])

    }
}

