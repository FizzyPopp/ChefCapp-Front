# chef_capp

Welcome! This is the Dart/Flutter repo for Chef Capp.

## Architecture

### Structure

- *Services* handle communication to and from persistent storage. *Services* live in lib/services.
- *Models* package data that is coming from or going to persistent storage. *Models* live in lib/models.
- *Widgets* are UI components. *Widgets* mostly live in lib/screens, with some helpers in lib/utilities and lib/widgets.
- *Controllers* live in lib/controllers. *Controllers*:
    - decide which *widgets* to display so the user has something to do
    - ask *services* for the *models* that a *widget* needs
    - update *models* as the user interacts with *widgets*
    - notify *widgets* as *models* change  
    - ask *services* to save *models* at just the right time
  
### Rules

- *Services* create models, and/or report on the success of an operation
- *Services* decide what *models* are cached, and persistently stored, where
- Each *model* is able to parse a representation of itself from persistent storage
- Each *model* is json serializable
- *Controllers* may create their own data structures to house models
- *Controllers* handle all navigation
- *Widgets* get all their state, directly or indirectly, from a *controller*


