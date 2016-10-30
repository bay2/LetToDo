// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
#elseif os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#endif

// swiftlint:disable file_length
// swiftlint:disable type_body_length
enum Asset: String {
  case toDoListAdd = "ToDoListAdd"
  case toDoListDone = "ToDoListDone"
  case toDoListInProgess = "ToDoListInProgess"
  case homeAdd = "HomeAdd"
  case launchScreen = "LaunchScreen"
  case navBarMuen = "NavBarMuen"
  case navBarSetting = "NavBarSetting"
  case swipeDelBtn = "SwipeDelBtn"
  case swipeDelBtnHighligt = "SwipeDelBtnHighligt"
  case taskChangeBtn = "TaskChangeBtn"
  case taskChangeHighlightBtn = "TaskChangeHighlightBtn"

  var image: Image {
    return Image(asset: self)
  }
}
// swiftlint:enable type_body_length

extension Image {
  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}

