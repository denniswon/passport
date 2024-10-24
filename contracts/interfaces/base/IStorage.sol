// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Passport: A suite of contracts for Modular Smart Accounts compliant with ERC-7579 and ERC-4337

import { SentinelListLib } from "sentinellist/SentinelList.sol";

import { IHook } from "../modules/IHook.sol";
import { CallType } from "../../lib/ModeLib.sol";

/// @title Passport - IStorage Interface
/// @notice Provides structured storage for Modular Smart Account under the Passport suite, compliant with ERC-7579 and ERC-4337.
/// @dev Manages structured storage using SentinelListLib for validators and executors, and a mapping for fallback handlers.
/// This interface utilizes ERC-7201 storage location practices to ensure isolated and collision-resistant storage spaces within smart contracts.
/// It is designed to support dynamic execution and modular management strategies essential for advanced smart account architectures.
/// @custom:storage-location erc7201:magic.storage.Passport
/// Special thanks to Biconomy, Rhinestone, and Solady team for foundational contributions
interface IStorage {
    /// @notice Struct storing validators and executors using Sentinel lists, and fallback handlers via mapping.
    struct AccountStorage {
        SentinelListLib.SentinelList validators;
        ///< List of validators, initialized upon contract deployment.
        SentinelListLib.SentinelList executors;
        ///< List of executors, similarly initialized.
        mapping(bytes4 => FallbackHandler) fallbacks;
        ///< Mapping of selectors to their respective fallback handlers.
        IHook hook;
        ///< Current hook module associated with this account.
        mapping(address hook => uint256) emergencyUninstallTimelock;
    }
    ///< Mapping of hooks to requested timelocks.

    /// @notice Defines a fallback handler with an associated handler address and a call type.
    struct FallbackHandler {
        address handler;
        ///< The address of the fallback function handler.
        CallType calltype;
    }
    ///< The type of call this handler supports (e.g., static or call).
}
