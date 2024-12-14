//
//  SceneDelegate.swift
//  ShareSheetCommunication
//
//  Created by 大森青 on 2024/12/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("SceneDelegate - willConnect called")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        
        // 起動時のURLがある場合の処理
        if let urlContext = connectionOptions.urlContexts.first {
            print("Launch URL detected: \(urlContext.url.absoluteString)")
            handleURL(urlContext.url)
        }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("SceneDelegate - openURLContexts called")
        guard let url = URLContexts.first?.url else { return }
        print("URL received: \(url.absoluteString)")
        handleURL(url)
    }
    
    private func handleURL(_ url: URL) {
        print("Handling URL: \(url.absoluteString)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let feedbackViewController = storyboard.instantiateViewController(identifier: "FeedbackViewController") as? FeedbackViewController else {
            print("Failed to instantiate FeedbackViewController")
            return
        }
        
        let sender = url.host ?? ""
        let feedbackText = url.path.split(separator: "/").last?.lowercased()
        let feedbackType = url.query?.split(separator: "=").last?.lowercased()
        
        feedbackViewController.sender = sender
        feedbackViewController.feedbackText = feedbackText!
        feedbackViewController.feedbackType = feedbackType!
        window?.rootViewController = feedbackViewController
    }
    
    func windowScene(_ windowScene: UIWindowScene,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        print("SceneDelegate - performActionFor shortcutItem called")
    }
    
    func scene(_ scene: UIScene,
               continue userActivity: NSUserActivity) {
        print("SceneDelegate - continue userActivity called")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

