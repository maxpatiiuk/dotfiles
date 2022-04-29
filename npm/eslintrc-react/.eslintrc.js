'use strict';

const OFF = 'off';
const WARN = 'warn';
const ERROR = 'error';

module.exports = {
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2021,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
      impliedStrict: true,
    },
  },
  env: { es6: true },
  reportUnusedDisableDirectives: true,
  extends: [
    'plugin:react/recommended',
    'plugin:react-hooks/recommended',
    'plugin:@maxxxxxdlp/eslint-config',
    'next',
  ],
  rules: {
    'react/prop-types': OFF,
    'react/display-name': WARN,
    'react/button-has-type': ERROR,
    'react/no-access-state-in-setstate': ERROR,
    'react/no-danger': ERROR,
    'react/no-this-in-sfc': ERROR,
    'react/no-unstable-nested-components': ERROR,
    'react/no-unused-prop-types': ERROR,
    'react/prefer-read-only-props': ERROR,
    'react/self-closing-comp': ERROR,
    'react/style-prop-object': ERROR,
    'react/void-dom-elements-no-children': ERROR,
    'react/jsx-filename-extension': [
      ERROR,
      {
        extensions: ['tsx'],
      },
    ],
    'react/jsx-handler-names': ERROR,
    'react/jsx-no-useless-fragment': [
      ERROR,
      {
        allowExpressions: true,
      },
    ],
    'react/jsx-pascal-case': ERROR,
    // Next.js does not require having React in scope
    'react/react-in-jsx-scope': OFF,

    'react-hooks/exhaustive-deps': ERROR,
  },
  settings: {
    react: {
      version: 'detect',
    },
  },
};

