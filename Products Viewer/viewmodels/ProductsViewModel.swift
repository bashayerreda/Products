//
//  ProductsViewModel.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
import UIKit
import RxCocoa
import RxRelay
import RxSwift
class ProductsViewModel : NSObject{
    
    private let networkServiceProtocol  : NetworkService
    private let databaseModel = DatabaseModel()
    init(networkServiceProtocol: NetworkService = NetworkModel()) {
        self.networkServiceProtocol = networkServiceProtocol
    }
    
    func fetchData() -> Observable<[ProductsData]>{
        networkServiceProtocol.fetchData()
    }
    
    func saveData(){
        databaseModel.saveData()
    }
    func deleteData(){
        databaseModel.delete()
    }
    func fetchDataFromDB() {
        databaseModel.fetch()
    }
}
