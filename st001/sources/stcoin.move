module st001::stcoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct STCOIN has drop {}

    fun init(witness: STCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 18, b"STCOIN", b"STC", b"Startrek Coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}
