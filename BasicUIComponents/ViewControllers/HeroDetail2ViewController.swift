//
//  HeroDetail2ViewController.swift
//  BasicUIComponents
//
//  Created by Mert Demirtaş on 25.09.2021.
//

import UIKit
import Hero

class HeroDetail2ViewController: UIViewController {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        hero.modalAnimationType = .push(direction: .left)
        hero.dismissViewController()
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
