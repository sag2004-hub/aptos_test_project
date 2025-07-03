module myDev_addr::Sample4{
    use std::debug::print;
    use std::string::{String, utf8};

    fun sample_for_loop(count: u64): u64 {
        let value = 0;
        for(i in 0..count){
            value = value + 1;
        };
        value
    }
    fun sample_while_loop(count: u64): u64{
        let value=0;
        let i: u64 =1;
        while(i <= count){
            value = value +1;
            i=i+1;
        };
        value
    }
    fun sample_loop(count: u64): u64 {
        let value=0;
        let i: u64 =1;
        loop{
            value =value +1;
            i=i+1;
            if(i>count)
                break;
        };
        value
    }
    fun sample_abort_error(value: String){
        if(value == utf8(b"myDev"))
            print(&utf8(b"correct!"))
        else
            abort 123
    }

    fun sample_assert_error(value: String){
        assert!(value == utf8(b"myDev"), 123)
    }

    #[test]
    fun test_for_loop(){
        let result=sample_for_loop(10);
        print(&result);
    }
    #[test]
    fun test_while_loop(){
        let result=sample_while_loop(10);
        print(&result);
    }
    #[test]
    fun test_loop(){
        let result=sample_loop(10);
        print(&result);
    }
    #[test]
    fun test_abort(){
        sample_abort_error(utf8(b"myDev"));
    }
    #[test]
    fun test_assert(){
        sample_assert_error(utf8(b"myDev"));
    }
}