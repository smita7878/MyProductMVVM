//
//  ProductListVC.swift
//  Youtube MVVM Product
//
//  Created by SMITA BHUTKA on 29/02/24.
//

import UIKit

class ProductListVC: UIViewController {

    @IBOutlet weak var productTablView: UITableView!
    
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configration()
        
        
        // Do any additional setup after loading the view.
    }

}

extension ProductListVC {
    
    func configration() {
        
        productTablView.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCellTableViewCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        // as soon as didload get called just fectch the product
        viewModel.fetchProducts()
    }
    
    //Databinding will observe an event ; will do communication
    func observeEvent() {
        //weak bcoz event could be nil or not nil so
        viewModel.eventHandler = {[weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                //indicator show
                print("Product loading...")
            case .stoploading:
                //indicator hide
                print("Stop loading...")
            case .dataload:
                print("data loaded...")
//                print(self.viewModel.products)
                DispatchQueue.main.sync {
                    self.productTablView.reloadData()
                }
            case .error( let error):
                print(error ?? "gg")
            
                
            }
        }
    }
}


extension ProductListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellTableViewCell") as? ProductCellTableViewCell else{
            
            return UITableViewCell()
            
        }
        
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    
    
}
