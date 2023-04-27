//
//  ViewController.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/20/23.
//

import UIKit

class HomeController: UICollectionViewController {

    let cellID = "cellID"
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.darkContent
    }
    
    let menuBarView: MenuBar = {
        let view = MenuBar()
        return view
    }()

    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Register a Cell class to use and associate it with a string
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        
        setupNavBar()
        
        setupMenuBar()
        setupView()
    }
    
    fileprivate func setupNavBar() {
        let navLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        navLabel.text = "Hello"
        navLabel.font = UIFont.boldSystemFont(ofSize: 24)
        navLabel.textColor = .red
        navLabel.backgroundColor = .green
        navigationItem.titleView = navLabel
        
        
         navigationItem.rightBarButtonItems = []
        if let moreOptionsImage = UIImage(systemName: "line.3.horizontal")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate){
            let moreOptinsBarButtonItem = UIBarButtonItem(image: moreOptionsImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleMoreOptionsBarButton))
            navigationItem.rightBarButtonItems?.append(moreOptinsBarButtonItem)
        }
        
        if let searchImage = UIImage(systemName: "magnifyingglass")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate){
            let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleSearchBarButton))
            navigationItem.rightBarButtonItems?.append(searchBarButtonItem)
        }
        
        
        
    }
    
    @objc func handleSearchBarButton (sender: UIBarButtonItem){
        print("Search icon clicked: \(sender)")
    }
    
    @objc func handleMoreOptionsBarButton (sender: UIBarButtonItem){
        print("More icon clicked: \(sender)")
    }


    fileprivate func setupMenuBar() {
        view.addSubview(menuBarView)
        menuBarView.translatesAutoresizingMaskIntoConstraints = false
        menuBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        menuBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        menuBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        menuBarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupView() -> Void {
        navigationItem.title = "Home"
        collectionView.alwaysBounceVertical = true
        
        // move the start of the collectioon view down by 50 points using content inset
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        // move the scrollbar 50 pts down by specifying scroll inset
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    // method is called once when orientation changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("viewWillTransition called")
        collectionView.reloadData()
        // reload method calls cellforitemat for all cells
        // invalidate layout does not call cell for item at method for all cells
        
        menuBarView.menuBarCollection.reloadData()

        // guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
        // flowLayout.invalidateLayout()
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

