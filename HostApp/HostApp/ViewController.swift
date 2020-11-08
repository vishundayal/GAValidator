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
        UIPasteboard.general.setValue(addToCart, forPasteboardType: "item.analytics.gavalidator")
//        let item = AnalyticsActivity()
//        let fileURl = URL(fileURLWithPath: "public.analytics")
//        let activityVC = UIActivityViewController(activityItems: [AnalyticsItemProvider(placeholderItem: "123")], applicationActivities: [])
//            activityVC.popoverPresentationController?.sourceView = self.view
//            self.present(activityVC, animated: true, completion: nil)
    }

}

