# Prettier Configuration

A mostly-default prettier configuration with additional plugins for formatting
`package.json`, `.xml`, shell files and Firebase Realtime Database Rules

## Usage

Add this to your `package.json`:

```json
{
  "prettier": "@maxpatiiuk/prettier-config"
}
```

Alternatively, if you want to overwrite some options, you can add this
repository as a devDependency:

```json
{
  "devDependencies": {
    "@maxpatiiuk/prettier-config": "^2.0.0"
  }
}
```

Then, create a `prettier.config.js` file at the root of your project:

```js
import prettierConfig from '@maxpatiiuk/prettier-config';

/**
 * @see https://prettier.io/docs/en/configuration.html
 * @type {import("prettier").Config}
 */
const config = {
  ...prettierConfig,
  // your overwrites go here
};

export default config;
```

OR, simply add this to your `package.json`:

```json
  "prettier": "@maxpatiiuk/prettier-config"
```

[More information about reusing and extending configs](https://prettier.io/docs/en/configuration.html)
