module st002::nft {

    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // MintCap: capability to mint token.
    struct MintCap has key {
        id: UID
    }

    struct Token has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct MintEvent has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(MintCap { 
            id: object::new(ctx) 
        }, tx_context::sender(ctx))
    }

    // Entrypoint
    public entry fun mint(
        _: &MintCap,
        recipeint: address,
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let token = Token {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(MintEvent {
            object_id: object::id(&token),
            creator: recipeint,
            name: token.name,
        });

        transfer::public_transfer(token, recipeint);
    }


    public entry fun transfer(
        token: Token, 
        recipient: address, 
        _: &mut TxContext
    ) {
        transfer::public_transfer(token, recipient)
    }

   public entry fun edit(
        token: &mut Token,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        token.description = string::utf8(new_description)
    }

    public entry fun burn(token: Token, _: &mut TxContext) {
        let Token { id, name: _, description: _, url: _ } = token;
        object::delete(id)
    }

    // Accessor

    public fun name(token: &Token): &string::String {
        &token.name
    }

    public fun description(token: &Token): &string::String {
        &token.description
    }

    public fun url(token: &Token): &Url {
        &token.url
    }
}
