//
//  CampaignsHomeViewController.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit
import Alamofire

class CampaignsHomeViewController: UIViewController {

    var categoryId:String = ""
    @IBOutlet weak var campaignTableView: UITableView!
    var campaignList=[Campaigns]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        campaignTableView.dataSource=self
        campaignTableView.delegate=self
        
        
        GetAllCampaigns()
    }
    
    @IBAction func saglik(_ sender: Any) {
        categoryId="1"
        self.performSegue(withIdentifier: "toCampByCat", sender: categoryId)
    }
    
    @IBAction func egitim(_ sender: Any) {
        categoryId="2"
        self.performSegue(withIdentifier: "toCampByCat", sender: categoryId)
    }
    
    @IBAction func sokakHayvan(_ sender: Any) {
        categoryId="3"
        self.performSegue(withIdentifier: "toCampByCat", sender: categoryId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier=="toCampDetailFromHome" {
            
            let index=sender as? Int
            let gidilecekVC=segue.destination as! CampaignDetailViewController
            gidilecekVC.campaign=campaignList[index!]
        }
        
        if segue.identifier=="toCampByCat" {
            
          //  let index=sender as? Int
            let gidilecekVC=segue.destination as! CampaignsByCategoryViewController
            gidilecekVC.catId=categoryId
        }
        
  
        
    }

    
    func GetAllCampaigns(){
        
        Alamofire.request("http://yardimeli.somee.com/api/campaign/getactivecampaigns",method: .get).responseJSON{
            
            responese in
            
            
            if let data = responese.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(CampaignsResponse.self, from: data)
                    
                    if let campList=cevap.data{
                       
                        self.campaignList=campList
                    }
           
                    DispatchQueue.main.async {
                        self.campaignTableView.reloadData()
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
}



}

extension CampaignsHomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        campaignList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let camp=campaignList[indexPath.row]
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "campCell", for: indexPath) as! CampaignsTableViewCell
        
        cell.lblCampName.text=camp.name
        cell.imageCamp.image=UIImage(named: camp.photoUrl!)
        
        
        let progres:Float = camp.currentMoney!/camp.limit!
        
        
        cell.campProgress.progress=progres
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toCampDetailFromHome", sender: indexPath.row)
    }
    
    
    
    
}
