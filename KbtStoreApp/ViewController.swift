//
//  ViewController.swift
//  KbtStoreApp
//
//  Created by Burak Kubat on 18.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var productContent = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        var productList: List?
        let url = URL(string: "https://dummyjson.com/products")
        URLSession.shared.dataTask(with: url!) { data, _, error in
            guard let data = data , error == nil else {
                print("error")
                return
            }
            do{
                productList = try JSONDecoder().decode(List.self, from: data)
            }
            catch {
                print("json parse edilirken hata")
            }
            
             
            self.productContent = productList!.products
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
            
        }.resume()
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! DetailTableViewCell
        cell.productTitleLbl.text = productContent[indexPath.row].title
        cell.productPriceLbl.text = String(productContent[indexPath.row].price) + "$"
        cell.productReviewLbl.text = String(productContent[indexPath.row].rating)
        cell.productImage.downloaded(from: productContent[indexPath.row].thumbnail)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.productDetail = productContent[tableView.indexPathForSelectedRow!.row]
        }
    }


}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
