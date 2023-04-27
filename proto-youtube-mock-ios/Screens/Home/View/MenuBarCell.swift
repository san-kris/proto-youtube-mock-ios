//
//  MenuBarCell.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/23/23.
//

import UIKit

class MenuBarCell: UICollectionViewCell {
 
    var menuImageName: String? {
        didSet {
            guard let menuImageName else {return}
            menuImageView.image = UIImage(named: menuImageName)
        }
    }
    
    let menuImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "icons8-skunk-96"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        backgroundColor = .blue
        addSubview(menuImageView)
        
        setupLayout()
    }
    
    func setupLayout() -> Void {
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        
        menuImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        menuImageView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 0).isActive = true
        menuImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        
    }
    
}
