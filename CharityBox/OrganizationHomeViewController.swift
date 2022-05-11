//
//  OrganizationHomeViewController.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit
import Alamofire

class OrganizationHomeViewController: UIViewController {

    @IBOutlet weak var organizationTableView: UITableView!
    
    var organizasyonListe=[Organization]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        organizationTableView.dataSource=self
        organizationTableView.delegate=self
        
        
        GetAll()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index=sender as? Int
        
        let gidilecekVC=segue.destination as! OrganizationDetailViewController
        gidilecekVC.organization=organizasyonListe[index!]
        
        
    }
    

    func GetAll(){
            
            Alamofire.request("http://yardimeli.somee.com/api/Organizations/GetOrganizations",method: .get).responseJSON{
                
                responese in
                
                
                if let data = responese.data{
                    
                    do{
                        
                        let cevap = try JSONDecoder().decode(OrganizationResponse.self, from: data)
                        
                        if let orgList=cevap.data{
                            
                            self.organizasyonListe=orgList
                        }
                        DispatchQueue.main.async {
                            self.organizationTableView.reloadData()
                        }
                        
                        
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
    }

}
extension OrganizationHomeViewController:UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        organizasyonListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let organ=organizasyonListe[indexPath.row]
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "orgCell", for: indexPath) as! OrganizationTableViewCell
        
        cell.nameLbl.text=organ.name
        cell.shortNameLbl.text=organ.shortName
        cell.imageVw.image=UIImage(named: organ.photoUrl!)
        
        return cell
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toOrgDetail", sender: indexPath.row)
        
    }
    
    
    
    
    
}
