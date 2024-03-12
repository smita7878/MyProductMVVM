//
//  ProductCellTableViewCell.swift
//  Youtube MVVM Product
//
//  Created by SMITA BHUTKA on 01/03/24.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet var PtoductView: UIView!
    @IBOutlet var ProductImgView: UIImageView!
    @IBOutlet var ProductTitleLbl: UILabel!
    @IBOutlet var ProductCategoryLabel: UILabel!
    @IBOutlet var ProductRateBtn: UIButton!
    @IBOutlet var ProductDescription: UILabel!
    @IBOutlet var ProductPricelbl: UILabel!
    @IBOutlet var BtnBuy: UIButton!
    
    var product : Product? {
        didSet {
            //Property observer, Anything is changed in product such as add product and will add to your label 
            productDetailConfigration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        PtoductView.clipsToBounds = false
        PtoductView.layer.cornerRadius = 15
        ProductImgView.layer.cornerRadius = 10
        self.PtoductView.backgroundColor = .systemGray6
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfigration() {
        guard let product else { return }
        
        ProductTitleLbl.text = product.title
        ProductCategoryLabel.text = product.category
        ProductDescription.text = product.description
        ProductPricelbl.text = "$\(product.price)"
        ProductRateBtn.setTitle("\(product.rating.rate)", for: .normal)
        ProductImgView.setImage(with: product.image)
        
    }
    
}
