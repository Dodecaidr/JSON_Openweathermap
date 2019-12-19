//
//  MetodAlomofire.swift
//  SkillBox13
//
//  Created by Илья Лобков on 18/11/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation
import UIKit

class MetodAlomofire: UIViewController {
    var arrayAloma: [Weather] = []
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NewStandartMetod().loadCatigories { list in
            self.arrayAloma = list
            DispatchQueue.main.async {
                
                self.CollectionView.reloadData()
            }
        }
    }
    
}

extension MetodAlomofire: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (UIScreen.main.bounds.size.width / 2) - 3
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard arrayAloma.count != 0  else { return 1}
        return arrayAloma.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColectionCell", for: indexPath) as! CollectionViewCell
        
        if arrayAloma.count != 0 {
            let model = arrayAloma[indexPath.row]
            print (model)
            let modelIcon = model.weather[0]?.icon
            
            cell.dateAlomaLabel.text = model.dt_txt
            cell.tempAlomaLabel.text = "\(Int(model.main?.temp ?? 0))˚C"
            cell.imageAloma.image = UIImage.init(named: String( modelIcon ?? "L7fMEJejqXI"))
            
        } else {
            cell.dateAlomaLabel.text = "Error"
            cell.dateAlomaLabel.text = "No connect of the Ethernet"
            
        }
        return cell
    }
}



