//
//  mycollectionview2.swift
//  web and craft
//
//  Created by Ann Antony on 19/10/24.
//

import UIKit

class mycollectionview2: UICollectionViewCell {

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var imgvw: UIImageView!
    @IBOutlet weak var categorylbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.view2.layer.cornerRadius = 10
        self.view2.layer.masksToBounds = true
        self.imgvw.layer.cornerRadius = 10
        self.view2.layer.borderWidth = 1
        self.view2.layer.borderColor = UIColor.lightGray.cgColor
    }

}
