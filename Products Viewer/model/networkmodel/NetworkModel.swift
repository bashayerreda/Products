//
//  NetworkModel.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxRelay
import AlamofireImage
import Alamofire

class NetworkModel : NSObject, Decodable , NetworkService {
    
    func fetchData() -> Observable<[ProductsData]> {
        return Observable.create { observer  -> Disposable in
            let urlString = Constants.BASE_URL
            guard let url = URL(string: urlString)
            else {
                observer.onError(NSError(domain: "", code: -1))
                return Disposables.create{}
            }
            URLSession.shared.dataTask(with: url) { (data, response, error ) in
                
                guard let data = data else { observer.onError(error?.localizedDescription as! Error)
                    return
                }
                
                do {
                    
                    let results = try JSONDecoder().decode([ProductsData].self, from: data)
                    observer.onNext(results)
                    
                } catch let jsonError {
                    observer.onError(jsonError.localizedDescription as! Error)
                }
                
            }.resume()
            return Disposables.create {
                
            }
        }
        
    }
}
    
 
