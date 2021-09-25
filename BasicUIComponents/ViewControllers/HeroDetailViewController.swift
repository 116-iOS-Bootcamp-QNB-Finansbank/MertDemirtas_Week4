//
//  HeroDetailViewController.swift
//  BasicUIComponents
//
//  Created by Mert Demirtaş on 25.09.2021.
//

import UIKit
import Hero

class HeroDetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "swiftImg")
        
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imgView.addGestureRecognizer(tapGR)
        imgView.isUserInteractionEnabled = true
        
        imgView.hero.id = "img"
       

        // Do any additional setup after loading the view.
       
        
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "second", sender: "")

    }
   

}
