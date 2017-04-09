//
//  ViewController.swift
//  Sample
//
//  Created by Abdullah Selek on 03/04/2017.
//  Copyright © 2017 Abdullah Selek. All rights reserved.
//

import UIKit
import SwiftyNotifications

class ViewController: UIViewController {

    private var notification: SwiftyNotifications!
    private var customNotification: SwiftyNotifications!

    override func viewDidLoad() {
        super.viewDidLoad()

        notification = SwiftyNotifications.withStyle(style: .info,
                                                     title: "Information Title",
                                                     subtitle: "Information description can be anything to give a description")
        view.addSubview(notification)

        customNotification = SwiftyNotifications.withStyle(style: .custom,
                                                           title: "Custom",
                                                           subtitle: "Custom notification with custom image and colors")
        customNotification.leftAccessoryView.image = UIImage(named: "apple_logo")!
        customNotification.setCustomColors(backgroundColor: UIColor.cyan, textColor: UIColor.white)
        view.addSubview(customNotification)
    }

    @IBAction func show(_ sender: Any) {
        notification.show()
    }

    @IBAction func dismiss(_ sender: Any) {
        if customNotification != nil {
            customNotification.dismiss()
        }
        notification.dismiss()
    }

    @IBAction func changeStyle(_ sender: Any) {
        let style = (sender as! UIButton).tag
        switch style {
        case 0:
            notification.customize(style: .normal)
            break
        case 1:
            notification.customize(style: .error)
            break
        case 2:
            notification.customize(style: .success)
            break
        case 3:
            notification.customize(style: .info)
            break
        case 4:
            notification.customize(style: .warning)
            break
        case 5:
            notification.dismiss()
            customNotification.show()
            break
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

