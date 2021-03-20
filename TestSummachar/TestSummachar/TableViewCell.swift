//
//  TableViewCell.swift
//  TestSummachar
//
//  Created by manukant Tyagi on 19/03/21.
//

import UIKit
import UPCarouselFlowLayout

class TableViewCell: UITableViewCell {
    
    
    let screenRect = UIScreen.main.bounds
    let imageData = ImageData()
    var imageArr: [UIImage] = []
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bookmark: UIButton!
    @IBOutlet weak var heart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
//
        collectionView.dataSource = self
        
//
    }

    
    @IBAction func heartButton(_ sender: Any) {
        if heart.currentImage == UIImage(systemName: "heart"){
//            print("heart")
            heart.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            
        } else {
            heart.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)

        }
    }
    @IBAction func bookmark(_ sender: Any) {
        if bookmark.currentImage == UIImage(systemName: "bookmark"){
//            print("bookmark")
            bookmark.setImage(UIImage(systemName: "bookmark.fill"), for: UIControl.State.normal)
            bookmark.tintColor = .blue
            
        } else {
            bookmark.setImage(UIImage(systemName: "bookmark"), for: UIControl.State.normal)
            bookmark.tintColor = .white
    }
    }
    @IBAction func share(_ sender: Any) {
        var maxHeight: CGFloat = 0
        var img: UIImage?
        for a in imageArr{
            if a.size.height > maxHeight{
                
                maxHeight = a.size.height
                print(maxHeight)
                img = a
            }
                
            
        }
        if let image = img{
            ImageData.arr = image
        }
        
        
    }
}

//MARK: - UICollectionViewDataSource



extension TableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArr = imageData.arr[ImageData.section]
        
        return imageData.arr[ImageData.section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell
        cell?.imageView.image = imageArr[indexPath.row]
       return cell!
    }
}
