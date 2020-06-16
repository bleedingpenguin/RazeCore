/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class RazeCore {
  
  /// Allows you to convert a 6 digit hexadecimal string into a UIColor instance.
  /// - Warning: The "#" symbol is stripped from the beginning of the string submitted here.
  /// - Parameters:
  ///   - hexString: A 6-digit hexadecimal string. Use 6 digits rather than 8, and add the accompany alpha value in the second parameter.
  ///   - alpha: A number between 0.0 and 1.0 indicating how transparent the color is.
  class func colorFromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
    let r, g, b: CGFloat
    let offset = hexString.hasPrefix("#") ? 1 : 0
    let start = hexString.index(hexString.startIndex, offsetBy: offset)
    let hexColor = String(hexString[start...])
    let scanner = Scanner(string: hexColor)
    var hexNumber: UInt64 = 0
    if scanner.scanHexInt64(&hexNumber) {
      r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
      g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
      b = CGFloat(hexNumber & 0x0000ff) / 255
      return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
  }
}
