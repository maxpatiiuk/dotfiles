# ESLint Configuration

A very strict configuration for ESLint with support for TypeScript and
Prettier.

> NOTE:
> This config does not provide React rules. There is a [separate
configuration](https://www.npmjs.com/package/@maxxxxxdlp/eslint-react-config)
> that complements this one with React-specific rules

## Usage

Install dependencies:

```sh
npm install --save-dev @maxxxxxdlp/eslintrc globals
```

Then, create `eslint.config.js` at the root directory of your project:

```js
import eslintConfig from '@maxxxxxdlp/eslint-config';
import globals from 'globals';

export default [
  ...eslintConfig,
  {
    languageOptions: {
      parserOptions: {
        project: './tsconfig.json',
      },
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
    rules: {
      // Example of overriding the configuration:
      '@typescript-eslint/no-empty-interface': 'off',
    },
  },
];

```

The config is using
[Flat Config](https://eslint.org/docs/latest/user-guide/configuring/configuration-files-new)
style.