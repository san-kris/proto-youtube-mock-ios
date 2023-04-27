//
//  MenuBar.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/21/23.
//

import UIKit

class MenuBar: UIView {

    let cellID = "menuCellID"
    let menuItems = ["icons8-heart-suit-96", "icons8-american-football-96", "icons8-party-popper-96", "icons8-sunflower-96"]
    
    lazy var menuBarCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect(origin: .zero, size: .zero), collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        menuBarCollection.register(MenuBarCell.self, forCellWithReuseIdentifier: cellID)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        addSubview(menuBarCollection)
        
        setupLayout()
    }
    
    func setupLayout() -> Void {
        menuBarCollection.translatesAutoresizingMaskIntoConstraints = false
        menuBarCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        menuBarCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        menuBarCollection.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        menuBarCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
}


//MARK: - UICollectionViewDataSource
extension MenuBar: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuBarCell
        cell.menuImageName = menuItems[indexPath.item]
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MenuBar: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width/CGFloat(menuItems.count)), height: frame.height)
    }
}

//MARK: - UICollectionViewDelegate
extension MenuBar: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Menubar cell selected: \(indexPath)")
    }
}
