//
//  FriendsPhotoController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//
import UIKit


class FriendsPhotoController: UICollectionViewController {

    var photos = [UIImage]()    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell", for: indexPath) as! FriendsPhotoCell
    
        cell.photoView.image = photos[indexPath.item]
    
        return cell
    }

}




