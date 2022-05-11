//
//  CampaignDetailViewController.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit

class CampaignDetailViewController: UIViewController {

    @IBOutlet weak var detailCurrent: UILabel!
    @IBOutlet weak var detailLimit: UILabel!
    @IBOutlet weak var campDetailProgress: UIProgressView!
    @IBOutlet weak var cmpImageDetail: UIImageView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var campDetailDesc: UILabel!
    @IBOutlet weak var campDetailName: UILabel!
    var campaign:Campaigns?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        if let c=campaign{
            
            let intLimit=Int(c.limit ?? 0)
            let intCurrentMoney=Int(c.currentMoney ?? 0)
            

            
            detailLimit.text=String(intLimit)
            detailCurrent.text=String(intCurrentMoney)
            cmpImageDetail.image=UIImage(named: c.photoUrl!)
            campDetailDesc.text=c.description
            campDetailName.text=c.name
            //date.text=c.createdDate
            
            let progres:Float = c.currentMoney!/c.limit!
            
            
            campDetailProgress.progress=progres
            
            
            
            
        }
        
        
    }
    



}
