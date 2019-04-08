
    import Cocoa
    import SpriteKit
    import Foundation

    /**
        The native ViewController.
    */
    class ViewController : NSViewController
    {
        /** The application title. */
        static let APP_TITLE = "Developer Camp 2019 - Swift / SpriteKit Workshop, v.1.0.0, (c) 2019 Mayflower GmbH"

        /**
            Being invoked after the view has been loaded.
            Sets up the view after being loaded.
        */
        override func viewDidLoad() -> Void
        {
            super.viewDidLoad()

            let workshop = Workshop( appendTo: self.view );
        }

        /**
            Being invoked after the view has appeared on the screen.
        */
        override func viewDidAppear() -> Void
        {
            super.viewDidAppear()

            self.view.window?.styleMask.remove( .resizable )
            self.view.window?.title = ViewController.APP_TITLE
        }
    }
