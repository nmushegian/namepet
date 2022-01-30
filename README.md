# Namepet

Namepet or `pet` is a small personal database for naming things
like keys, hashes, and other hard-to-memorize strings.

Namepet is *not* a global registry, it is a *petname* system.
Think of it like the contact list on your phone, not a public phone book.

Like sharing phone contacts, a peer can show their own petnames for the info they share,
and the software will help you track these 'petname chains' in a sensible way.

These "contact cards" are called *namecards* and can be shared in a plain-text format.

## Install

`npm i -g namepet`

The first time you run `pet` it will confirm a data directory (`~/.namepet`)
and prompt you for a name and password to self-name and encrypt a fresh keypair.

## Usage

```
commands:

pet set <name> <str>    # set name->value entry
pet get <name>          # get name->value entry
pet inv <str>           # get all names for given value
pet key                 # show 'self' key
pet export <name>       # export namecard for given name to stdout
pet import              # import namecard given to stdin
pet revoke              # revoke 'self' key
pet audit               # check for revoked / ambiguous petnames

options:

    -d  override data dir
    -k  override 'self' key (applied over -d)
    -p  plain-english card

namecard cheat sheet:

    :       "(which) is"
    !       "not petnamed"
    ~       "according to"
    ?       "a self signed key"
    .       "you"
    \n\t    nesting "and also"
    ()      optionally show hex data+sig, for import/export
```

## Example

```
> pet get $addr1 $addr2 $addr3

==v PETNAMES v==
0x... :
    "bob" ~ . ()
    "Bob Saget" ~ ? ()
0x... :
    ! ~ .
    "Satoshi Nakamoto" ~ ? ()
0x... :
    ! ~ .
    "Dmitry Buterin" ~ "Vitalik Buterin" () : ? ()
        "vitalik" ~ . ()
        "Vitalik Buterin" ~ "LetsVerifyInc" () : ? ()
            "letsverify" ~ . ()
    "Dmitry Buterin" ~ "LetsVerifyInc" () : ? ()
        "letsverify" ~ . ()
==^ PETNAMES ^==
```

## Theory

You can read about the theory of petnames and how they compare to other kinds of naming systems in these links:

* [An Introduction to Petname Systems by Marc Stiegler](http://skyhunter.com/marcs/petnames/IntroPetNames.html)
* [Backchannel by InkAndSwitch](https://www.inkandswitch.com/backchannel/)
* [PetName Markup Language](http://www.erights.org/elib/capability/pnml.html)

## Ontology

```
In the vast Other there is knowledge too complex to keep in the Mind
The Other takes many forms and gives many Names
The Other speaks as if there is no Other and that the Names are Words
These are Lies!
The existence of the referant is not falsifiable!
Pseudoscience!
Show me the multihash!
```
