module myDev_addr::sample1{
    use std::debug::print;
    use std::string::{String,utf8};
    const ID: u64=100;
    fun set_value(): u64 {
        let value_id: u64=200;
        let string_val:String=utf8(b"sagnikdutta");
        let string_byte: vector<u8> = b"this is a byte string";
       // print(&value_id);
        //print(&string_val);
       // print(&utf8(string_byte));
        ID
    }
    #[test]
    fun test_fucntion(){
        let id_value=set_value();
       // print(&id_value);
    }
}