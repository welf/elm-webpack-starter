# Elm 0.18 with Webpack 3, Hot Loading & Bootstrap 4-beta

Elm dev environment with hot-loading (i.e. state is retained as you edit your code - Hot Module Reloading, HMR)). I use this daily for my professional work. Like elm-community/elm-webpack-starter but using Webpack 3.

## Installation

Clone this repo into a new project folder and run install script.
(I ignore the errors about missing jquery as it is best not to use the Bootstrap jquery-based components with Elm)

With yarn
```sh
$ git clone git@github.com:welf/elm-webpack-starter.git new-project
$ cd new-project
$ yarn
$ yarn dev
 ```

With npm

```sh
$ git clone git@github.com:welf/elm-webpack-starter.git new-project
$ cd new-project
$ npm install
$ npm run dev
```

If you get error running `npm run dev` or `yarn dev` make sure you are not running another server on the same port. Stop other server or edit `package.json` file and change `webpack-dev-server`'s port. Currently it is running on port `3000`:

```sh
{
  ...
  "scripts": {
    ...
    "dev": "webpack-dev-server --hot --port 3000",
    ...
  },
  ...
}

```

Open http://localhost:3000 and start modifying the code in /src.
(An example using Routing is provided in the `navigation` branch)

## Production

Build production assets with:

```sh
npm run prod
```

## Static assets

Just add to `src/assets/` and the production build copies them to `/dist`

## Testing

[Install elm-test globally](https://github.com/elm-community/elm-test#running-tests-locally)

`elm-test init` is run when you install your dependencies. After that all you need to do to run the tests is

```sh
yarn test
```

Take a look at the examples in `tests/`

If you add dependencies to your main app, then run `elm-test --add-dependencies`

<hr />

## ES6

If you need to write some Javascript port code, you need to be aware that `npm run prod` will fail as the uglifyjs plugin provided with Webpack 3 cannot handle ES6. There are a couple of ways forward

- add babel to transpile to es5 before passing to uglifyjs by modifying the common.module.rules to read:
```
{
   test: /\.js$/,
   exclude: /node_modules/,
   use: {
       loader: 'babel-loader',
       options: {
           presets: ['latest']
       }
   }
}
```
You will also need to npm install babel.

- Use uglifyjs2/3 (untested) - see https://www.npmjs.com/package/uglifyjs-webpack-plugin

## Credits

It is a fork of [simonh1000 repository](https://github.com/simonh1000/elm-webpack-starter) with updated npm dependencies, improved `src/styles.scss` file which follows linter recommendations and another Elm project template which suit better to my professional needs.

[simonh1000](https://github.com/simonh1000): A long time ago this code was forked from https://github.com/fluxxu/elm-hot-loader

## How it works

"webpack-dev-server --hot --inline --host=0.0.0.0 --port 3000",

--hot Enable webpack's Hot Module Replacement feature
--inline (default) a script will be inserted in your bundle to take care of live reloading, and build messages will appear in the browser console.
--host=0.0.0.0 ??
--port 3000 - use port 3000 instead of default 8000
