//
//  ViewController.swift
//  Dec-12-CollectionView
//
//  Created by Admin on 13/12/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var left_right_padding: CGFloat = 20
    var inter_cell_spacing: CGFloat = 20
    
    var data = Animal.name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "customCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
}

extension FirstVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCollectionViewCell
        
        cell.showImg.image = UIImage(named: data[indexPath.row])
//        cell.backgroundColor = .systemRed
//        cell.layer.cornerRadius = 50
//        if(indexPath.section == 0) {
//            cell.backgroundColor = .systemYellow
//        }
//        else {
//            cell.backgroundColor = .systemGreen
//        }
        
        return cell
    }
}

extension FirstVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension FirstVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let num_of_cell: CGFloat = 4
        let available_space = (collectionView.bounds.width)-(left_right_padding*2)-(inter_cell_spacing*(num_of_cell-1))
        
        let img_dimension = available_space/num_of_cell
        
        return CGSize(width: img_dimension, height: img_dimension)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
    }
}

