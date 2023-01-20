//
//  NetworkService.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa
protocol NetworkService {
func fetchData() -> Observable<[ProductsData]>
}
