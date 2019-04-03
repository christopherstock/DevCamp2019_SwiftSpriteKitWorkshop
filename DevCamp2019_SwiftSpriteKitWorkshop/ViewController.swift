
    import Cocoa
    import SpriteKit
    import Foundation

    /**
        The native ViewController.
    */
    class ViewController : NSViewController
    {
        /**
            Being invoked after the view has been loaded.
            Sets up the view after being loaded.
        */
        override func viewDidLoad() -> Void
        {
            super.viewDidLoad()

            let workshop = Workshop();
            workshop.appendWorkshopView( to: self.view )
        }

        /**
            Being invoked after the view has appeared on the screen.
        */
        override func viewDidAppear() -> Void
        {
            super.viewDidAppear()

            self.view.window?.styleMask.remove( .resizable )
            self.view.window?.title = "SwiftSpriteKitWorkshop, v.1.0.0, (c) 2019 Mayflower GmbH"
        }
    }
