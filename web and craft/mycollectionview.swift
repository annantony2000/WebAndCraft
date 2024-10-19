//
//  mycollectionview.swift
//  web and craft
//
//  Created by Ann Antony on 19/10/24.
//

import UIKit

class mycollectionview: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var discount: UILabel!
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rating: UIImageView!
    
    @IBOutlet weak var actualprice: UILabel!
    
    @IBOutlet weak var offerprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.view.layer.cornerRadius = 10
        self.view.layer.masksToBounds = true
        self.img.layer.cornerRadius = 10
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.lightGray.cgColor
    }
    func configImg(url: String) {
//        UIImageView.load(urlstr: url)
    }

}
