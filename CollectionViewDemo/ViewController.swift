//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by yunjoy on 15/11/4.
//  Copyright © 2015年 yunjoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.collectionViewLayout = FlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: DataSourceDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 30;
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let identify = "collectionViewCell" //CollectViewCell.xib文件注册
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identify, forIndexPath: indexPath)
        if cell.contentView.subviews.count == 0{
            let childView = NSBundle.mainBundle().loadNibNamed("CollectViewCell", owner: nil, options: nil).last as! CollectViewCell
            childView.frame = CGRectMake(5, 5, cell.bounds.size.width-10, cell.bounds.size.height-10)
            
            cell.contentView.addSubview(childView)
        }else{
            cell.contentView.subviews.last!.frame = CGRectMake(5, 5, cell.bounds.size.width-10, cell.bounds.size.height-10)
        }
        
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1;
    }

    //MARK: FlowLayoutDelegate
    /*
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(80, 100)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
*/

}

