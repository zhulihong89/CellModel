//
//  LineCell.swift
//  CellModel
//
//  Created by lihong on 2020/7/2.
//  Copyright © 2020 lihong. All rights reserved.
//

import UIKit

extension CellModel {
    public static func line(left: CGFloat = 0, right: CGFloat = 0, lineColor: UIColor = UIColor(white: 237.0 / 255, alpha: 1), backgroundColor: UIColor = UIColor.white) -> CellModel {
        return CellModel(data: nil, cell: LineCell(left: left, right: right, lineColor: lineColor, backgroundColor: backgroundColor), height: 0.5)
    }
}

private class LineCell: UITableViewCell, CellProtocol {
    let left: CGFloat
    let right: CGFloat
    let line = UIView()

    init(left: CGFloat, right: CGFloat, lineColor: UIColor, backgroundColor: UIColor) {
        self.left = left
        self.right = right
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "LineCell")
        
        self.backgroundColor = backgroundColor
        contentView.backgroundColor = backgroundColor
        line.backgroundColor = lineColor
        contentView.addSubview(line)
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0.5))
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        line.frame = CGRect(x: left, y: 0, width: bounds.width - left - right, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func height(tableView: UITableView, data: Any?) -> CGFloat {
        return 0.5
    }
}
