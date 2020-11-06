//
//  TrackerMockData.swift
//  GAValidator
//
//  Created by Vishun on 01/11/20.
//

import Foundation
struct TrackerMockData {
    let items = [
        "addToCart",
        "addToCart",
        "addToCart",
        "addToCart",
        "addToCart",
        "addToCart",
        "addToCart"
    ]
    var trackers:[TrackerItem] {
        items.compactMap { (item) -> TrackerItem in
            TrackerItem(data: addToCart.data(using: .utf8)!)
        }
    }

    
    let addToCart = """
    {
      "layout" : "layout:audit_exp_b;catName:Travel Case Game;catId:3825",
      "eventCategory" : "product detail page",
      "userId" : "22177082",
      "currency" : "IDR",
      "sessionIris" : "aW9zLXRva29wZWRpYQ==:B2E5AB72-EDB6-493B-89C1-915883657478:1604660642",
      "gclid" : null,
      "shopId" : "838028",
      "event" : "add_to_cart",
      "productId" : "665695664",
      "eventLabel" : "fitur: occ",
      "items" : [
        {
          "item_category" : "Travel Case Game / Aksesoris Game Console / Gaming",
          "dimension69" : "838028",
          "quantity" : 1,
          "dimension71" : "official_store",
          "item_brand" : "None / Other",
          "dimension72" : "3825",
          "price" : 310000,
          "dimension48" : "false",
          "dimension42" : "1998544978",
          "dimension39" : "null",
          "dimension47" : "regular",
          "dimension70" : "Rocket games",
          "dimension73" : "bebas ongkir",
          "item_name" : "Nintendo Switch Lite Skull & Co. EDC Case Bundle Lite Case / TPU / EVA",
          "item_variant" : "None / Other",
          "item_id" : "665695664",
          "index" : 0
        }
      ],
      "shopType" : "official_store",
      "eventAction" : "click - Beli Langsung on pdp"
    }
    """
}
