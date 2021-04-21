//
//  SpaceCell.swift
//  CellModel
//
//  Created by lihong on 2020/7/2.
//  Copyright © 2020 lihong. All rights reserved.
//

import UIKit

extension CellModel {
    public static func space(_ height: CGFloat, backgroundColor: UIColor = UIColor.clear) -> CellModel {
        return CellModel(data: height, cell: SpaceCell(height: height, backgroundColor: backgroundColor), height: height)
    }
}

private class SpaceCell: UITableViewCell, CellModelProtocol  {
    
    let cellHeight: CGFloat
    
    static func height(tableView: UITableView, data: Any?) -> CGFloat {
        return (data as? CGFloat) ?? 0
    }
    
    init(height: CGFloat, backgroundColor: UIColor) {
        self.cellHeight = height
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        self.backgroundColor = backgroundColor
        contentView.backgroundColor = backgroundColor
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height))
        selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
