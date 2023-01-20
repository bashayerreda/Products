//
//  tableViewController.swift
//  Products Viewer
//
//  Created by Bashayer on 27/12/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import SkeletonView
import ENSwiftSideMenu
class TableViewController: UIViewController {

   @IBAction func btnClicked(_ sender: Any) {
        toggleSideMenuView()
    }
   @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var productTableView: UITableView!
       
       let prpductsVM = ProductsViewModel()
       let disposeBag = DisposeBag()
       let products = BehaviorRelay<[ProductsData]>(value: [])
       var observer : Observable<[ProductsData]>{
           return products.asObservable()
       }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.activityInd.isHidden = true
        self.activityInd.stopAnimating()
        self.productTableView.isSkeletonable = true
      
        
    }
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           self.productTableView.delegate = self
           self.productTableView.dataSource = self
           subscribe()
           subscribeToNext()
           
           
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
                   self.productTableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .clouds,secondaryColor: .purple), animation: nil, transition: .crossDissolve(0.25))
                   self.productTableView.showSkeleton(usingColor: .black, transition: .crossDissolve(0.25))
               }
               
               DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                   self.activityInd.isHidden = true
                   self.activityInd.stopAnimating()
                   self.productTableView.stopSkeletonAnimation()
                   self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
                   self.productTableView.reloadData()
               }
               
               
           }).disposed(by: disposeBag)
           
           
       }
       
       func updateUi(){
           self.activityInd.isHidden = false
           self.activityInd.startAnimating()
           self.productTableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .clouds,secondaryColor: .purple), animation: nil, transition: .crossDissolve(0.25))
           self.productTableView.showSkeleton(usingColor: .black, transition: .crossDissolve(0.25))
           DispatchQueue.main.asyncAfter(deadline: .now() + 5){
               self.activityInd.isHidden = true
               self.activityInd.stopAnimating()
               self.productTableView.stopSkeletonAnimation()
               self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
           }
       }
   }
   extension TableViewController : UITableViewDelegate , SkeletonTableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.products.value.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! TableViewCell
           let productData = self.products.value[indexPath.row]
    
           cell.namelbl.text = productData.product?.name
           cell.descLbl.text = productData.product?.description
           if let image = productData.product?.image_url {
           cell.productImg.sd_setImage(with: URL(string: image),placeholderImage: UIImage(named: "t"))
           }
           cell.priceLbl.text = productData.product?.price
    
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let DetailsVc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVc") as! DetailsViewController
           DetailsVc.productNameText  = self.products.value[indexPath.row].product?.name ?? ""
           DetailsVc.productNameImg  = self.products.value[indexPath.row].product?.image_url ?? ""
           self.navigationController?.pushViewController(DetailsVc, animated: true)
           
       }
     
       func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
           let cell  = TableViewCell.cellId
           return cell
         }
         
         
         
         func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return  20
         }
         
     }
     
      



