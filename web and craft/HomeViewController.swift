//
//  HomeViewController.swift
//  web and craft
//
//  Created by Ann Antony on 18/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    var viewmodel: viewModel?
    var apiList = [WebAPIResponse]()
    var apiContentIndex1 = [ContentListResponse]()
    var apiContentIndex4 = [ContentListResponse]()
    var apiContentIndex3 = [ContentListResponse]()
    
 
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var collectionview3: UICollectionView!
    @IBOutlet weak var collectionview2: UICollectionView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var searchtxt: UITextField!
    
    let imageUrls = [
             "https://static.vecteezy.com/system/resources/previews/006/532/742/non_2x/flash-sale-banner-illustration-template-design-of-special-offer-discount-for-media-promotion-and-social-media-post-free-vector.jpg",
            "https://www.shutterstock.com/image-vector/banner-announcing-mega-discount-half-260nw-1962489325.jpg",
            "https://www.shutterstock.com/image-vector/summer-ad-sale-banner-popart-260nw-1458893918.jpg"
        ]
    
        
        var currentIndex = 0
        var timer: Timer?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        self.viewmodel = viewModel()
        self.viewmodel?.fetchWebApiData(completion: { result in
            self.apiList = result
            self.apiContentIndex1 = self.apiList[1].contents ?? []
            self.apiContentIndex4 = self.apiList[4].contents ?? []
            self.apiContentIndex3 = self.apiList[3].contents ?? []
            print(self.apiContentIndex1[0].sku)
            
            self.collectionview.reloadData()
            self.collectionview2.reloadData()
            self.collectionview3.reloadData()

            
        })
        
        
        img.contentMode = .scaleAspectFit
                
                // Start loading and switching images
                loadImage(from: imageUrls[currentIndex])
                startTimer()
        
        searchtxt.layer.cornerRadius = 15
               searchtxt.layer.masksToBounds = false  // Important to show shadow properly
               searchtxt.layer.shadowColor = UIColor.black.cgColor
               searchtxt.layer.shadowOpacity = 0.3
               searchtxt.layer.shadowOffset = CGSize(width: 3, height: 3)
               searchtxt.layer.shadowRadius = 5
               
               // Create a shadow path based on the current shape (including the corner radius)
               let shadowPath = UIBezierPath(roundedRect: searchtxt.bounds, cornerRadius: searchtxt.layer.cornerRadius)
               searchtxt.layer.shadowPath = shadowPath.cgPath
        // Do any additional setup after loading the view.
    }
    func setUI(){
        // viewPagemation.layer.cornerRadius = 25
        collectionview.register(UINib(nibName: "mycollectionview", bundle: nil), forCellWithReuseIdentifier: "mycollectionview")
        
        collectionview2.register(UINib(nibName: "mycollectionview2", bundle: nil), forCellWithReuseIdentifier: "collectionview2")
        collectionview3.register(UINib(nibName: "mycollectionview", bundle: nil), forCellWithReuseIdentifier: "mycollectionview")
        
        
        
    }
    func loadImage(from url: String) {
            guard let imageUrl = URL(string: url) else {
                print("Invalid URL")
                return
            }
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        UIView.transition(with: self.img, duration: 0.5, options: .transitionCrossDissolve, animations: {
                            self.img.image = image
                        }, completion: nil)
                    }
                } else {
                    print("Failed to load image from URL")
                }
            }
        }
        
        // Start the timer to change the image every 2 seconds
        func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        }
        
        // Change to the next image
        @objc func changeImage() {
            currentIndex = (currentIndex + 1) % imageUrls.count
            loadImage(from: imageUrls[currentIndex])
        }
        
        // Stop the timer when the view disappears
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            timer?.invalidate()
        }
    }
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycollectionview", for: indexPath) as! mycollectionview
            cell.name.text = apiContentIndex4[indexPath.row].sku
            cell.actualprice.text = apiContentIndex4[indexPath.row].actual_price
            cell.offerprice.text = apiContentIndex4[indexPath.row].offer_price
          
            cell.discount.text = apiContentIndex4[indexPath.row].discount
            return cell
        } else if collectionView == self.collectionview2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionview2", for: indexPath) as! mycollectionview2
            
            cell.categorylbl.text = apiContentIndex3[indexPath.row].title

            return cell
        }
        if collectionView == self.collectionview3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycollectionview", for: indexPath) as! mycollectionview
            cell.name.text = apiContentIndex4[indexPath.row].sku
            cell.actualprice.text = apiContentIndex4[indexPath.row].actual_price
            cell.offerprice.text = apiContentIndex4[indexPath.row].offer_price
            
            cell.discount.text = apiContentIndex4[indexPath.row].discount
            return cell
        }
            else {
            return UICollectionViewCell()
        }
      
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionview { //Most Popular
            return apiContentIndex4.count
        } else if collectionView == self.collectionview2 {
            return apiContentIndex3.count
        }else if collectionView == self.collectionview3{
            return apiContentIndex1.count
        }
        else {
            return 0
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionview {
            return CGSize(width: 175 , height: (self.collectionview.frame.size.height))
        } else if collectionView == self.collectionview2 {
            return CGSize(width: 175 , height: (self.collectionview.frame.size.height))
        }else if collectionView == self.collectionview3{
            return CGSize(width: 175 , height: (self.collectionview3.frame.size.height))
        }
        else {
            return CGSize(width: 0, height: 0)
        }
       
        
    }
    
    /*)
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
