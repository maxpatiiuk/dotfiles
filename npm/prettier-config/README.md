# Prettier Configuration

A mostly default prettier configuration with plugins for `package.json`,
Tailwind class names, `.xml` files and shell files

## Usage

Install this config as a dev dependency:

```bash
npm install -D @maxpatiiuk/prettier-config
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
