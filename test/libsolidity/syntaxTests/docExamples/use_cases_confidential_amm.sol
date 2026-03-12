// Doc example: Confidential DeFi (AMM) from use-cases.md
// Note: The docs show `public returns (suint256 amountOut)` but shielded types
// cannot be returned from public functions. Changed to `internal` to compile.
contract ConfidentialAMM {
    address token0;
    suint256 reserve0;
    suint256 reserve1;
    mapping(address => suint256) liquidity;

    function swap(address tokenIn, suint256 amountIn) internal returns (suint256 amountOut) {
        if (tokenIn == token0) {
            amountOut = (amountIn * reserve1) / (reserve0 + amountIn);
            reserve0 += amountIn;
            reserve1 -= amountOut;
        } else {
            amountOut = (amountIn * reserve0) / (reserve1 + amountIn);
            reserve1 += amountIn;
            reserve0 -= amountOut;
        }
    }
}
// ====
// EVMVersion: >=mercury
// ----
// Warning 10301: (507-526): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (531-550): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 4281: (506-551): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
// Warning 10301: (664-683): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (688-707): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 4281: (663-708): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
