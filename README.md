# Apress Source Code

The repository 
[https://github.com/Apress/agile-ai-in-pharo](https://github.com/Apress/agile-ai-in-pharo)
accompanies [*Agile Artificial Intelligence in Pharo*](https://www.apress.com/9781484253830) by Alexandre Bergel (Apress, 2020). 

This fork 
[https://github.com/coentjo/agile-ai-in-pharo](https://github.com/coentjo/agile-ai-in-pharo) is a (start of a) port to use the scripts in GToolkit. 


[comment]: #cover
![Cover image](img/9781484253830.jpg)

First there was the book: 
The book provides a complete implementation of a number of complex algorithms. Download the files as a zip using the green button, or clone the repository to your machine using Git.

But if you haven't seen it yet look at this film: 
[https://tube.switch.ch/videos/v6uqRi7Lfm](https://tube.switch.ch/videos/v6uqRi7Lfm)

## How to load it in Pharo? (see below for Glamorous Toolkit)

The provided code was designed for [Pharo](http://pharo.org) and it works Pharo 8 and Pharo 9. Open a playground and execute the instructions:

```Smalltalk
Metacello new
    baseline: 'AgileArtificialIntelligence';
    repository: 'github://Apress/agile-ai-in-pharo/src';
    load.
```
or (for this git-fork)
```Smalltalk
Metacello new
    baseline: 'AgileArtificialIntelligence';
    repository: 'github://Apress/agile-ai-in-pharo/src';
    onConflictUseLoaded;
    load.
```

## How to load it in Glamorous Toolkit?

Download GT from [https://gtoolkit.com/](https://gtoolkit.com/) and open it.

![GT.git](img/GT.git.png)


In GT open the git component and 'clone' (via the '+') the git repository
[https://github.com/coentjo/agile-ai-in-pharo.git](https://github.com/coentjo/agile-ai-in-pharo.git)

Double click on the repo and then in the next window click 'Load'
on every package:


![Load from git](img/GT.git.load.png)

### You can (a) load the Lepiter files by executing:

```Smalltalk
LeDatabasesRegistry defaultLogicalDatabase properties
    addRegisteredDirectory: FileLocator imageDirectory/ 'pharo-local'/'iceberg'/'coentjo'/'agile-ai-in-pharo'/'lepiter'.
LeDatabasesRegistry default defaultLogicalDatabase reload.
```

### Or (b) Loading the Lepiter files manually

Open Lepiter

![lepiter](img/GT.lepiter.png)

then add new database

![lepiter.newDatabase](img/GT.lepiter.newDatabase.png)

if you cloned the git it's in a subdir of the GT-dir:

```
.../pharo-local/iceberg/https:/agile-ai-in-pharo/lepiter
```

and after that click on page 'Workshop AI':

![WorkshopAI](img/GT.lepiter.WorkshopAI.png)




## Content

The repository provides the complete implementation of:

- Neural network library
- Matrix library
- Genetic algorithm
- Zoomorphic creature
- NEAT neuroevolution algorithm
- Mario-like game

Furthermore, all the scripts and code snippets are provided in the `scripts` folder.

## Releases

Release v1.0 corresponds to the code in the published book, without corrections or updates.

## Contributions

See the file [Contributing.md](Contributing.md) for more information on how you can contribute to this repository.
