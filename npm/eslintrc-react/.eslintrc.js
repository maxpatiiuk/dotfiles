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
  plugins: ['react'],
  extends: [
    'plugin:react/recommended',
    'plugin:react-hooks/recommended',
    '@maxxxxxdlp/eslint-config',
  ],
  rules: {
    'react/prop-types': OFF,
    'react/display-name': WARN,
    'react/button-has-type': ERROR,
    'react/no-access-state-in-setstate': ERROR,
    'react/no-danger': ERROR,
    'react/no-this-in-sfc': ERROR,
    'react/no-unstable-nested-components': ERROR,
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
    'react/boolean-prop-naming': ERROR,
    'react/function-component-definition': ERROR,
    'react/hook-use-state': ERROR,
    'react/iframe-missing-sandbox': ERROR,
    'react/no-adjacent-inline-elements': ERROR,
    'react/no-invalid-html-attribute': ERROR,
    'react/jsx-boolean-value': ERROR,
    'react/jsx-child-element-spacing': ERROR,
    'react/jsx-curly-brace-presence': [ERROR,{propElementValues:'always'}],
    'react/jsx-fragments': ERROR,
    'react/jsx-no-constructed-context-values': ERROR,
    'react/jsx-no-leaked-render': ERROR,
    'react/jsx-no-literals': ERROR,
    'react/jsx-sort-props': [ERROR,{
      ignoreCase: true,
      callbacksLast: true,

    }],
    'react/jsx-uses-vars': ERROR,
    'react/react/jsx-uses-react': ERROR,
  },
  settings: {
    react: {
      version: 'detect',
    },
  },
};

