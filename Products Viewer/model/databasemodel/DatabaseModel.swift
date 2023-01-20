//
//  DatabaseModel.swift
//  Products Viewer
//
//  Created by Bashayer on 20/12/2022.
//

import Foundation
import CoreData
import UIKit
import RxSwift
class DatabaseModel {
    
    static let shared = DatabaseModel()
        
    let disposeBag = DisposeBag()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let networkModel = NetworkModel()
    
    
    
    
    
    func saveData(){
        let newArticle = NSEntityDescription.insertNewObject(forEntityName: "ProductDBEntity", into: context) as NSManagedObject
        networkModel.fetchData().subscribe(onNext:{results in
         
            for i in results {
                newArticle.setValue(i.product?.name,forKey: "name")
                newArticle.setValue(i.product?.price , forKey: "price")
                newArticle.setValue(i.product?.image_url, forKey: "image_url")
                do {
                    try self.context.save()
                    print("Success")
                 
                } catch {
                    print("Error saving: \(error)")
                }
            }
            
            
        }).disposed(by: disposeBag)
    }
    
    func fetch(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductDBEntity")
                
        do {
            let results   = try self.context.fetch(fetchRequest)
            let locations = results as! [ProductDBEntity]
                
             for location in locations {
                 print(location)
             }

        } catch let error as NSError {
          print("Could not fetch \(error)")
        }
       
            
        }
    func delete() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductDBEntity")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try self.context.execute(batchDeleteRequest)

        } catch {
            // Error Handling
        }
    }
    }




