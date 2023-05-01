//
//  MoreSettingsView.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/30/23.
//

import UIKit

class MoreSettingsView: UIView {
    
    var screenWindow: UIWindow?
    
    let cellID = "settingsMenuCell"
    let cellHeight: CGFloat = 50
    
    var homeController: HomeController?
    
    let menuItems = ["T&C", "Create Playlist", "Cancel"]
    
    lazy var settingsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .green
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsCollectionView.register(MoreSettingsMenuCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showSettings() -> Void {
        setupView()
    }
    
    func setupView() -> Void {
        
        
        if let window = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow }).last {
            window.addSubview(self)
            window.addSubview(settingsCollectionView)
            
            self.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(hendleDismissSettings)))
            
            screenWindow = window
        }
        
        setupLayout()
    }
    
    func setupLayout() -> Void {
        if let window = screenWindow{
            translatesAutoresizingMaskIntoConstraints = false
            topAnchor.constraint(equalTo: window.topAnchor, constant: 0).isActive = true
            leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 0).isActive = true
            trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: 0).isActive = true
            bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: 0).isActive = true
            
//            settingsCollectionView.translatesAutoresizingMaskIntoConstraints = false
//            settingsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//            settingsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
//            settingsCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            let y = window.frame.height - (cellHeight * CGFloat(menuItems.count))
            settingsCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: (cellHeight * CGFloat(menuItems.count)))
            
            self.backgroundColor = .black
            self.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseOut) {
                self.alpha = 0.5
                self.settingsCollectionView.frame.origin.y = y
                
            } completion: { completed in
                print("Show menu animation completed")
            }

        }

    }
    
    @objc func hendleDismissSettings(gesture: UITapGestureRecognizer){
        dismissMenu()
    }
    
    func dismissMenu(name: String = "") -> Void {
        print("settings menu tapped. time to dismiss: \(name)")
        UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseOut) {
            if let window = self.screenWindow{
                self.alpha = 0
                self.settingsCollectionView.frame.origin.y = window.frame.height

            }
        } completion: { completed in
            print("Hide menu animation completed")
            self.settingsCollectionView.removeFromSuperview()
            if name != "", let controller = self.homeController{
                controller.showDummyViewController(name: name)
            }

        }
    }
}

extension MoreSettingsView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MoreSettingsMenuCell
        cell.backgroundColor = .orange
        cell.moreSetting = menuItems[indexPath.item]
        return cell
    }
}

extension MoreSettingsView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 50)
    }
    
    // horizontal spacing between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // Vertical spacing between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension MoreSettingsView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Menu Item selected: \(indexPath)")
        let name = menuItems[indexPath.item]
        dismissMenu(name: name)
    }
}
