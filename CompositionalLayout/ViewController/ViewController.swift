//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    
    let navigationView : UIView = {
        let nv = UIView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.backgroundColor = .systemBackground
        return nv
    }()

    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(TopBannerCollectionViewCell.self, forCellWithReuseIdentifier: TopBannerCollectionViewCell.cellIdentifier)
        cv.register(PopularRestaurantsListCell.self, forCellWithReuseIdentifier: PopularRestaurantsListCell.cellIdentifier)
        cv.register(MostPopularListViewCell.self, forCellWithReuseIdentifier: MostPopularListViewCell.cellIdentifier)
        cv.register(HeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: HeaderView.headerIdentifier)
        cv.register(RecentItemViewCell.self, forCellWithReuseIdentifier: RecentItemViewCell.cellIdentifier)
        
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    
    var viewLayoutManagerDelegate: ViewLayoutManagerDelegate

     init(viewLayoutManagerDelegate: ViewLayoutManagerDelegate) {
         self.viewLayoutManagerDelegate = viewLayoutManagerDelegate
         super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "Home"
        configureUI()
        setUpNavigation()
        setUpConstrains()
        configureCompositionalLayout()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavigation()
    }
    
    func setUpNavigation(){
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(navigationView)
        view.addSubview(collectionView)
    }
    
    func setUpConstrains(){
        collectionView.setUp(to: view)
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: -(windowConstant.getTopPadding + 64)),
            navigationView.heightAnchor.constraint(equalToConstant: windowConstant.getTopPadding + 64),
            
        ])
    }
    

}

extension ViewController {
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return self.viewLayoutManagerDelegate.foodBannerSection()
            case 1 :
                return self.viewLayoutManagerDelegate.popularRestaurantsListSection()
            case 2 :
                return self.viewLayoutManagerDelegate.mostPopularListSection()
            default:
                return self.viewLayoutManagerDelegate.recentItemsListSection()
            }
        }
  
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return topBannerMockData.count
        case 1 :
            return popularRestaurantListMockData.count
        case 2 :
            return mostPopularListMockData.count
        default:
            return recentItemsListMockData.count
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCollectionViewCell.cellIdentifier, for: indexPath) as? TopBannerCollectionViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = topBannerMockData[indexPath.row]
             return cell
            
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularRestaurantsListCell.cellIdentifier, for: indexPath) as? PopularRestaurantsListCell else {fatalError("Unable deque cell...")}
             cell.cellData = popularRestaurantListMockData[indexPath.row]
             return cell
        case 2 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MostPopularListViewCell.cellIdentifier, for: indexPath) as? MostPopularListViewCell else {fatalError("Unable deque cell...")}
                cell.cellData = mostPopularListMockData[indexPath.row]
             return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentItemViewCell.cellIdentifier, for: indexPath) as? RecentItemViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = recentItemsListMockData[indexPath.row]
             return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            
            switch indexPath.section {
            case 1 :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.headerIdentifier, for: indexPath) as! HeaderView
                header.titleText = "Popular Restaurents"
                header.titleFont = UIFont(name: "Inter", size: 20)
                return header
            case 2 :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.headerIdentifier, for: indexPath) as! HeaderView
                header.titleText = "Most Popular"
                header.titleFont = UIFont(name: "Inter", size: 20)
                return header
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.headerIdentifier, for: indexPath) as! HeaderView
                header.titleText = "Recent Items"
                header.titleFont = UIFont(name: "Inter", size: 26)
                return header
            default:
                break
            }
            
        }
        return UICollectionReusableView()
    }
}

extension UIView {
    func setUp(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func setGradient(withColors colors: [CGColor] , startPoint: CGPoint , endPoint: CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
}


struct windowConstant {
    
    private static let window = UIApplication.shared.connectedScenes.first as? UIWindowScene
    
    static var getTopPadding: CGFloat {
        return window?.windows.first?.safeAreaInsets.top ?? 0
    }
    
    static var getBottomPadding: CGFloat {
        return window?.windows.first?.safeAreaInsets.bottom ?? 0
    }
    
}
