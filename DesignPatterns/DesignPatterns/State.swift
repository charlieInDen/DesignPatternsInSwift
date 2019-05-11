//
//  State.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

enum State
{
    case offHook
    case connecting
    case connected
    case onHold
}

enum Trigger
{
    case callDialed
    case hungUp
    case callConnected
    case placedOnHold
    case takenOffHold
    case leftMessage
}

let rules = [
    State.offHook: [
        (Trigger.callDialed, State.connecting)
    ],
    State.connecting: [
        (Trigger.hungUp, State.offHook),
        (Trigger.callConnected, State.connected)
    ],
    State.connected: [
        (Trigger.leftMessage, State.offHook),
        (Trigger.hungUp, State.offHook),
        (Trigger.placedOnHold, State.onHold)
    ],
    State.onHold: [
        (Trigger.takenOffHold, State.connected),
        (Trigger.hungUp, State.offHook)
    ]
]
