//
//  userPickerControl.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 25/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

@IBDesignable class userPickerControl: UIControl {
    
    enum userPicker: Int {
        case KimiRaikkonen
        case LewisHamilton
        case MaxVerstappen
        case RobertKubica
        case SebastianVettel
        case ValtteriBottas
        case GeorgeRussell
        
        static let all: [userPicker] = [KimiRaikkonen, LewisHamilton, MaxVerstappen, RobertKubica, SebastianVettel, ValtteriBottas, GeorgeRussell]
        
        var title: String {
            switch self {
            case .KimiRaikkonen: return "KR"
            case .LewisHamilton: return "LH"
            case .MaxVerstappen: return "MV"
            case .RobertKubica: return "RK"
            case .SebastianVettel: return "SV"
            case .ValtteriBottas: return "VB"
            case .GeorgeRussell: return "GR"
            }
        }
    }
    
    @IBDesignable class WeekDayPicker: UIControl {
        
        var selectedDay: userPicker? = nil {
            didSet {
                self.updateSelectedDay()
                self.sendActions(for: .valueChanged)
            }
        }
        
        private var buttons: [UIButton] = []
        private var stackView: UIStackView!
        
        
        
        private func setupView() {
            for day in userPicker.all {
                let button = UIButton(type: .system)
                button.setTitle(day.title, for: .normal)
                button.setTitleColor(.lightGray, for: .normal)
                button.setTitleColor(.white, for: .selected)
                button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
                self.buttons.append(button)
            }
            
            stackView = UIStackView(arrangedSubviews: self.buttons)
            self.addSubview(stackView)
            
            stackView.spacing = 8
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fillEqually
        }
        
        private func updateSelectedDay() {
            for (index, button) in self.buttons.enumerated() {
                guard let day = userPicker(rawValue: index) else { continue }
                button.isSelected = day == self.selectedDay
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            stackView.frame = bounds
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setupView()
        }
        
        @objc private func selectDay(_ sender: UIButton) {
            guard let index = self.buttons.firstIndex(of: sender) else { return }
            guard let day = userPicker(rawValue: index) else { return }
            self.selectedDay = day
        }
    }

}
