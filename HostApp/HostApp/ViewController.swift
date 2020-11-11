//
//  ViewController.swift
//  HostApp
//
//  Created by Vishun on 07/11/20.
//

import UIKit
import Social
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func share() {
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
        let purchaseEvent = """
        {
          "eventAction" : "official_store",
          "shopType" : "official_store",
          "tax" : 0,
          "userId" : "3660643",
          "isNewUser" : "false",
          "shopId" : "180459",
          "affiliation" : "Okelah Shop",
          "event" : "ecommerce_purchase",
          "payment_type" : "VA",
          "sessionIris" : "aW9zLXRva29wZWRpYQ==:BF8D2C3C-AEC0-4CD3-9B3C-05C182CD80A8:1604684018",
          "value" : 29000,
          "transaction_id" : "627867682",
          "gclid" : null,
          "businessUnit" : "payment",
          "eventCategory" : "order complete",
          "payment_status" : "2",
          "coupon" : "",
          "profileId" : "TKPD_IOS",
          "items" : [
            {
              "price" : 10000,
              "item_name" : "product 17",
              "quantity" : 1,
              "dimension73" : "none / other",
              "currency" : "IDR",
              "item_brand" : "none / other",
              "item_variant" : "",
              "item_category" : "olahraga / lain-lain",
              "item_id" : "851499643"
            }
          ],
          "logistic_type" : "GrabExpress",
          "currency" : "IDR",
          "currentSite" : "tokopediamarketplace",
          "eventLabel" : "regular checkout",
          "shipping" : 19000,
          "payment_id" : "826987038"
        }
        """
        UIPasteboard.general.setValue(purchaseEvent, forPasteboardType: "item.analytics.gavalidator")
    }

}

