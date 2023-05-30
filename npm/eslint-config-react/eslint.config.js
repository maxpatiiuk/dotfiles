'use strict';

const react = require('eslint-plugin-react');
const reactHooks = require('eslint-plugin-react-hooks');
const accessibility = require('eslint-plugin-jsx-a11y');
const testingLibrary = require('eslint-plugin-testing-library');
const { FlatCompat } = require('@eslint/eslintrc');

const OFF = 'off';
const WARN = 'warn';
const ERROR = 'error';

const compat = new FlatCompat();

module.exports = [
  ...compat.config(react.configs.recommended),
  ...compat.config(reactHooks.configs.recommended),
  ...compat.config(accessibility.configs.strict),
  ...compat.config(testingLibrary.configs.react),
  {
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
      /*
       * Seemed like a good idea at first, but now I am struggling to
       * find a reason for this rule to exist. IF you accidentally
       * forgot to unpack a useState, TypeScript will tell you.
       * Otherwise, I don't want this rule to fire when I intentionally
       * didn't unpack (because I want to easily pass on both getter
       * and setter to a child component)
       */
      'react/hook-use-state': OFF,
      'react/iframe-missing-sandbox': ERROR,
      'react/no-adjacent-inline-elements': ERROR,
      'react/no-invalid-html-attribute': ERROR,
      'react/jsx-boolean-value': ERROR,
      'react/jsx-child-element-spacing': ERROR,
      'react/jsx-curly-brace-presence': [
        ERROR,
        { propElementValues: 'always' },
      ],
      'react/jsx-fragments': ERROR,
      'react/jsx-no-constructed-context-values': ERROR,
      'react/jsx-no-leaked-render': OFF,
      'react/jsx-no-literals': ERROR,
      'react/jsx-sort-props': [
        WARN,
        {
          ignoreCase: true,
          callbacksLast: true,
        },
      ],
      'react/jsx-uses-vars': ERROR,
      'react/jsx-uses-react': ERROR,
      'react/no-object-type-as-default-prop': ERROR,

      /*
       * This is a super important rule. Not sure why it's not an ERROR
       * by default
       */
      'react-hooks/exhaustive-deps': ERROR,

      // Deprecated rule
      'jsx-a11y/no-onchange': OFF,
      'jsx-a11y/no-noninteractive-element-to-interactive-role': ERROR,
    },
    settings: {
      react: {
        version: 'detect',
      },
    },
  },
  {
    files: ['**/__tests__/**/*.[jt]s?(x)', '**/?(*.)+(spec|test).[tj]s?(x)'],
    rules: {
      'testing-library/no-await-sync-events': ERROR,
      'testing-library/no-global-regexp-flag-in-query': WARN,
      'testing-library/no-manual-cleanup': ERROR,
      'testing-library/prefer-user-event': ERROR,
      'testing-library/prefer-wait-for': ERROR,
    },
  },
];
