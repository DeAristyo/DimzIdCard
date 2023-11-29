//
//  ViewController.swift
//  DimzIdCard
//
//  Created by Dimas Aristyo Rahadian on 28/11/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
    
    private var profileImageButton: UIButton = {
        let circleButton = UIButton()
        circleButton.setImage(UIImage(named: "profile"), for: .normal)
        circleButton.backgroundColor = .clear
        circleButton.translatesAutoresizingMaskIntoConstraints = false
        circleButton.layer.zPosition = 2
        circleButton.isUserInteractionEnabled = true
        circleButton.addTarget(self, action: #selector(nextToDetail(_:)), for: .touchUpInside)
        
        return circleButton
    }()
    
    private var qrImageButton: UIButton = {
        let imageButton = UIButton()
        imageButton.setImage(UIImage(named: "qrCode"), for: .normal)
        imageButton.backgroundColor = .clear
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.layer.zPosition = 2
        imageButton.isUserInteractionEnabled = true
        imageButton.addTarget(self, action: #selector(nextToQr(_:)), for: .touchUpInside)
        
        return imageButton
    }()
    
    private var shareButton: UIButton = {
        let shareBtn = UIButton()
        shareBtn.backgroundColor = .white
        shareBtn.setTitle("Share Card", for: .normal)
        shareBtn.setTitleColor(.black, for: .normal)
        shareBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        shareBtn.layer.zPosition = 2
        shareBtn.layer.cornerRadius = 8
        shareBtn.isUserInteractionEnabled = true
        shareBtn.addTarget(self, action: #selector(shareBusinessCard(_:)), for: .touchUpInside)
        
        return shareBtn
    }()
    
    private var hiText: UILabel = {
        let label = UILabel()
        label.text = "Hey I’am"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var nameText: UILabel = {
        let label = UILabel()
        label.text = "Dimas Aristyo R"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var workText: UILabel = {
        let label = UILabel()
        label.text = "Software Developer"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add subviews
        subviews()
        
        //Setup Constraints
        setupView()
    }
    
    func subviews(){
        view.addSubview(mainBg)
        view.addSubview(secondBg)
        
        //Load 4 images
        loadImages()
        
        //Second Bg
        secondBg.addSubview(profileImageButton)
        secondBg.addSubview(divider)
        secondBg.addSubview(workText)
        secondBg.addSubview(hiText)
        secondBg.addSubview(nameText)
        secondBg.addSubview(hStack)
        secondBg.addSubview(qrImageButton)
        secondBg.addSubview(shareButton)
    }
    
    @objc private func nextToQr(_ sender:UIButton){
        let vc: UIViewController = QRViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func nextToDetail(_ sender:UIButton){
        let vc: UIViewController = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func shareBusinessCard(_ sender:UIButton) {
        guard let businessCardImage = UIImage(named: "BusinessCard") else {
            print("Error: BusinessCard.jpg not found.")
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [businessCardImage], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    func loadImages() {
        let imageNames = ["swift", "js", "ts", "nodejs"]
        
        for imageName in imageNames {
            let iconImage = UIImageView(image: UIImage(named: imageName))
            iconImage.contentMode = .scaleAspectFill
            iconImage.clipsToBounds = true
            iconImage.widthAnchor.constraint(equalToConstant: 33).isActive = true
            iconImage.heightAnchor.constraint(equalToConstant: 33).isActive = true
            hStack.addArrangedSubview(iconImage)
        }
    }
    
    func setupView(){
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
            
            //profileImageButton
            profileImageButton.topAnchor.constraint(equalTo: secondBg.topAnchor, constant: 22),
            profileImageButton.bottomAnchor.constraint(equalTo: secondBg.bottomAnchor, constant: -39),
            profileImageButton.trailingAnchor.constraint(equalTo: secondBg.trailingAnchor, constant: -27.3),
            profileImageButton.widthAnchor.constraint(equalToConstant: 225.78),
            
            //hiText
            hiText.topAnchor.constraint(equalTo: secondBg.topAnchor, constant: 33),
            hiText.leadingAnchor.constraint(equalTo: secondBg.leadingAnchor, constant: 30),
            hiText.trailingAnchor.constraint(equalTo: profileImageButton.leadingAnchor, constant: -50),
            
            //nameText
            nameText.topAnchor.constraint(equalTo: hiText.bottomAnchor, constant: -5),
            nameText.leadingAnchor.constraint(equalTo: secondBg.leadingAnchor, constant: 30),
            nameText.trailingAnchor.constraint(equalTo: profileImageButton.leadingAnchor, constant: -10),
            
            //Divider constraint
            divider.heightAnchor.constraint(equalToConstant: 3),
            divider.leadingAnchor.constraint(equalTo: secondBg.leadingAnchor, constant: 30),
            divider.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 10),
            divider.widthAnchor.constraint(equalToConstant: 130),
            
            //workText
            workText.topAnchor.constraint(equalTo: nameText.topAnchor, constant: 15),
            workText.leadingAnchor.constraint(equalTo: divider.trailingAnchor, constant: 10),
            workText.trailingAnchor.constraint(equalTo: profileImageButton.leadingAnchor, constant: -10),
            workText.heightAnchor.constraint(equalToConstant: 103),
            
            //hstack
            hStack.topAnchor.constraint(equalTo: divider.topAnchor, constant: 25),
            hStack.leadingAnchor.constraint(equalTo: secondBg.leadingAnchor, constant: 30),
            
            //Qr Button
            qrImageButton.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 25),
            qrImageButton.leadingAnchor.constraint(equalTo: hStack.trailingAnchor, constant: 25),
            qrImageButton.widthAnchor.constraint(equalToConstant: 125),
            qrImageButton.heightAnchor.constraint(equalToConstant: 125),
            
            //Share Button
            shareButton.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 35),
            shareButton.leadingAnchor.constraint(equalTo: secondBg.leadingAnchor, constant: 30),
            shareButton.widthAnchor.constraint(equalToConstant: 190),
            shareButton.heightAnchor.constraint(equalToConstant: 33),
            
        ])
    }
    
    
}

