//
//  Protocol.swift
//  CellModel
//
//  Created by lihong on 2021/4/29.
//  Copyright © 2021 lihong. All rights reserved.
//

import UIKit

public protocol CellProtocol {
    func set(viewController: UIViewController?, indexPath: IndexPath, data: Any?)
    static func height(tableView: UITableView, data: Any?) -> CGFloat
}

public extension CellProtocol {
    func set(viewController: UIViewController?, indexPath: IndexPath, data: Any?) {

    }
    static func height(tableView: UITableView, data: Any?) -> CGFloat {
        return 44
    }
}


public protocol CellModelProtocol {
    var cellModels: [[CellModel]] { get }
}

extension UITableViewDataSource where Self : CellModelProtocol {
    public func internal_internal_numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellModels.count
    }
    
    public func internal_tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels[section].count
    }
    
    public func internal_tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = cellModels[indexPath.section][indexPath.row]
        
        return model.getHeight(tableView: tableView, indexPath: indexPath)
    }
    
    public func internal_tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cellModels[indexPath.section][indexPath.row]

        return model.getCell(tableView: tableView, indexPath: indexPath)!
    }

    public func internal_tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = cellModels[indexPath.section][indexPath.row]
        model.didSelect()
    }

}
