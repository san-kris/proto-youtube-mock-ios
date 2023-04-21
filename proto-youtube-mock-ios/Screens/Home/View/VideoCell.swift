//
//  VideoCell.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/20/23.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    var titleHeightConstraint: NSLayoutConstraint?
    var descriptionHeightConstraint: NSLayoutConstraint?
    
    let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder Title"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .green
        return label
    }()
    
    let videoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder description of the video. This is a very long text"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .lightGray
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [videoTitleLabel, videoDescriptionLabel, UIView()])
        sv.axis = .vertical
        return sv
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "icons8-jack-o-lantern-96"))
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 22
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.red.cgColor
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var profileImageStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [profileImageView, UIView()])
        sv.axis = .vertical
        return sv
    }()
    
    lazy var profileStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [profileImageStackView, labelStackView])
        sv.axis = .horizontal
        sv.spacing = 10
        return sv
    }()
    
    let thumbnailImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Background-Euro"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var cellStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, profileStackView, UIView()])
        sv.axis = .vertical
        sv.spacing = 10
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Calling setup View in cell")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        backgroundColor = .red
        addSubview(cellStackView)
        
        setupLayout()
    }
    
    func setupLayout() -> Void {
        
        // Here is an option to remove all constraints from the view
        // May have to looop through subviews and remove all its constraints
        // removeConstraints(constraints)
        
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 1).isActive = true
        
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleHeightConstraint = videoTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        titleHeightConstraint!.isActive = true
        
        videoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionHeightConstraint = videoDescriptionLabel.heightAnchor.constraint(equalToConstant: 20)
        descriptionHeightConstraint!.isActive = true
    }
    
    func adjustSubviewHeight() -> Void {
        if let labelConstraint = titleHeightConstraint{
            let textLabelWidth = frame.width - 44 - 10
            if let newLabelHeight = videoTitleLabel.text?.calculateLayoutHeightFor(width: textLabelWidth, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]){
                print("Title Label Height: \(newLabelHeight)")
                
                labelConstraint.constant = ceil(newLabelHeight) + 1
            }
        }
        
        if let labelConstraint = descriptionHeightConstraint{
            let textLabelWidth = frame.width - 44 - 10
            if let newLabelHeight = videoDescriptionLabel.text?.calculateLayoutHeightFor(width: textLabelWidth, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]){
                print("Description Label Height: \(newLabelHeight)")
                labelConstraint.constant = ceil(newLabelHeight) + 1
            }
            
        }
        
    }
    
}
