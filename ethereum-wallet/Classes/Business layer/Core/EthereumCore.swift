// ethereum-wallet https://github.com/flypaper0/ethereum-wallet
// Copyright (C) 2018 Artur Guseinov
//
// This program is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the Free
// Software Foundation, either version 3 of the License, or (at your option)
// any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
// more details.
//
// You should have received a copy of the GNU General Public License along with
// this program.  If not, see <http://www.gnu.org/licenses/>.


import UIKit
import Geth

protocol EthereumCoreProtocol {
  var context: GethContext { get }
  var client: GethEthereumClient! { get } 
  func start(chain: Chain, delegate: SyncCoordinatorDelegate) throws
}

class Ethereum: EthereumCoreProtocol {

  static let core = Ethereum()
  static let syncQueue = DispatchQueue(label: "com.ethereum-wallet.sync")
  
  let context: GethContext = GethNewContext()
  var syncCoordinator: SyncCoordinatorProtocol!
  var client: GethEthereumClient!
  var chain: Chain!
  
  private init() {}
  
  func start(chain: Chain, delegate: SyncCoordinatorDelegate) throws {
    try syncCoordinator.startSync(chain: chain, delegate: delegate)
    self.client = try syncCoordinator.getClient()
    self.chain = chain
  }

}

