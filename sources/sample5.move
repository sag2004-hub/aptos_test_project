/*module myDev_addr::Sample5{
    const ADD: u64 =0;
    const SUB: u64 =1;
    const MUL: u64 =2;
    const DIV: u64 =3;
    const MOD: u64 =4;

    fun arthmetic_operator(a: u64,b:u64, operator:u64): u64{
        if(operator == ADD)
            return a+b
        else if(operator==SUB)
            return a-b
        else if(operator==MUL)
            return a*b
        else if(operator==DIV)
            return a/b
        else
            return a%b
    }
    #[test_only]
    use std::debug::print;

    #[test]
    fun test_arithmetic(){
        let result = arthmetic_operator(10,5,ADD);
        print(&result)
    }



}*/