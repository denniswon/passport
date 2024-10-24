// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Passport: A suite of contracts for Modular Smart Accounts compliant with ERC-7579 and ERC-4337

import { IERC4337Account } from "./IERC4337Account.sol";
import { IERC7579Account } from "./IERC7579Account.sol";
import { IPassportEventsAndErrors } from "./IPassportEventsAndErrors.sol";

/// @title Passport - IPassport Interface
/// @notice Integrates ERC-4337 and ERC-7579 standards to manage smart accounts within the Passport suite.
/// @dev Consolidates ERC-4337 user operations and ERC-7579 configurations into a unified interface for smart account management.
/// It extends both IERC4337Account and IERC7579Account, enhancing modular capabilities and supporting advanced contract architectures.
/// Includes error definitions for robust handling of common issues such as unsupported module types and execution failures.
/// The initialize function sets up the account with validators and configurations, ensuring readiness for use.
/// Special thanks to Biconomy, Rhinestone, and Solady team for foundational contributions
interface IPassport is IERC4337Account, IERC7579Account, IPassportEventsAndErrors {
    /// @notice Initializes the smart account with a validator and custom data.
    /// @dev This method sets up the account for operation, linking it with a validator and initializing it with specific data.
    /// Can be called directly or via a factory.
    /// @param initData Encoded data used for the account's configuration during initialization.
    function initializeAccount(bytes calldata initData) external payable;
}
