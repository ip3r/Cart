//
//  CurrencyTableViewCell.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CurrencyTableViewCell: UITableViewCell {
    private let codeLabel: UILabel
    private let rateLabel: UILabel
    private let nameLabel: UILabel
    
	// MARK: Init
    
    internal convenience init(identifier: String) {
        self.init(
            identifier: identifier,
            codeLabel: UILabel(),
            rateLabel: UILabel(),
            nameLabel: UILabel()
        )
    }
    
    internal required init(identifier: String, codeLabel: UILabel, rateLabel: UILabel, nameLabel: UILabel) {
        self.codeLabel = codeLabel
        self.rateLabel = rateLabel
        self.nameLabel = nameLabel
        super.init(style: .default, reuseIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public
    
    func setup() {
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(codeLabel)
        self.contentView.addSubview(rateLabel)
        self.contentView.addSubview(nameLabel)
        codeLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20.0).isActive = true
        codeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        codeLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        rateLabel.leadingAnchor.constraint(equalTo: codeLabel.trailingAnchor, constant: 15.0).isActive = true
        rateLabel.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 2.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.codeLabel.trailingAnchor, constant: 15.0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -2.0).isActive = true
        nameLabel.font = UIFont.systemFont(ofSize: 18.0)
        codeLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        rateLabel.font = UIFont.systemFont(ofSize: 12.0)
        rateLabel.textColor = UIColor.lightGray
    }
    
    func updateISOCode(code: String) {
        codeLabel.text = code
    }
    
    func updateRate(rate: String) {
        rateLabel.text = rate
    }
    
    func updateName(name: String) {
        nameLabel.text = name
    }
}
