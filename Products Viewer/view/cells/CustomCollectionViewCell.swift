//
//  CustomCollectionViewCell.swift
//  Products Viewer
//
//  Created by Bashayer on 19/12/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import SkeletonView

class CustomCollectionViewCell: UICollectionViewCell {
    lazy var imageViewUi  : UIImageView = {
        let imgV = UIImageView()
        imgV.layer.cornerRadius = 8
        imgV.contentMode = .scaleAspectFill
        imgV.clipsToBounds = true
        imgV.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgV.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgV.backgroundColor = .secondarySystemBackground
        return imgV
    }()
    
    lazy var nameUi : UILabel = {
        let nameLbl = UILabel()
        nameLbl.font = UIFont.boldSystemFont(ofSize: 12)
        nameLbl.textColor = .purple
               return nameLbl
    }()
           
    lazy var descUi : UILabel  = {
    let desc = UILabel()
    desc.numberOfLines = 4
        desc.textColor = .gray
       desc.font = UIFont.boldSystemFont(ofSize: 10)

      
    return desc
    }()
    
    lazy var priceUi : UILabel = {
        let priceUi = UILabel()
        priceUi.font = UIFont.boldSystemFont(ofSize: 12)
        priceUi.textColor = .gray
               return priceUi
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isSkeletonable = true
        contentView.isSkeletonable = true
        imageViewUi.isSkeletonable = true
        nameUi.isSkeletonable = true
        descUi.isSkeletonable = true
              configureUi()
       
           }
           
           required init?(coder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
           }
    
    

    func configureUi() {
        backgroundColor = .systemBackground
        
    
        addSubview(imageViewUi)
        imageViewUi.translatesAutoresizingMaskIntoConstraints = false
        imageViewUi.topAnchor.constraint(equalTo: topAnchor,constant: 18).isActive = true
        imageViewUi.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageViewUi.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
         
        addSubview(nameUi)
        nameUi.translatesAutoresizingMaskIntoConstraints = false
        nameUi.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameUi.leftAnchor.constraint(equalTo:  leftAnchor ,constant: 20).isActive = true
        nameUi.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
       
        
      addSubview(priceUi)
        priceUi.translatesAutoresizingMaskIntoConstraints = false
        priceUi.topAnchor.constraint(equalTo: imageViewUi.bottomAnchor,constant: 10).isActive = true
        priceUi.rightAnchor.constraint(equalTo: nameUi.rightAnchor).isActive = true
        priceUi.leftAnchor.constraint(equalTo: nameUi.leftAnchor).isActive = true
        
 
        
    }
    
           
    }
    

