# Stylelint Configuration

A very strict configuration for Stylelint with support for CSS-in-JS and
Prettier.

## Usage

Add this to your `package.json`:

```json
{
  "devDependencies": {
    "@maxpatiiuk/stylelintrc": "^0.1.0"
  }
}
```

Then, create `.stylelintrc.js` at the root of your project:

```js
module.exports = {
  extends: ['@maxpatiiuk/stylelintrc'],
  rules: {},
};
```

You can optionally extend this config or overwrite some rules by extending your
`.stylelintrc.js`. See
[official documentation](https://stylelint.io/user-guide/configure) for more
information.
