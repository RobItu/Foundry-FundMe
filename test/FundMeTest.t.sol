// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    // SetUp always runs first!
    FundMe fundMe;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();

        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function test_isOwner() public {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function test_AggregatorVersion() public {
        uint256 aggregatorVersion = fundMe.getVersion();
        assertEq(aggregatorVersion, 4);
    }
}
