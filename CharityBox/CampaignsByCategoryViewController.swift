//
//  CampaignsByCategoryViewController.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit
import Alamofire

class CampaignsByCategoryViewController: UIViewController {
    @IBOutlet weak var categoryId: UILabel!
    
    var catId:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        categoryId.text=catId
        GetAllCampaignsByCategory()
      
    }
    
    
    func GetAllCampaignsByCategory(){
        let parameters:Parameters=[
            "categoryId":"\(categoryId.text!)"
        ]
        print(categoryId.text!)
        Alamofire.request("http://yardimeli.somee.com/api/Campaign/GetCampaignsByCategoryId",method: .get,parameters: parameters).responseJSON{
            
            responese in
            
            
            if let data = responese.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(CampaignsResponse.self, from: data)
                    
                    if let campList=cevap.data{
                       

                        for ca in campList {
                            print(ca.name)
                        }
                    }
           
                   
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
}




}
