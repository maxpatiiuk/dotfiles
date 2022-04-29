# ESLint-React Configuration

A very strict configuration for ESLint with support for TypeScript, React and
Prettier.

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
  extends: ['plugin:@maxxxxxdlp/eslintrc-react'],
};
```

You can optionally extend this config or overwrite some rules by extending your
`.eslintrc.js`. See
[official documentation](https://eslint.org/docs/user-guide/configuring/) for
more information.
