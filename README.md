
## Stars
_Gigantic 2D spatial exploration game_


**File organization**:

- ext_pack/
    - contains extern packages files  (.lua files)
- pack/
    - contains our package/classes
- scene.
    - contains the different "view" the player can control. For example:
        1. the menu
        2. the spatial exploration view (player can control the rocket moving into the space)
        3. the planet exploration view (the player can control the human moving on the surface of the planet)
- picture/ 
    - contains the graphics ressources
- sound/
    - contains the audio ressources
- test/
    - contains the tests we write on our codebase to be sure it is at least a minimum stable

- main.lua

### The two differents scenes (+ the menu)

**planet exploration mode**: the player is represented by a human moving on the surface of the planet (the circle). He can build factories or other buildings on the limited slots (faces of the polygon being the convex hull of the circle).

**spatial exploration mode**: the player is represented by a rocket moving in space and being able (if possible) to manoeuver in order to land on other planets, or satelize the rocket.

The player can control only one human (the human is wether manoeuvering the rocket or on a planet, exploring)

### External package use:

\* We use the lua package **hump** designed to handle some common operation for us.

Fist of all, it implement some simple OO syntactic sugar:
 https://hump.readthedocs.io/en/latest/class.html .
 
Second of all, it implements camera:
https://hump.readthedocs.io/en/latest/camera.html

We'll also use it for the gamestate storage.


\* **lust** package for simple unit testing

\* **suit** for a simple UI for the menu.