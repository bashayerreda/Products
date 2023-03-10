//
//  TableViewCell.swift
//  Products Viewer
//
//  Created by Bashayer on 15/12/2022.
//

import UIKit
import SkeletonView
import RxRelay
import RxCocoa
import RxSwift
import SDWebImage

class TableViewCell: UITableViewCell {
    static let cellId = "cell"
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        }
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
