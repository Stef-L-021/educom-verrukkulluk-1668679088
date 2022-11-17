<img src="./assets/img/logo-v2.png" alt="Logo">

# Verrukkuluk 
Gegeven is een recepten website die door een grote supermarktketen als extra service- en verkoopkanaal wordt ingezet. Alle artikelen die in de recepten gebruikt worden, zijn in de filialen van de supermarkt te verkrijgen.

> lees de opdracht beschrijving op https://e-learning.educom.nu/cases/verrukkulluk/intro

## Opdracht
Vervaardig een gegevensmodel op basis van bovenstaande informatie en scherm-mockups in twee fases: 
1. Fase 1: De back-end
2. Fase 2: De front-end

> Hanteer de planning in je project-overzicht

## Fase 1 - De Back-end
In deze fase programeer je alles wat met het ophalen van de gerechten te maken
heeft, ook het maken en het bijwerken van de boodschappenlijst en de favorieten ga je nu vervaardigen.


## Fase 2 - De front-end

De startup-code van **Fase 2** vind je in de <a href='./fase-2/'>Fase 2 directory</a>
Kopieer de `index.php` naar de root van je project en pas hem aan zodat je eigen classes aangeroepen worden.

Aangezien er in de moderne tijd nog zelden zonder framework gewerkt wordt - 
zowel voor frontend development of backend ontwikkeling - gaan we in deze case 
ook alvast aan de slag met een zogenaamde [template engine](https://en.wikipedia.org/wiki/Template_processor). 
Dit is een stukje code dat ontwikkeld is om het leven van een developer wat 
aangenamer te maken. 

Open je command line interface. in windows start je deze door: 

`Start -> Uivoeren -> cmd`

Mogelijk dat je je zogenaamde [PATH moet instellen](https://www.computerhope.com/issues/ch000549.htm).
We gaan hier nu niet uitleggen wat dat precies betekent, 
in dit geval is [Google](https://www.google.com/search?ei=mKaiXovxO8eykwXxjJDYDQ&q=what+is+the+path+in+dos+or+windows+10&oq=what+is+the+PATH+in+dos+or+windo&gs_lcp=CgZwc3ktYWIQAxgBMggIIRAWEB0QHjIICCEQFhAdEB4yCAghEBYQHRAeMggIIRAWEB0QHjIICCEQFhAdEB4yCAghEBYQHRAeMggIIRAWEB0QHjoECAAQRzoECAAQQzoCCAA6BQgAEJECOgYIABAWEB5QwBZYq2JgoWtoA3AGeACAAWeIAZMSkgEEMzQuMZgBAKABAaoBB2d3cy13aXo&sclient=psy-ab) your friend.

### Twig
De template engine die we nu gaan gebruiken is [twig](https://twig.symfony.com). 
Deze gaan we in het Symfony  project (Symfony) ook inzetten.
Er zijn nog wel een aantal, zoals bijvoorbeeld [Smarty](https://www.smarty.net/) 
maar die werkt in grote lijnen hetzelfde.  

Je kunt twig nu via composer toevoegen aan de je project. 
Open hier toe een command prompt en type de volgende commando's:

### Windows
```shell
cd \directory\van\project [ENTER\
```

### Mac / Linux
```shell
cd directory/van/project [ENTER]
```

**NB:** `directory/van/project` moet je uiteraard vervangen door de **ECHTE** naam(en) van
de directory's van je project...

Installeer nu vanuit deze directory (de "root" van je project) twig met composer: 

```shell
composer require twig/twig
```

Eventueel:
```shell
php composer require twig/twig
```

### Project
Dit "skeleton" project is een eenvoudige instructie hoe je met twig kunt werken. 
Kijk voor meer informatie en uitgebreide documentatie op de [twig site](https://twig.symfony.com)
