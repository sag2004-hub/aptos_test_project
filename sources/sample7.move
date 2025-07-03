address myDev_addr {

    module PriceOracle {

        public fun btc_price(): u128 {
            return 54200
        }

    }


    module CastingDemo {
        use myDev_addr::PriceOracle;
        use std::debug::print;

        fun calculate_swap() {
            let price = PriceOracle::btc_price();
            let price_w_fee: u128 = price + 5;
            let price_u128 = (price_w_fee as u128);
            let cast_math = (((price_u128 as u64) + (price_w_fee as u64)) as u128);
            print(&cast_math);
        }

        #[test]
        fun test_function(){
            calculate_swap();
        }
    }
}