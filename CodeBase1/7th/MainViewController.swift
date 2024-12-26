//
//  MainViewController.swift
//  CodeBase1
//
//  Created by 이은지 on 12/26/24.
//

import UIKit

class TableViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "학생식당정보"
        titleLabel.font = .systemFont(ofSize: 18)

        return titleLabel
    }()
    
    let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "학생식당 학기중 운영시간"
        subtitleLabel.font = .systemFont(ofSize: 21, weight: .bold)
        
        return subtitleLabel
    }()
    
    let locationTitleLabel: UILabel = {
        let locationTitleLabel = UILabel()
        locationTitleLabel.text = "위치"
        locationTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        locationTitleLabel.textColor = .systemGray
        
        return locationTitleLabel
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.text = "학생회관 2층"
        locationLabel.font = .systemFont(ofSize: 15)
        locationLabel.textColor = .systemGray
        
        return locationLabel
    }()
    
    let phoneNumberTitleLabel: UILabel = {
        let phoneNumberTitleLabel = UILabel()
        phoneNumberTitleLabel.text = "전화번호"
        phoneNumberTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        phoneNumberTitleLabel.textColor = .systemGray
        
        return phoneNumberTitleLabel
    }()
    
    let phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.text = "041-560-1278"
        phoneNumberLabel.font = .systemFont(ofSize: 15)
        phoneNumberLabel.textColor = .systemGray
        
        return phoneNumberLabel
    }()
    
//    let weekdayLabel: UILabel = {
//       let weekdayLabel = UILabel()
//        weekdayLabel.text = "평일 운영시간"
//        weekdayLabel.font = .systemFont(ofSize: 21, weight: .bold)
//        weekdayLabel.textColor = .systemBlue
//
//        return weekdayLabel
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(locationTitleLabel)
        view.addSubview(locationLabel)
        view.addSubview(phoneNumberTitleLabel)
        view.addSubview(phoneNumberLabel)
        
//        view.addSubview(weekdayLabel)
        
        setupTitleView()
            
    }
    
    func setupTitleView() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        locationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
//        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            
            locationTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            locationTitleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15),
            
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            locationLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15),
            
            phoneNumberTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            phoneNumberTitleLabel.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 10),
                
            phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberTitleLabel.trailingAnchor, constant: 8),
            phoneNumberLabel.centerYAnchor.constraint(equalTo: phoneNumberTitleLabel.centerYAnchor),
            
//            weekdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
//            weekdayLabel.topAnchor.constraint(equalTo: phoneNumberTitleLabel.bottomAnchor, constant: 30),
            
        ])
    }
    
}
