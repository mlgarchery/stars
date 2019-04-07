
## Stars
_Gigantic 2D spatial exploration game_


**File organization**:

- ext_pack/
    - contains extern packages files  (.lua files)
- pack/
    - contains our package/classes
- picture/ 
    - contains the graphics ressources
- sound/
    - contains the audio ressources
- test/
    - contains the tests we write on our codebase to be sure it is at least a minimum stable

- main.lua


### External package use:

\* We use the lua package **hump** designed to handle some common operation for us.

Fist of all, it implement some simple OO syntactic sugar:
 https://hump.readthedocs.io/en/latest/class.html .
 
Second of all, it implements camera:
https://hump.readthedocs.io/en/latest/camera.html

We'll also use it for the gamestate storage.


\* **lust** package for simple unit testing

\* **suit** for a simple UI for the menu.