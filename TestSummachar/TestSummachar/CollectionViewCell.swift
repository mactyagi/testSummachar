//
//  CollectionViewCell.swift
//  TestSummachar
//
//  Created by manukant Tyagi on 19/03/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }
}
