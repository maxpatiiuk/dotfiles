# ESLint-React Configuration

A very strict ESLInt configuration for React.

Note, this config includes only React-specific rules. It's recommended to use
this config alongside
[@maxxxxxdlp/eslint-config](https://www.npmjs.com/package/@maxxxxxdlp/eslint-config).

## Usage

Install dependencies:

```sh
npm install --save-dev @maxxxxxdlp/eslint-config-react
```

Then, create `eslint.config.js` at the root directory of your project:

```js
import eslintConfigReact from '@maxxxxxdlp/eslint-config-react';

export default [
  ...eslintReactConfig,
  {
    // Your custom rules and overrides here
  },
];

```

The config is using
[Flat Config](https://eslint.org/docs/latest/user-guide/configuring/configuration-files-new)
style.