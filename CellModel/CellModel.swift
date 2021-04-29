//
//  CellModel.swift
//  CellModel
//
//  Created by lihong on 2020/7/2.
//  Copyright © 2020 lihong. All rights reserved.
//

import UIKit


public struct CellModel {
    private let data: Any?
    private let identifier: String?
    private let cell: (CellProtocol & UITableViewCell)?
    private let height: CGFloat?
    private let didSelectBlock: (() -> Void)?
    
    public init(data: Any? = nil, identifier: String, height: CGFloat? = nil, didSelect: (() -> Void)? = nil) {
        self.data = data
        self.identifier = identifier
        self.height = height
        cell = nil
        self.didSelectBlock = didSelect
    }
    
    public init(data: Any? = nil, cell: CellProtocol & UITableViewCell, height: CGFloat? = nil, didSelect: (() -> Void)? = nil) {
        self.data = data
        self.cell = cell
        self.height = height
        identifier = nil
        self.didSelectBlock = didSelect
    }
    
    public func getCell(viewController: UIViewController? = nil, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        var cell: (CellProtocol & UITableViewCell)?
        if let identifier = identifier {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? (CellProtocol & UITableViewCell)
        } else {
            cell = self.cell
        }
        cell?.set(viewController: viewController, indexPath: indexPath, data: data)
        
        return cell
    }
    
    public func getHeight(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        if let height = height {
            return height
        }
        if let cell = cell {
            return type(of: cell).height(tableView: tableView, data: data)
        }
        if let identifier = identifier, let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellProtocol {
            return type(of: cell).height(tableView: tableView, data: data)
        }
        
        return 0
    }
    
    public func didSelect() {
        didSelectBlock?()
    }
}
