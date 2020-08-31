//
//  String + Height.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 27.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import UIKit

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize,
                                     options: [.usesLineFragmentOrigin],
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        
        return ceil(size.height)
    }
    
}
