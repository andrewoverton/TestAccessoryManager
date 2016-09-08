# TestAccessoryManager

I work at a point of sales startup. Our iPad register app connects with bluetooth credit card readers, namely the Ingenico iCMP. Someone on the QA team noticed difficulties connecting to the reader from an iOS 10 beta. I put iOS 10 beta 8 on a device, ran the app in the debugger, and indeed found that the EAAccessoryManager was returning an empty array of connected accessories, even when Settings.app was showing the card reader as a connected Bluetooth device. I was pretty sure the problem was not in our code, so I put this small sample app together to demonstrate the problem in isolation.

When I connect a card reader to my iPad mini running iOS 9.2.1 and run it from Xcode 7.2.1 the device is detected.
When I connect a card reader to my other iPad mini, which is running iOS beta 8, and run the app from the `xcode8-ios10` branch the device is not detected. All I get is a log statement that reads: `Couldn't find the com.apple.private.externalaccessory.showallaccessories entitlement`.

I have two different branches because the storyboards in Xcode 7 and Xcode 8 are incompatible.

