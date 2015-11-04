//
//  FlowLayout.swift
//  CollectionViewDemo
//
//  Created by yunjoy on 15/11/4.
//  Copyright © 2015年 yunjoy. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewLayout {
    // 内容区域总大小，不是可见区域
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(collectionView!.bounds.size.width,
            CGFloat(collectionView!.numberOfItemsInSection(0) * 200 / 3 + 200))
    }
    
    // 所有单元格位置属性
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributesArray = [UICollectionViewLayoutAttributes]()
        let cellCount = self.collectionView!.numberOfItemsInSection(0)
        for i in 0..<cellCount {
            let indexPath =  NSIndexPath(forItem:i, inSection:0)
            
            let attributes =  self.layoutAttributesForItemAtIndexPath(indexPath)
            
            attributesArray.append(attributes!)
            
        }
        return attributesArray
    }
    
    // 这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath)
        -> UICollectionViewLayoutAttributes? {
            //当前单元格布局属性
            let attribute =  UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
            
            //单元格外部空隙，简单起见，这些常量都在方法内部定义了，没有共享为类成员
           // let itemSpacing = 2
            let lineSpacing = 1
            
            //单元格边长
            let largeCellSide:CGFloat = 200
            let smallCellSide:CGFloat = 100
            
            //内部间隙，左右5
            let insets = UIEdgeInsetsMake(5, 5, 5, 5)
            
            //当前行数，每行显示3个图片，1大2小
            let line:Int =  indexPath.item / 3
            //当前行的Y坐标
            let lineOriginY =  largeCellSide * CGFloat(line) + CGFloat(lineSpacing * line)
            //右侧单元格X坐标，这里按左右对齐，所以中间空隙大
            let rightLargeX =  collectionView!.bounds.size.width - largeCellSide - insets.right
            let rightSmallX =  collectionView!.bounds.size.width - smallCellSide - insets.right
            print(CGFloat(lineSpacing)/2)
            // 每行2个图片，2行循环一次，一共6种位置
            if (indexPath.item % 6 == 0) {
                attribute.frame = CGRectMake(insets.left, lineOriginY, largeCellSide, largeCellSide)
            } else if (indexPath.item % 6 == 1) {
                attribute.frame = CGRectMake(rightSmallX, lineOriginY, smallCellSide, smallCellSide - CGFloat(lineSpacing)/2)
            } else if (indexPath.item % 6 == 2) {
                attribute.frame = CGRectMake(rightSmallX, lineOriginY + smallCellSide + CGFloat( lineSpacing)/2,
                    smallCellSide, smallCellSide - CGFloat(lineSpacing)/2)
            } else if (indexPath.item % 6 == 3) {
                attribute.frame = CGRectMake(insets.left, lineOriginY, smallCellSide, smallCellSide - CGFloat(lineSpacing)/2)
            } else if (indexPath.item % 6 == 4) {
                attribute.frame = CGRectMake(insets.left, lineOriginY + smallCellSide + CGFloat( lineSpacing)/2,
                    smallCellSide, smallCellSide - CGFloat(lineSpacing)/2)
            } else if (indexPath.item % 6 == 5) {
                attribute.frame = CGRectMake(rightLargeX, lineOriginY, largeCellSide, largeCellSide)
            }
            
            return attribute
    }
    
    /*
    //如果有页眉、页脚或者背景，可以用下面的方法实现更多效果
    func layoutAttributesForSupplementaryViewOfKind(elementKind: String!,
    atIndexPath indexPath: NSIndexPath!) -> UICollectionViewLayoutAttributes!
    func layoutAttributesForDecorationViewOfKind(elementKind: String!,
    atIndexPath indexPath: NSIndexPath!) -> UICollectionViewLayoutAttributes!
    */

}
