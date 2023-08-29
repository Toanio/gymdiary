//
//  ClientViewController.swift
//  gymdiary
//
//  Created by c.toan on 03.08.2023.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {
    private let calendar: UICalendarView = {
        let calendar = UICalendarView()
        calendar.calendar = .current
        calendar.fontDesign = .rounded
        calendar.fontDesign = .rounded
        return calendar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Спортсмен"
        configureCalendar()
        calendar.delegate = self
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendar.selectionBehavior = dateSelection
    }
    
    private func configureCalendar() {
        view.addSubview(calendar)
        
        calendar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
        }
    }
}

extension UserViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if dateComponents.day == 4 {
            let font = UIFont.systemFont(ofSize: 10)
                let configuration = UIImage.SymbolConfiguration(font: font)
                let image = UIImage(systemName: "star.fill", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
                return .image(image)
        }
        return nil
    }
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
       
        
    }
}
