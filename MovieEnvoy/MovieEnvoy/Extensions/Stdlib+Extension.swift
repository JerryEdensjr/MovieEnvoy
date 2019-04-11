//
//  Stdlib+Extension.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation

public func print(items: Any..., file: String = #file, line: Int = #line, separator: String = "\n", terminator: String = "\n") {
  #if DEBUG
  let fileName = URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
  var output = "\(fileName) at \(line): "
  output += items.map { "\($0)" }.joined(separator: separator)
  Swift.print(output, terminator: terminator)
  #endif
}
