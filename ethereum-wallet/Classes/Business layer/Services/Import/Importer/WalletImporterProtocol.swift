//
//  WalletImporterProtocol.swift
//  ethereum-wallet
//
//  Created by Artur Guseinov on 23/03/2018.
//  Copyright © 2018 Artur Guseinov. All rights reserved.
//

import Foundation

protocol WalletImporterProtocol {
  func importKey(_ key: Data, passcode: String) throws
}