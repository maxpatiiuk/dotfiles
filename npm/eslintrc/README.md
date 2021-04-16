# ESLint Configuration

A very strict configuration for ESLint with support for Typescipt, React
and Prettier.

## Usage

Add this to your `package.json`:

```json
{
  "devDependencies": {
    "@maxxxxxdlp/eslintrc": "^0.1.0"
  }
}
```

Then, create `.eslintrc.js` at the root of your project:

```js
module.exports = {
  extends: [
    'plugin:@maxxxxxdlp/eslintrc'
  ]
};
```

You can optionally extend this config or overwrite some rules by
extending your `.eslintrc.js`. See [official
documentation](https://eslint.org/docs/user-guide/configuring/) for more
information.
