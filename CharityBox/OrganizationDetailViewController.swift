//
//  OrganizationDetailViewController.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit

class OrganizationDetailViewController: UIViewController {

    @IBOutlet weak var lblOrgName: UILabel!
    @IBOutlet weak var imageOrgDetail: UIImageView!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var lblOrgShortName: UILabel!
    
    var organization:Organization?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let o = organization{
            
            imageOrgDetail.image=UIImage(named: o.photoUrl!)
            lblOrgName.text=o.name
            lblOrgShortName.text=o.shortName
            
            
            
        }
        
        

    }
    

    @IBAction func donateToOrganizations(_ sender: Any) {
        
        
    }
    

}
