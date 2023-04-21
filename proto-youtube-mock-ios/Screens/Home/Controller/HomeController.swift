//
//  ViewController.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/20/23.
//

import UIKit

class HomeController: UICollectionViewController {

    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Register a Cell class to use and associate it with a string
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        
        setupView()
    }
    
    func setupView() -> Void {
        navigationItem.title = "Home"
        collectionView.alwaysBounceVertical = true
        
        
    }
    
    // method is called once when orientation changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("viewWillTransition called")
        collectionView.reloadData()
//        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
//        flowLayout.invalidateLayout()
    }
    

}

//MARK: - CollectioonView Data Source
extension HomeController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // called for each cell that is on screen and each time layout is invalidated
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // New cell is created only when no reusable cell exist.
        // if reusable cells exist, then 
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! VideoCell
        print("New cell created")
        cell.adjustSubviewHeight()
        return cell
    }
    
    
}

//MARK: - Collection View Flow Layout
extension HomeController: UICollectionViewDelegateFlowLayout{
    // function is call for each cell and when orientation changes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 300
        print("Cell Size called")
        return CGSize(width: view.frame.width, height: height)
    }
    
    // spacing between cells when they are stacked horizontally in collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // spacing between cells when they are stacked vertically in collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
}

//MARK: - Collection view Delegate
extension HomeController{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selected: \(indexPath.item)")
    }
}

