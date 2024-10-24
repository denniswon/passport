// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Passport: A suite of contracts for Modular Smart Accounts compliant with ERC-7579 and ERC-4337

import { PackedUserOperation } from "account-abstraction/interfaces/PackedUserOperation.sol";

import { IModule } from "./IModule.sol";

/// Special thanks to Biconomy, Rhinestone, and Solady team for foundational contributions
interface IValidator is IModule {
    /// @notice Validates a user operation as per ERC-4337 standard requirements.
    /// @dev Should ensure that the signature and nonce are verified correctly before the transaction is allowed to proceed.
    /// The function returns a status code indicating validation success or failure.
    /// @param userOp The user operation containing transaction details to be validated.
    /// @param userOpHash The hash of the user operation data, used for verifying the signature.
    /// @return status The result of the validation process, typically indicating success or the type of failure.
    function validateUserOp(PackedUserOperation calldata userOp, bytes32 userOpHash) external returns (uint256);

    /// @notice Verifies a signature against a hash, using the sender's address as a contextual check.
    /// @dev Used to confirm the validity of a signature against the specific conditions set by the sender.
    /// @param sender The address from which the operation was initiated, adding an additional layer of validation against the signature.
    /// @param hash The hash of the data signed.
    /// @param data The signature data to validate.
    /// @return magicValue A bytes4 value that corresponds to the ERC-1271 standard, indicating the validity of the signature.
    function isValidSignatureWithSender(address sender, bytes32 hash, bytes calldata data) external view returns (bytes4);
}
