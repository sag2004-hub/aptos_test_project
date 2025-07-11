module myDev_addr::Sample8 {

    const E_NOTENOUGH: u64 = 0;

    const N2DR: u64 = 1;
    const APT: u64 = 2;
    const WETH: u64 = 3;

    const Pool1_n2dr: u64 = 312;
    const Pool1_usdt: u64 = 3201;
    const N2DR_name: vector<u8> = b"N2D Rewards";

    const Pool2_apt: u64 = 21500;
    const Pool2_usdt: u64 = 124700;
    const APT_name: vector<u8> = b"APT";

    const Pool3_weth: u64 = 1310;
    const Pool3_usdt: u64 = 2750000;
    const WETH_name: vector<u8> = b"WETH";

    fun get_supply(coin_symbol: u64): (u64, u64, vector<u8>) {
        if (coin_symbol == N2DR)
            return (Pool1_usdt, Pool1_n2dr, N2DR_name)
        else if (coin_symbol == APT)
            return (Pool2_usdt, Pool2_apt, APT_name)
        else
            return (Pool3_usdt, Pool3_weth, WETH_name)
    }

    fun token_price(coin1: u64, coin2: u64): u64 {
        assert!(coin1 > 0, E_NOTENOUGH);
        assert!(coin2 > 0, E_NOTENOUGH);
        return coin1 / coin2
    }


    // This applies a 5% fee to each swap tx.
    fun calculate_swap(coin1: u64, coin2: u64, coin1_amt: u64): u64 {
        assert!(coin1_amt > 0, E_NOTENOUGH);
        let fee = coin1_amt * 5 / 1000;
        let mix_supply: u64 = coin1 * coin2;
        let new_usdt = coin1 + coin1_amt;
        let new_n2dr = mix_supply / (new_usdt - fee);
        let receive = coin2 - new_n2dr;
        return receive
    }

    #[test_only]
    use std::debug::print;

    #[test_only]
    use std::string::{utf8};

    #[test]
    fun test_function() {
        let (coin1, coin2, name) = get_supply(APT);
        let swap_amount = 2340; // USDT to swap.
        print(&utf8(b"Swap USDT for:"));
        print(&utf8(name));

        print(&utf8(b"Token Price Before Swap"));
        let price_before = token_price(coin1, coin2);
        print(&price_before);

        let result = calculate_swap(coin1, coin2, swap_amount);
        print(&result);

        print(&utf8(b"Token Price After Swap"));
        let coin1_after = coin1 + swap_amount;
        let coin2_after = coin2 - result;
        let price_after = token_price(coin1_after, coin2_after);
        print(&price_after);
    }


/*
Liquidity Pool

Coin1 = 3201 USDT
Coin2 = 312 N2DR

495 USDT -> N2DR 

FORMULA with 5% fee

Value1 = Apply a 5% fee to the USDT amount to be swapped.
         Fee: 495 * 5 / 1000 = 2

Value2 = Multiply both USDT and N2DR Supply.
         MixSup: Coin1 * Coin2 = 998,712

Value3 = Determine the new supply of USDT after the swap.
         NewUSDT: Coin1 + 495 = 3,696

Value4 = Determine the new supply of N2DR after the swap.
         NewN2DR: MixSup / (NewUSDT - fee) = 270

Value5 = Determine the amount of N2DRs to transfer to user.
         Transfer = Coin2 - NewN2DR = 42

*/

}