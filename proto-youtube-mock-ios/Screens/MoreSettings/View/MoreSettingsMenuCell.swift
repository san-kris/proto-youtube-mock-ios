//
//  MoreSettingsMenuCell.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/30/23.
//

import UIKit

class MoreSettingsMenuCell: UICollectionViewCell {
    
    var moreSetting: String? {
        didSet{
            menuLabel.text = moreSetting
        }
    }
    
    let menuIconImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "arrow.right"))
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.black.cgColor
        return iv
    }()
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu placeholder"
        return label
    }()
    
    lazy var menuStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [menuIconImageView, menuLabel])
        sv.axis = .horizontal
        return sv
    }()
    
    override var isHighlighted: Bool{
        didSet{
            print("menu highlighted: \(isHighlighted)")
            backgroundColor = isHighlighted ? .blue : .orange
        }
    }
    
    override var isSelected: Bool{
        didSet{
            print("Menu selected: \(isSelected)")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        addSubview(menuStackView)
        
        setupLayout()
    }
    
    func setupLayout() -> Void {
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        menuStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        menuStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        menuStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        menuStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        menuIconImageView.translatesAutoresizingMaskIntoConstraints = false
        menuIconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuIconImageView.widthAnchor.constraint(equalTo: menuIconImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
}
