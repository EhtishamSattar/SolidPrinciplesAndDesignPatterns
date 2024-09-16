//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//The Adapter Pattern is a structural design pattern that allows incompatible interfaces or classes to work together by converting the interface of a class into another interface that a client expects. It acts as a bridge between two incompatible interfaces or classes.



//Let's say you have a standard USB charger at home, but you want to charge your new laptop that only supports USB-C. The USB-C plug is not compatible with the standard USB port. To solve this problem, you need an adapter that can convert the USB-C plug to fit into the standard USB port.


// The target interface: this is what the client expects
protocol USBCharger {
    func charge()
}

// The existing class that is incompatible with the target interface
class USBCDevice {
    func chargeWithUSBC() {
        print("Charging device with USB-C")
    }
}

// The Adapter: makes the incompatible class compatible with the target interface
class USBToUSBCAdapter: USBCharger {
    private let usbCDevice: USBCDevice

    init(device: USBCDevice) {
        self.usbCDevice = device
    }

    func charge() {
        usbCDevice.chargeWithUSBC() // Adapter translates the call
    }
}

// Client code
let usbCDevice = USBCDevice()
let adapter = USBToUSBCAdapter(device: usbCDevice)
adapter.charge() // Output: Charging device with USB-C

