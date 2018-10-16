//
//  ViewController.swift
//  ex00
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/05.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let imageUrls = ["https://images.pexels.com/photos/175718/pexels-photo-175718.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                     "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-8370.jpg",
                     "http://images.pexels.com/photos/1292344/pexels-photo-1292344.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                     "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-635734.jpg"]
    
    var numberOfItems = 4;
    var count = 0;

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as! myCellCollectionViewCell;
        

        

       
        guard let url = URL(string: imageUrls[count] ) else { return cell }
        count = count + 1;
        
        myCellCollectionViewCell.load()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let data = try? Data(contentsOf: url)
        
        DispatchQueue.global(qos: .background).async {
            if let data = data, let image = UIImage(data: data) {
                cell.imageView.image = image;
                
//                if (indexPath.row == self.imageUrls.count - 1) {
//                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
//                }
            }
            DispatchQueue.main.async {
                // Update the UI

            }
        
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertController(title: "Image Error", message: "Image not read properly", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

