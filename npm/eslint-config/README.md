# ESLint Configuration

A 'best practices' configuration for ESLint with support for TypeScript and
Prettier.

> NOTE: This config does not provide React rules. There is a
> [separate configuration](https://www.npmjs.com/package/@maxpatiiuk/eslint-config-react)
> that complements this one with React-specific rules

## Usage

Install dependencies:

```sh
npm install --save-dev @maxpatiiuk/eslint-config globals
```

Then, create `eslint.config.js` at the root directory of your project:

```js
import eslintConfig from '@maxpatiiuk/eslint-config';
import globals from 'globals';

export default [
  ...eslintConfig,
  {
    ignores: ['**/dist/**'],
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
