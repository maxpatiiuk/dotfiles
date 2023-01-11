# ESLint Configuration

A very strict configuration for ESLint with support for TypeScript and
Prettier.

> NOTE:
> This config does not provide React rules. There is a [separate
configuration](../eslint-config-react) that is a superset of this one, with
> React rules added.

## Usage

Add this to your `package.json`:

```json
{
  "devDependencies": {
    "@maxxxxxdlp/eslintrc": "^0.1.8",
    "@rushstack/eslint-patch": "^1.1.0"
  }
}
```

Then, create `.eslintrc.js` at the root of your project:

```js
require('@rushstack/eslint-patch/modern-module-resolution');

module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  parserOptions: {
    // Your TSConfig file
    project: './tsconfig.json',
  },
  env: {
    browser: true,
    node: true,
  },
  extends: ['@maxxxxxdlp/eslint-config'],
  rules: {
    // Manual overrides
  },
};

```

You can optionally extend this config or overwrite some rules by extending your
`.eslintrc.js`. See
[official documentation](https://eslint.org/docs/user-guide/configuring/) for
more information.
