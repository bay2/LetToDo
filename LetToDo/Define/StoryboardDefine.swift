// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType>(segue: S, sender: AnyObject? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

// swiftlint:disable file_length
// swiftlint:disable type_body_length

struct StoryboardScene {
  enum Home: String, StoryboardSceneType {
    static let storyboardName = "Home"

    static func initialViewController() -> UINavigationController {
      guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case addGroupViewControllerScene = "AddGroupViewController"
    static func instantiateAddGroupViewController() -> AddGroupViewController {
      guard let vc = StoryboardScene.Home.addGroupViewControllerScene.viewController() as? AddGroupViewController
      else {
        fatalError("ViewController 'AddGroupViewController' is not of the expected class AddGroupViewController.")
      }
      return vc
    }

    case editGroupViewControllerScene = "EditGroupViewController"
    static func instantiateEditGroupViewController() -> EditGroupViewController {
      guard let vc = StoryboardScene.Home.editGroupViewControllerScene.viewController() as? EditGroupViewController
      else {
        fatalError("ViewController 'EditGroupViewController' is not of the expected class EditGroupViewController.")
      }
      return vc
    }

    case editGroupViewNavControllerScene = "EditGroupViewNavController"
    static func instantiateEditGroupViewNavController() -> UINavigationController {
      guard let vc = StoryboardScene.Home.editGroupViewNavControllerScene.viewController() as? UINavigationController
      else {
        fatalError("ViewController 'EditGroupViewNavController' is not of the expected class UINavigationController.")
      }
      return vc
    }

    case homeGroupViewControllerScene = "HomeGroupViewController"
    static func instantiateHomeGroupViewController() -> HomeGroupViewController {
      guard let vc = StoryboardScene.Home.homeGroupViewControllerScene.viewController() as? HomeGroupViewController
      else {
        fatalError("ViewController 'HomeGroupViewController' is not of the expected class HomeGroupViewController.")
      }
      return vc
    }
  }
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Task: String, StoryboardSceneType {
    static let storyboardName = "Task"

    case toDoViewControllerScene = "ToDoViewController"
    static func instantiateToDoViewController() -> ToDoViewController {
      guard let vc = StoryboardScene.Task.toDoViewControllerScene.viewController() as? ToDoViewController
      else {
        fatalError("ViewController 'ToDoViewController' is not of the expected class ToDoViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}

