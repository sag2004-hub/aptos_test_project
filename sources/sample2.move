module myDev_addr::sample2{
    use std::debug::print;
    const MY_ADDR: address=@myDev_addr;
    fun confirm_value(number: u64): bool{
        if(number>0)
        return true
        else
        return false
    }
    #[test]
    fun test_function(){
        let result=confirm_value(12);
        //print(&result);
    }
}