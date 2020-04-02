//
//  HostingController.swift
//  piczzie
//
//  Created by Thomas on 02/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import UIKit
import SwiftUI

class HostingController: UIHostingController<MainView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
