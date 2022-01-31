# Namepet

Namepet or `pet` is a small personal database for naming things
like keys, hashes, and other hard-to-memorize strings.

Namepet is *not* a global registry, it is a *petname* system.
Think of it like the contact list on your phone, not a public phone book.

Like sharing phone contacts, a peer can show their own petnames for the info they share,
and the software will help you track these 'petname chains' in a sensible way.

These "contact cards' are called *namecards* and can be shared in a plain-text format.

## Install

`npm i -g namepet`

The first time you run `pet` it will confirm a data directory (`~/.namepet`)
and prompt you for a name and password to self-name and encrypt a fresh keypair.

## Example

```
> pet get eth2

0x00000000219ab540356cBB839Cbe05303d7705Fa :
    'eth2' ~ .
    'ETH2 Deposit Contract' ~ 'Vitalik Buterin' : ?
        'vitalik' ~ .
        'Vitalik Buterin' ~ LetsVerifyInc : ?
            'letsverify' ~ .
    'Eth2 Deposit Contract' ~ LetsVerifyInc : ?
       'letsverify' ~ .
       
> pet -x get eth2

==v NAMECARD v==
0x00000000219ab540356cBB839Cbe05303d7705Fa :
    'eth2' ~ 'mr name' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
        ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
    'ETH2 Deposit Contract' ~ 'Vitalik Buterin' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
        ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
        'vitalik' ~ 'mr name' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
            ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
        'Vitalik Buterin' ~ 'LetsVerifyInc' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
            ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
            'letsverify' ~ 'mr name' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
                ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
    'Eth2 Deposit Contract' ~ 'LetsVerifyInc' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
        ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
        'letsverify' ~ 'mr name' (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a) :
            ? (5bb35e9587213483efd172615277eb8ab97c8ba9ec8f6a05b78aa193d79a2a99c8059a3609a89a8ec8afe43c7a8b3b98d6fb5936e4d5c9fa6416fb7f5fb3254a)
==^ NAMECARD ^==
```

## Manual

```
pet: the namepet petname system
version: 0.0.1
install: npm i -g namepet@0.0.1
commands:
  pet set <key> <val>  # set [key,val]             (according to yourself)
  pet get <key>        # get [key,val]             (according to yourself)
  pet inv <val>        # get all [key,val] by val  (according to yourself)
  pet ask <key>        # get all [key,val] by key  (according to anyone)
  pet all <val>        # get all [key,val] by val  (according to anyone)
  pet pubkey           # show 'yourself' pubkey
  pet revoke           # revoke 'yourself' keypair
  pet audit            # check for revoked / ambiguous petnames
  pet adopt            # read namecard, then give own petnames
options:
  -d [~/.namepet]         override data dir
  -k [DIR/yourself.json]  override 'yourself' key
  -x                      export hex data (make output work with `pet adopt`)
  -l [en]                 plain-language namecard
cheatsheet:
  :       (which) is petnamed
  ~       according to
  .       yourself
  ?       a self signed key
  !       not petnamed
  \n\t    nesting 'and also'
  ()      optionally show hex data+sig, for import/export
```


## Advanced Manual

```
namecard AST:
    (whichis s1 s2 s3 ...)
    (accordingto petname nameorkey ?attest)
    (selfsigned)
    (yourself)
    (notpetnamed)
    (name str)
    (key hex)
    (attest nameorkey petname sig)

~/.namepet/
    yourself.json
    petnames.sqlite

schema:
    the Signed Petnamed Data (Signed Petnamed Pubkey)
    
==  [from:pubkey, data:blob255, petname:blob255, sig:sig]
        where from == scry(hash(name, data), sig)
	
==  CREATE TABLE petnames (
        from varchar(255) // pubkey
        data varchar(255) // string (incl pubkeys)
        name varchar(255) // string
        sig  varchar(255) // signature  
    )
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

```
the common law is spirit's refuge against the registry
```
