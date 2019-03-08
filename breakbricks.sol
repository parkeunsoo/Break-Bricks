pragma solidity ^0.4.0;

contract breakbrick{
    
    address public owner; //소유자
    string public name; // 토큰 이름
    string public symbol; // 토큰 단위
    uint8 public decimals; // 소수점 이하 자릿수
    uint256 public totalSupply; // 토큰 총량
    mapping (address => uint256) public balanceOf; // 각 주소의 잔고
    uint256 revenue;//수익금


    constructor(uint256 _supply, string _name, string _symbol, uint8 _decimals) public {
        balanceOf[msg.sender] = _supply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _supply;
        owner = msg.sender;
    }
    function() external payable{
    }
    function gamestart() public payable{
        revenue+=msg.value;
    }
    function transfer (address _to) public {
        // 부정 송금 확인
        if (balanceOf[owner] < 100) revert();
        // 송금하는 주소와 송금받는 주소의 잔고 갱신
        balanceOf[owner] -= 100;
        balanceOf[_to] += 100;
    }
    function  allrevenue() view public returns(uint256){
        return revenue;
    }
    function querybalance() view public returns(uint256){
        return balanceOf[msg.sender];
    }
}