// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Raffle} from "../src/Raffle.sol";
import {VRFCoordinatorV2Mock} from "/home/renwme/hai/h/lib/chainlink-brownie-contracts/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2Mock.sol";

contract createSubscription is Script {
    // saya akan membuat function membuat 3 main function
    // - create subscription , -addcustomer , - fundscription
    // - semua ini menggunakan inheritance dari Vrfcoordinator mock 2

    // 1. create subscription function
    function createSubscriptionConfig() public returns (uint64, address) {
        HelperConfig helperConfig = new HelperConfig();
        (
            ,
            ,
            ,
            ,
            ,
            address vrfCoordinatorV2,
            ,
            uint256 deployerKey
        ) = helperConfig.activeNetworkConfig();
        return createSubscription(vrfCoordinatorV2, deployerKey);
    }

    function createSubscription(
        address vrfcordinator,
        uint256 deployerKey
    ) public returns (uint64, address) {
        vm.startBroadcast(deployerKey);
        uint64 subId = VRFCoordinatorV2Mock.createSubscription(vrfcordinatorV2);
        vm.stopBroadcast();
    }
}
