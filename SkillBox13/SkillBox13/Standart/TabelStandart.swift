//
//  TabelStandart.swift
//  SkillBox13
//
//  Created by Илья Лобков on 05/11/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class TabelStandart: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var tableViewStandart: UITableView!
    
    var array: [Weather] = []
    var erorrDownload: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NewStandartMetod().loadCatigories { list in
            self.array = list
            DispatchQueue.main.async {
                self.tableViewStandart.reloadData()
            }
        }
    }
    
}

extension TabelStandart: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard array.count != 0 else {return 1}
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellStandart") as! CategoryCell
        
        if array.count != 0 {
            let model = array[indexPath.row]
            let modelIcon = array[indexPath.row]
            cell.dataLabal.text = model.dt_txt
            cell.tempLabal.text = "\(Int(model.main?.temp ?? 0))˚C"
            let icon = modelIcon.weather[0]
            
            statusImage.image = UIImage.init(named: String(icon?.icon ?? "L7fMEJejqXI"))
            
        } else {
            cell.tempLabal.text = "Error"
            cell.dataLabal.text = "No connect of the Ethernet"
            
        }
        return cell
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }}


