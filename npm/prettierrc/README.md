# Prettier Configuration

A mostly-default prettier configuration with additional plugins for formatting
`package.json`, `.xml`, shell files and Firebase Realtime Database Rules

## Usage

Add this to your `package.json`:

```json
{
  "prettier": "@maxxxxxdlp/prettier-config"
}
```

Alternatively, if you want to overwrite some options, you can add this
repository as a devDependency:

```json
{
  "devDependencies": {
    "@maxxxxxdlp/prettier-config": "^1.0.0"
  }
}
```

Then, create a `.prettierrc.js` file at the root of your project:

```js
module.exports = {
  ...require('@maxxxxxdlp/prettier-config'),
  // your overwrites go here
};
```

[More information about reusing and extending configs](https://prettier.io/docs/en/configuration.html)
