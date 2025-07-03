address myDev_addr{
    module one{
        friend myDev_addr::two;
        friend myDev_addr::three;
        public(friend) fun get_value(): u64{
            return 100
        }
    }
    module two{
        #[test_only]
        use std::debug::print;
        use myDev_addr::one::get_value;
        #[test]
        fun test_function(){
            let result = get_value();
            print(&result);
        }
    }
    module three{
        #[test_only]
        use std::debug::print;
        use myDev_addr::one::get_value;
        #[test]
        fun test_function(){
            let result = get_value();
            print(&result);
        }
    }
}