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
    @IBOutlet weak var imgLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
        hero.isEnabled = true
       
        
    }
    
    @IBAction func button(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "hero2") as! UIViewController
          view.hero.modalAnimationType = .push(direction: .right)
          present(view, animated: true, completion: nil)
    }
    


}
