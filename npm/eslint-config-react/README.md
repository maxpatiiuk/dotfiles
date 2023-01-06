# ESLint-React Configuration

A very strict configuration for ESLint with support for TypeScript, React and
Prettier.

This config is based on
[@maxxxxxdlp/eslint-config](https://www.npmjs.com/package/@maxxxxxdlp/eslint-config).

## Usage

Add this to your `package.json`:

```json
{
  "devDependencies": {
    "@maxxxxxdlp/eslintrc-react": "^0.1.8",
    "@rushstack/eslint-patch": "^1.1.0"
  }
}
```

Then, create `.eslintrc.js` at the root directory of your project:

```js
require('@rushstack/eslint-patch/modern-module-resolution');

module.exports = {
  extends: [ '@maxxxxxdlp/eslint-config-react' ],
};
```

You can optionally extend this config or overwrite some rules by extending your
`.eslintrc.js`. See
[official documentation](https://eslint.org/docs/user-guide/configuring/) for
more information.
