//
//  DetailViewController.swift
//  DimzIdCard
//
//  Created by Dimas Aristyo Rahadian on 29/11/23.
//

import UIKit

class DetailViewController: UIViewController{
    
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
    
    private var story: UILabel = {
        let label = UILabel()
        label.text = "Hi there, I'm Dimas! a passionate iOS and Full-Stack Web Developer with a drive to produce high-quality and engaging digital experiences. Skilled in developing iOS app development with UIKit and SwiftUI to deliver exceptional user experiences. Proficient in Swift, UIKit, SwiftUI, HTML, CSS, JavaScript, Typescript, Node.Js, and SQL, with a deep understanding of modern iOS and development technologies and trends.\n\nI am also proud to say that I have attended the Apple Developer Academy, where I gained valuable experience in iOS development and learned from the experts in the field. I am committed to writing clean and secure code, using best practices and performance optimization techniques to deliver high performance web applications and iOS apps. Expert in implementing responsive design principles and ensuring cross-browser and device compatibility, delivering seamless user experiences."
        label.textColor = .white
        label.textAlignment = .left
        label.layer.masksToBounds = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        
        secondBg.addSubview(story)
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
            story.leadingAnchor.constraint(equalTo: secondBg.leadingAnchor, constant: 32),
            story.trailingAnchor.constraint(equalTo: secondBg.trailingAnchor, constant: -32),
            story.topAnchor.constraint(equalTo: secondBg.topAnchor, constant: 56),
            story.bottomAnchor.constraint(equalTo: secondBg.bottomAnchor, constant: -56),
        ])
    }

}
