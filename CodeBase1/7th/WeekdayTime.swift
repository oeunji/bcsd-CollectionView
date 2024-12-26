//
//  Untitled.swift
//  CodeBase1
//
//  Created by 이은지 on 12/26/24.
//

import UIKit

class WeekdayTimeViewController: UIViewController {
    let weekdayTimeLabel: UILabel = {
        let weekdayTimeLabel = UILabel()
        weekdayTimeLabel.text = "평일 운영시간"
        weekdayTimeLabel.font = .systemFont(ofSize: 21, weight: .bold)
        weekdayTimeLabel.textColor = .systemBlue

        return weekdayTimeLabel
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(weekdayTimeLabel)
        
        weekdayTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            weekdayTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            weekdayTimeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
        ])

    }
}
