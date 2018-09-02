// Copyright © 2018 Conicoin LLC. All rights reserved.
// Created by Artur Guseinov


import RealmSwift

enum CustomRealmError: Error {
  case parsingError
}

class RealmTransaction: Object {
  
  @objc dynamic var txHash = ""
  @objc dynamic var blockNumber: Int64 = 0
  @objc dynamic var timeStamp = Date()
  @objc dynamic var nonce: Int64 = 0
  @objc dynamic var from = ""
  @objc dynamic var to = ""
  @objc dynamic var value = ""
  @objc dynamic var gas = ""
  @objc dynamic var gasPrice = ""
  @objc dynamic var gasUsed = ""
  @objc dynamic var error: String?
  @objc dynamic var isPending = false
  @objc dynamic var isIncoming = false
  @objc dynamic var tokenMeta: RealmTokenMeta?
  
  override static func primaryKey() -> String? {
    return "txHash"
  }
  
}