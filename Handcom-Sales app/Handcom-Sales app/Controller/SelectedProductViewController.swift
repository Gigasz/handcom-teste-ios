//
//  SelectedProductViewController.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 03/03/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import UIKit
import Kingfisher

class SelectedProductViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var lbProductTitle: UILabel!
    @IBOutlet weak var lbProductPrice: UILabel!
    
    var product: Produto!
    var imageForProduct: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        lbProductPrice.text = "R$ \(product.Preco!)"
        lbProductTitle.text = product.Titulo
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageUrl = URL(string: "http://\(product.UrlImage!)")
        productImage.kf.indicatorType = .activity
        let resource = ImageResource(downloadURL: imageUrl!, cacheKey: "HandcomProductImage\(String(describing: product.Produto?.IdProduto))")
        productImage.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placeholder") , options: nil, progressBlock: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
