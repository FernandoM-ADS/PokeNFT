// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PokeDio is ERC721{

    struct Pokemon{
        string name;
        uint level;
        string img;
    }

    Pokemon[] public pokemons;
    address public gameOwner;

    constructor () ERC721 ("PokeDio", "PKD"){

        gameOwner = msg.sender;


    }

    modifier onlyOwnerOf(uint _monsterID) {

        require(ownerOf(_monsterId) == msg.sender, "Apenas o dono pode batalhar com este Pokemon");
        _;
    }

    function battle(uint _attackPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon){
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

         if (attacker.level >= defender.level) {
             attacker.level += 2;
             defender.level +=1;
         }else{
             attacker.level += 1;
             defender.level +=2;
         }
    }

    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos Pokemons");
        uint id = pokemons.lenght;
        pokemons.push(pokemon(_name, 1,_img));
        _safemint(_to, id);
    }


}
