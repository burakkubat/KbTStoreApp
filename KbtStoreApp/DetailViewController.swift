//
//  DetailViewController.swift
//  KbtStoreApp
//
//  Created by Burak Kubat on 18.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var productDetailImage: UIImageView!
    @IBOutlet weak var productDetailName: UILabel!
    @IBOutlet weak var productDetailPrice: UILabel!
    @IBOutlet weak var productDetailReview: UILabel!
    @IBOutlet weak var productDetailCategory: UILabel!
    @IBOutlet weak var productDetailBrand: UILabel!
    @IBOutlet weak var productDetailStock: UILabel!
    @IBOutlet weak var productDetailDescription: UILabel!
    
    var productDetail: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDetailImage.downloaded(from: productDetail!.images[1])
        productDetailName.text = productDetail?.title
        productDetailPrice.text = "$ \(productDetail?.price ?? 50)"
        productDetailReview.text =  "\(productDetail?.rating ?? 0)"
        productDetailCategory.text = "Category: \(productDetail?.category ?? "Deneme")"
        productDetailBrand.text = "Brand: \(productDetail?.brand ?? "Oem" )"
        productDetailStock.text = "Stock :\(productDetail?.stock ?? 0)"
        productDetailDescription.text = "Description :\(productDetail?.description ?? "Description has been not added" )"
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
