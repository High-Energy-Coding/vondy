# Vondy

https://fontawesome.com/v4/icons/


## Setup Instructions

You can clone this repo with `git clone https://github.com/dillonkearns/elm-pages-starter.git`.

`npm install` from the cloned repo. Before running the dev server or build, make sure to install Lamdera (see below).

`npm start` starts the dev server with hot reloading.

`npm run build` builds the app for production.

### Install Lamdera

[Install Lamdera with these instructions](https://dashboard.lamdera.app/docs/download).

`elm-pages` 3.0 uses the lamdera compiler, which is a superset of the Elm compiler with some extra functionality to automatically serialize Elm types to Bytes.

### Debugging Lamdera Errors

Sometimes Lamdera will give compiler errors due to corrupted dependency cache. These messages will display a note at the bottom:

```
-- PROBLEM BUILDING DEPENDENCIES ---------------

...


Note: Sometimes `lamdera reset` can fix this problem by rebuilding caches, so
give that a try first.
```

Be sure to use `lamdera reset` to reset the caches for these cases. See more info about that in the Lamdera docs: https://dashboard.lamdera.app/docs/ides-and-tooling#problem-corrupt-caches
