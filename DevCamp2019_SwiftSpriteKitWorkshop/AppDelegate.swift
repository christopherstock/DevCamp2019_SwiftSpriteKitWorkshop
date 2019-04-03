
    import Cocoa

    /**
        The native application delegate.
    */
    @NSApplicationMain
    class AppDelegate: NSObject, NSApplicationDelegate
    {
        /**
            Being invoked when the application finished launching.

            - parameter notification: The notification for this event with extra data.
        */
        func applicationDidFinishLaunching( _ notification:Notification ) -> Void
        {
            // set app icon
            NSApplication.shared.applicationIconImage = NSImage( named: "icon.png" )
        }

        /**
            Being invoked before the application will tear down.

            - parameter notification: The notification for this event with extra data.
        */
        func applicationWillTerminate( _ notification:Notification ) -> Void
        {
        }

        /**
            Determines if the application shall be closed when the last visible app window was closed.

            - returns: *true* if the app should close on closing the last app window. Otherwise *false*
        */
        func applicationShouldTerminateAfterLastWindowClosed( _ application:NSApplication ) -> Bool
        {
            return true
        }
    }
