//
//  SceneDelegate.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController!
    var dependency: Dependency!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        navigationController = UINavigationController()
        dependency = Dependency()
        
        
        MainFactory.rootIn(navigationController: navigationController,dependency: dependency)
        
        
        let url = connectionOptions.urlContexts.first?.url
        if let url = url {
            let deepLink = DeepLinkType.github
            deepLink.handleDeepLinkType(url: url) {[weak self] (url) in
                print(url)
                DetailFactory.pushIn(navigationController: (self?.navigationController)!, dependence: (self?.dependency)!, parentViewModel: nil)
            }
        }
        
        
        
        
        
        self.window = UIWindow()
        self.window?.windowScene = windowScene
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        self.window?.frame = UIScreen.main.bounds
        
        
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for i in URLContexts {
            
            if i.url.path == "/ws/1.1/matcher.track.get" {
                let deepLink = DeepLinkType.song
                deepLink.handleDeepLinkType(url: i.url) {[weak self] (url) in
                    if let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                        SongFactory.createIn(navigationController: (self?.navigationController)!, dependency: (self?.dependency)!, datasource: nil, parentViewModel: nil)
                    }
                }
            }else {
                let deepLink = DeepLinkType.github
                deepLink.handleDeepLinkType(url: i.url) {[weak self] (url) in
                    if let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                        DetailFactory.pushIn(navigationController: (self?.navigationController)!, dependence: (self?.dependency)!, parentViewModel: nil)
                    }
                }
                
            }
            
        }
        
    }

}

