//
//  SalesTableViewCell.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import UIKit
import Kingfisher

class SalesTableViewCell: UITableViewCell {
//
//    @IBOutlet weak var ivProduct: UIImageView!
//    @IBOutlet weak var lbName: UILabel!
//    @IBOutlet weak var lbPrice: UILabel!

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var ivProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with sale: Produto) { //, onImageLoad: @escaping () -> Void
//        dump(sale)
        
        lbName.text = sale.Titulo!
        
        lbPrice.text = "R$\(sale.Preco!)"

        let imageUrl = URL(string: "http://\(sale.UrlImage!)")
        ivProduct.kf.indicatorType = .activity
        let resource = ImageResource(downloadURL: imageUrl!, cacheKey: "HandcomProductImage\(String(describing: sale.Produto?.IdProduto))")
        ivProduct.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placeholder") , options: nil, progressBlock: nil)
    }

}
