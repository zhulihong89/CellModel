//
//  IndicatorCell.swift
//  CellModel
//
//  Created by lihong on 2020/7/2.
//  Copyright © 2020 lihong. All rights reserved.
//

import UIKit

extension CellModel {
    public static func indicator() -> CellModel {
        return CellModel(data: nil, cell: IndicatorCell(), height: 60)
    }
}

private class IndicatorCell: UITableViewCell, CellProtocol {
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    static func height(tableView: UITableView, data: Any?) -> CGFloat {
        return 60
    }
    
    init() {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "LineCell")
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear

        indicator.startAnimating()
        contentView.addSubview(indicator)
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        indicator.center = contentView.center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

