//
//  HomeworkCollectionViewController.swift
//  BasicUIComponents
//
//  Created by Mert Demirtaş on 23.09.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeworkCollectionViewController: UICollectionViewController {

    @IBOutlet weak var changeButton: UIButton!
    
    var control = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ImageAndLabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imgLabelCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
        
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                layout.minimumLineSpacing = 5
                layout.minimumInteritemSpacing = 5
                collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeButton(_ sender: Any){
        if (control==2) {
            control=1
            collectionView.reloadData()
            print("ss")
        }
        else{
            control=2
            collectionView.reloadData()
            print("ss")


        }
    }
    
    struct cellItems {
        var cellImage : UIImage
        var cellLabel : String
    }

    var cells = [
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        cellItems(cellImage: UIImage(named: "zikirmatik")!, cellLabel: "Kodluyoruz"),
        
        
    
    ]
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
   
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


    
}


extension HomeworkCollectionViewController: UICollectionViewDelegateFlowLayout{
override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}


override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return cells.count
    
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageAndLabelCollectionViewCell

//    let alg = cells[indexPath.row]
  //  cell.label.text = alg.cellLabel
    //cell.img.image = alg.cellImage
    
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgLabelCell", for: indexPath) as! ImageAndLabelCollectionViewCell
        let alg = cells[indexPath.row]
        // 2
    cell.img.image = alg.cellImage
    cell.label.text = alg.cellLabel
        // 3
    
    // Configure the cell

    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / CGFloat(control) - gridLayout.minimumInteritemSpacing
            return CGSize(width:widthPerItem, height:300)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }
}

