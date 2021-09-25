//
//  HeroDetail2ViewController.swift
//  BasicUIComponents
//
//  Created by Mert Demirtaş on 25.09.2021.
//

import UIKit
import Hero

class HeroDetail2ViewController: UIViewController {

  
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "swiftImg")
        self.hero.isEnabled = true
        
        // Do any additional setup after loading the view.
        imageView.hero.id = "img"
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGR)
        imageView.isUserInteractionEnabled = true
        
        imageView.hero.modifiers = [.cascade]
        imgLabel.hero.modifiers = [.fade, .scale(0.5)]
        
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
       // hero.dismissViewController()
        hero.unwindToRootViewController()

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
