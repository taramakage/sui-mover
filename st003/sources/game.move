module st003::game {

    use std::string::{Self, String};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use oracle::weather::{WeatherOracle};

    const STONE: vector<u8> = b"stone";
    const PAPER: vector<u8> = b"paper";
    const SCISSORS: vector<u8> = b"scissors";

    // Fist represents a fist in the game, and they are shared objects.
    // - Stone: {name: "stone", id: xxx, remainder: 0}
    // - Paper: {name: "paper", id: xxx, remainder: 1}
    // - Scissors: {name: "scissors", id: xxx, remainder: 2}
    struct Fist has key {
        id: UID,
        name: String,
        remainder: u32,
    }    

    // Record stores a game result
    struct Record has key {
        id: UID,
        player: String,
        opponent: String,
        result: String,
    }

    // Create three shared objects
    fun init(ctx: &mut TxContext) {
        transfer::share_object(Fist {
            name: string::utf8(STONE),
            id: object::new(ctx),
            remainder: 0,
        });

        transfer::share_object(Fist {
            name: string::utf8(PAPER), 
            id: object::new(ctx),
            remainder: 1,
        });

        transfer::share_object(Fist {
            name: string::utf8(SCISSORS),
            id: object::new(ctx),
            remainder: 2,
        });
    }

    // Entrypoints

    public entry fun make_fist(
        fist: &Fist,
        oracle: &WeatherOracle,
        ctx: &mut TxContext
    ){
        let remainder = random(oracle) % 3;
        let result = string::utf8(b"win");
        let opponent = STONE;

        if (fist.remainder == remainder) {
            result = string::utf8(b"tie")
        } else if ((fist.remainder + 1) % 3 == remainder) {
            result = string::utf8(b"lose")
        };

        if (remainder == 1) {
            opponent = PAPER
        } else if (remainder == 2) {
            opponent = SCISSORS
        };

        transfer::transfer(Record{
            id: object::new(ctx),
            player: fist.name,
            opponent: string::utf8(opponent),
            result: result,
        }, tx_context::sender(ctx))
    }

    // random get a random number by weather oracle temp
    // - ref: https://github.com/MystenLabs/apps/tree/gd/weather-oracle/weather-oracle
    // - oracle id: 0x1aedcca0b67b891c64ca113fce87f89835236b4c77294ba7e2db534ad49a58dc 
    // - geoname id: 1853909 (Osaka, Japan)
    fun random(oracle: &WeatherOracle): u32 {
        let geoname_id = 1853909;
        oracle::weather::city_weather_oracle_temp(oracle, geoname_id)
    }
}
