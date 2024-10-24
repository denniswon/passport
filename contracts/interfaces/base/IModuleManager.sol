// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Passport: A suite of contracts for Modular Smart Accounts compliant with ERC-7579 and ERC-4337

import { IModuleManagerEventsAndErrors } from "./IModuleManagerEventsAndErrors.sol";

/// @title Passport - IModuleManager
/// @notice Interface for managing modules within Smart Accounts, providing methods for installation and removal of modules.
/// @dev Extends the IModuleManagerEventsAndErrors interface to include event and error definitions.
/// Special thanks to Biconomy, Rhinestone, and Solady team for foundational contributions
interface IModuleManager is IModuleManagerEventsAndErrors {
    /// @notice Installs a Module of a specific type onto the smart account.
    /// @param moduleTypeId The identifier for the module type.
    /// @param module The address of the module to be installed.
    /// @param initData Initialization data for configuring the module upon installation.
    function installModule(uint256 moduleTypeId, address module, bytes calldata initData) external payable;

    /// @notice Uninstalls a Module of a specific type from the smart account.
    /// @param moduleTypeId The identifier for the module type being uninstalled.
    /// @param module The address of the module to uninstall.
    /// @param deInitData De-initialization data for configuring the module upon uninstallation.
    function uninstallModule(uint256 moduleTypeId, address module, bytes calldata deInitData) external payable;

    /// @notice Checks if a specific module is installed on the smart account.
    /// @param moduleTypeId The module type identifier to check.
    /// @param module The address of the module.
    /// @param additionalContext Additional information that may be required to verify the module's installation.
    /// @return installed True if the module is installed, false otherwise.
    function isModuleInstalled(uint256 moduleTypeId, address module, bytes calldata additionalContext) external view returns (bool installed);
}
