//
//  QRViewController.swift
//  DimzIdCard
//
//  Created by Dimas Aristyo Rahadian on 29/11/23.
//

import UIKit

class QRViewController: UIViewController{
    
    //Variable declaration
    private var mainBg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MainBg")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private var secondBg: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .black
        rectangle.layer.cornerRadius = 10
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        
        return rectangle
    }()
    
    private var qrImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bigQrCode")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .white
        
        //Adding the subviews
        subviews()
        
        //Setup Constraints
        setupView()
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func subviews(){
        view.addSubview(mainBg)
        view.addSubview(secondBg)
        
        secondBg.addSubview(qrImage)
    }
    
    private func setupView(){
        NSLayoutConstraint.activate([
            //Main background
            mainBg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainBg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainBg.topAnchor.constraint(equalTo: view.topAnchor),
            mainBg.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //Second background
            secondBg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 94),
            secondBg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -94),
            secondBg.topAnchor.constraint(equalTo: view.topAnchor, constant: 43),
            secondBg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -43),
            
            //Big QR
            qrImage.centerXAnchor.constraint(equalTo: secondBg.centerXAnchor),
            qrImage.centerYAnchor.constraint(equalTo: secondBg.centerYAnchor),
            qrImage.widthAnchor.constraint(equalToConstant: 260),
            qrImage.heightAnchor.constraint(equalToConstant: 260),
        ])
    }
}
