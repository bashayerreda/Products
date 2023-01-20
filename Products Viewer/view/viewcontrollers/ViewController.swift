//
//  ViewController.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import SkeletonView
import ENSwiftSideMenu
import Reachability
class ViewController: UIViewController {
    let reachability = try! Reachability()
    let d =  DatabaseModel()
    @IBAction func clicked(_ sender: Any) {
        toggleSideMenuView()
    }
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    private var cellReuseIdentifier: String! {
     return "cell"
     }
    
    let prpductsVM = ProductsViewModel()
    @IBOutlet weak var productTableView: UITableView!
    
    let disposeBag = DisposeBag()
    let products = BehaviorRelay<[ProductsData]>(value: [])
    let flag = false
    var observer : Observable<[ProductsData]>{
        return products.asObservable()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.activityInd.isHidden = true
        self.activityInd.stopAnimating()
        self.collectionView.isSkeletonable = true
      
        
    }
    func configurationParentCollectionViewCell(){
        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    func configurationUi(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.backgroundColor = .none
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
        subscribeToNext()
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                self.subscribe()
                self.prpductsVM.deleteData()
                self.prpductsVM.saveData()
                self.subscribeToNext()
                
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
          
            self.prpductsVM.fetchDataFromDB()
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        configurationParentCollectionViewCell()
        configurationUi()
      
      
       
     
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
    }
    func subscribe(){
        prpductsVM.fetchData().subscribe(onNext: {results in
            self.products.accept(results)
            print(self.products.value)},
            onError: {_ in ("something went wrong")},
            onCompleted: {}
                                         
        ).disposed(by: disposeBag)
        
    }
    func subscribeToNext(){
        self.observer.subscribe(onNext:{ results in
            DispatchQueue.main.async{
                self.activityInd.isHidden = false
                self.activityInd.startAnimating()
                self.collectionView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .clouds,secondaryColor: .purple), animation: nil, transition: .crossDissolve(0.25))
                self.collectionView.showSkeleton(usingColor: .black, transition: .crossDissolve(0.25))
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.activityInd.isHidden = true
                self.activityInd.stopAnimating()
                self.collectionView.stopSkeletonAnimation()
                self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
                self.collectionView.reloadData()
            }
      
            
            
        }).disposed(by: disposeBag)
       
    }
  
        
    
        private lazy var collectionView : UICollectionView = {
            let collectionV = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
            collectionV.delegate = self
            collectionV.dataSource = self
            return collectionV
        }()
    }

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout,SkeletonCollectionViewDataSource , SkeletonCollectionViewDelegate {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "cell"
    }
    
    
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.isSkeletonable = true
        
        let productsData = self.products.value[indexPath.row]
        
        cell.nameUi.text = productsData.product?.name
        cell.priceUi.text = productsData.product?.price
        
        if let image = productsData.product?.image_url {
            cell.imageViewUi.sd_setImage(with: URL(string: image),placeholderImage: UIImage(named: "t"))
        }
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            let DetailsVc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVc") as! DetailsViewController
               DetailsVc.productNameText  = self.products.value[indexPath.row].product?.name ?? ""
               DetailsVc.productNameImg  = self.products.value[indexPath.row].product?.image_url ?? ""
               self.navigationController?.pushViewController(DetailsVc, animated: true)
           
        }
    
     
  
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
}
