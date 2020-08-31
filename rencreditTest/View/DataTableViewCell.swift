//
//  DataTableViewCell.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 27.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: DataTableViewCell.self)
    private let screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        frame.size.height = 64
        backgroundColor = .clear
        addSubview(view)
        
        view.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        view.addSubview(nameLabel)
        view.addSubview(numberLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(model: Note) {
        nameLabel.text = model.name
        numberLabel.text = "\(model.number)"
        
        guard
            let nameLabelText = nameLabel.text,
            let descriptionLabelText = numberLabel.text
            else {
                print("Text in fields is nil")
                return
        }
        
        let nameLabelWidth = screenWidth - 32
        let nameLabelHeight = nameLabelText.height(width: nameLabel.frame.width, font: nameLabel.font)
        nameLabel.frame = CGRect(origin: CGPoint(x: 8, y: 8),
                                 size: CGSize(width: nameLabelWidth, height: nameLabelHeight))
        
        let descriptionLabelHeight = descriptionLabelText.height(width: numberLabel.frame.width, font: numberLabel.font)
        numberLabel.frame = CGRect(origin: CGPoint(x: 8, y: nameLabel.frame.maxY + 8),
                                 size: CGSize(width: nameLabelWidth, height: descriptionLabelHeight))
    }
    
}
