
    import SpriteKit
    import Foundation

    /**
        Offers all cocoa specific keyCodes for the primal game keys.
    */
    enum KeyCode : UInt16
    {
        /** Arrow Up key. */
        case UP    = 126
        /** Arrow Down key. */
        case DOWN  = 125
        /** Arrow Left key. */
        case LEFT  = 123
        /** Arrow Right key. */
        case RIGHT = 124
    }

    /**
        The input controller that recognizes key events.
    */
    class KeySystem
    {
        /** Flags the 'pressed' state for all keyCodes. */
        var pressed :[UInt16:Bool] = [:]

        /**
            Creates a new key system by adding event monitoring for key up and down events.
        */
        init()
        {
            NSEvent.addLocalMonitorForEvents( matching: .keyDown )
            {
                self.onKeyDown( event: $0 )

                // returning 'nil' indicates the event as handled
                return nil
            }

            NSEvent.addLocalMonitorForEvents( matching: .keyUp )
            {
                self.onKeyUp( event: $0 )

                // returning 'nil' indicates the event as handled
                return nil
            }
        }

        /**
            Determines if a key is currently pressed.

            - parameter keyCode: The keyCode to determine pressed behaviour for.

            - return: *true* if the key with the queried keyCode is currently pressed. Otherwise *false*.
        */
        func isPressed( keyCode:KeyCode ) -> Bool
        {
            if let pressed = pressed[ keyCode.rawValue ]
            {
                return pressed
            }

            return false
        }

        /**
            Being invoked when a key is pressed.

            - parameter event: The event object that contains all information about the key down event.
        */
        private func onKeyDown( event:NSEvent ) -> Void
        {
            pressed[ event.keyCode ] = true
        }

        /**
            Being invoked when a key is released.

            - parameter event: The event object that contains all information about the key up event.
        */
        private func onKeyUp( event:NSEvent ) -> Void
        {
            pressed[ event.keyCode ] = false
        }
    }
