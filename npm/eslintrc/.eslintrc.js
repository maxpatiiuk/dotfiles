'use strict';

const OFF = 0;
const WARN = 1;
const ERROR = 1;

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
  reportUnusedDisableDirectives: true,
  plugins: ['@typescript-eslint'],
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'plugin:unicorn/recommended',
    'prettier',
    'plugin:prettier/recommended',
  ],
  rules: {
    // Some rules are disabled as they conflict with `prettier`
    // They should be enabled if you don't use `prettier`

    'no-non-null-assertion': OFF,
    //'no-extra-parens': ERROR,
    'no-console': ERROR,
    'no-promise-executor-return': ERROR,
    'no-template-curly-in-string': ERROR,
    'no-unsafe-optional-chaining': ERROR,
    'no-useless-backreference': ERROR,
    'array-callback-return': ERROR,
    complexity: [WARN, { max: 10 }],
    'consistent-return': ERROR,
    'default-case': ERROR,
    'default-case-last': ERROR,
    //'default-param-last': ERROR,
    'guard-for-in': ERROR,
    'no-restricted-syntax': [
      ERROR,
      'WithStatement',
      'SwitchStatement',
      'SwitchCase',
      'ForInStatement',
    ],
    'no-alert': ERROR,
    'no-caller': ERROR,
    'no-constructor-return': ERROR,
    'no-empty-function': [
      ERROR,
      {
        allow: ['arrowFunctions'],
      },
    ],
    'no-eq-null': ERROR,
    'no-eval': ERROR,
    'no-extend-native': ERROR,
    'no-extra-bind': ERROR,
    //'no-floating-decimal': ERROR,
    'no-implicit-coercion': ERROR,
    'no-implied-eval': ERROR,
    'no-iterator': ERROR,
    'no-labels': ERROR,
    'no-lone-blocks': ERROR,
    //'no-multi-str': ERROR,
    //'no-multi-spaces': ERROR,
    'no-new': WARN,
    'no-new-func': ERROR,
    'no-new-wrappers': ERROR,
    'no-nonoctal-decimal-escape': ERROR,
    'no-octal-escape': ERROR,
    'no-param-reassign': ERROR,
    'no-proto': ERROR,
    'no-return-assign': WARN,
    'no-script-url': ERROR,
    'no-self-compare': ERROR,
    'no-sequences': ERROR,
    'no-useless-call': ERROR,
    'no-useless-concat': ERROR,
    'no-useless-return': ERROR,
    'no-warning-comments': [
      ERROR,
      {
        terms: ['fixme'],
        location: 'anywhere',
      },
    ],
    'prefer-named-capture-group': WARN,
    'prefer-promise-reject-errors': ERROR,
    'prefer-regex-literals': ERROR,
    //'wrap-iife': [
    //  ERROR,
    //  'inside'
    //],
    yoda: ERROR,
    'no-undefined': OFF,
    //'array-bracket-newline': [
    //  ERROR,
    //  'consistent',
    //],
    //'array-element-newline': [
    //  ERROR,
    //  'consistent',
    //],
    //'block-spacing': ERROR,
    //'brace-style': [
    //  ERROR,
    //  'stroustrup',
    //  {
    //    'allowSingleLine': false,
    //  }
    //],
    camelcase: OFF,
    'capitalized-comments': ERROR,
    //'comma-dangle': [
    //  ERROR,
    //  'always-multiline'
    //],
    //'comma-spacing': ERROR,
    //'comma-style': ERROR,
    'consistent-this': ERROR,
    //'eol-last': ERROR,
    //'func-call-spacing': ERROR,
    //'function-call-argument-newline': [
    //  ERROR,
    //  'consistent',
    //],
    //'function-paren-newline': [
    //  ERROR,
    //  'consistent',
    //],
    'id-length': [
      ERROR,
      {
        min: 3,
        exceptions: [
          '$', // jQuery
          'L', // Leaflet
          '_', // Underscore
          'R', // Ramda
          'el',
          'on',
          'no',
          'id',
        ],
      },
    ],
    //'id-match': [
    //  ERROR,
    //  '^($_)?[A-Za-z]*$',
    //    {
    //    'onlyDeclarations': false,
    //  },
    //],
    //'arrow-body-style': ERROR,
    //'implicit-arrow-linebreak': ERROR,
    //'indent': [
    //  WARN,
    //  2
    //],
    //'jsx-quotes': [
    //  ERROR,
    //  'prefer-single',
    //],
    //'key-spacing': ERROR,
    //'keyword-spacing': ERROR,
    //'linebreak-style': ERROR,
    //'lines-around-comment': ERROR,
    'max-depth': [
      ERROR,
      {
        max: 6,
      },
    ],
    //'max-len': [
    //  ERROR,
    //  {
    //    'code': 80,
    //    'tabWidth': 2,
    //    'ignoreUrls': true,
    //    'ignoreTemplateLiterals': true,
    //    'ignoreRegExpLiterals': true,
    //  },
    //],
    'max-lines': ERROR,
    'max-lines-per-function': [
      ERROR,
      {
        max: 100,
        skipBlankLines: true,
        skipComments: true,
      },
    ],
    'max-nested-callbacks': ERROR,
    'max-params': ERROR,
    'max-statements': [
      ERROR,
      {
        max: 20,
      },
    ],
    'max-statements-per-line': ERROR,
    'multiline-comment-style': ERROR,
    //'multiline-ternary': ERROR,
    'new-cap': ERROR,
    //'new-parens': ERROR,
    'no-bitwise': ERROR,
    'no-continue': ERROR,
    'no-inline-comments': ERROR,
    //'no-mixed-operators': ERROR,
    'no-multi-assign': ERROR,
    //'no-multiple-empty-lines': [
    //  ERROR,
    //  {
    //    'max': 2,
    //    'maxEOF': 1,
    //    'maxBOF': 0,
    //  },
    //],
    'no-negated-condition': ERROR,
    'no-new-object': ERROR,
    'no-plusplus': ERROR,
    //'no-tabs': ERROR,
    //'no-trailing-spaces': ERROR,
    'no-underscore-dangle': ERROR,
    'no-unneeded-ternary': ERROR,
    //'no-whitespace-before-property': ERROR,
    //'nonblock-statement-body-position': [
    //  ERROR,
    //  'below',
    //],
    //'object-curly-newline': [
    //  ERROR,
    //  {
    //    'multiline': true,
    //  },
    //],
    //'object-property-newline': ERROR,
    'one-var': [ERROR, 'never'],
    //'operator-linebreak': [
    //  ERROR,
    //  'after',
    //],
    'prefer-exponentiation-operator': ERROR,
    'prefer-object-spread': ERROR,
    //'quote-props': [
    //  ERROR,
    //  'consistent-as-needed',
    //],
    //'semi': ERROR,
    //'semi-spacing': [
    //  ERROR,
    //  {
    //    'before': false,
    //    'after': true,
    //  },
    //],
    //'semi-style': ERROR,
    //'space-before-blocks': [
    //  ERROR,
    //  {
    //    'functions': 'never',
    //    'keywords': 'always',
    //    'classes': 'always',
    //  },
    //],
    //'space-before-function-paren': [
    //  ERROR,
    //  'never',
    //],
    //'space-infix-ops': ERROR,
    //'space-unary-ops': [
    //  ERROR,
    //  {
    //    'words': true,
    //    'nonwords': false,
    //  },
    //],
    'spaced-comment': ERROR,
    //'template-tag-spacing': ERROR,
    //'wrap-regex': ERROR,
    //'arrow-parens': ERROR,
    //'arrow-spacing': [
    //  ERROR,
    //  {
    //    'before': true,
    //    'after': true,
    //  },
    //],
    //'generator-star-spacing': [
    //  ERROR,
    //  {
    //    'before': true,
    //    'after': false,
    //  },
    //],
    //'no-confusing-arrow': ERROR,
    'no-useless-computed-key': ERROR,
    'no-useless-rename': ERROR,
    'no-var': ERROR,
    'object-shorthand': ERROR,
    //'prefer-arrow-callback': ERROR,
    'prefer-const': ERROR,
    'prefer-numeric-literals': ERROR,
    'prefer-rest-params': ERROR,
    'prefer-spread': ERROR,
    'prefer-template': ERROR,
    //'rest-spread-spacing': ERROR,
    //'sort-imports': ERROR,
    'symbol-description': ERROR,
    //'template-curly-spacing': ERROR,
    //'yield-star-spacing': [
    //  ERROR,
    //  {
    //    'before': true,
    //    'after': false,
    //  },
    //],
    //'quotes': [
    //  ERROR,
    //  'single',
    //  {
    //    'avoidEscape': true,
    //    'allowTemplateLiterals': true,
    //  },
    //],

    '@typescript-eslint/ban-ts-comment': WARN,
    '@typescript-eslint/explicit-module-boundary-types': [
      ERROR,
      {
        allowArgumentsExplicitlyTypedAsAny: true,
        allowDirectConstAssertionInArrowFunctions: true,
      },
    ],
    '@typescript-eslint/array-type': [
      ERROR,
      {
        default: 'array',
      },
    ],
    '@typescript-eslint/ban-tslint-comment': ERROR,
    '@typescript-eslint/class-literal-property-style': [ERROR, 'fields'],
    '@typescript-eslint/consistent-indexed-object-style': [ERROR, 'record'],
    '@typescript-eslint/consistent-type-assertions': [
      ERROR,
      {
        assertionStyle: 'as',
        objectLiteralTypeAssertions: 'allow-as-parameter',
      },
    ],
    '@typescript-eslint/consistent-type-imports': ERROR,
    '@typescript-eslint/explicit-function-return-type': ERROR,
    '@typescript-eslint/explicit-member-accessibility': ERROR,
    //'@typescript-eslint/member-delimiter-style': [
    //  ERROR,
    //  {
    //    'singleline': {
    //      'requireLast': true,
    //  },
    //  },
    //],
    '@typescript-eslint/method-signature-style': ERROR,
    '@typescript-eslint/naming-convention': [
      ERROR,

      {
        // use strictCamelCase by default
        selector: 'default',
        format: ['strictCamelCase'],
        leadingUnderscore: 'forbid',
        trailingUnderscore: 'forbid',
      },

      {
        // function parameters can start with underscore if unused
        selector: 'parameter',
        format: ['strictCamelCase'],
        modifiers: ['unused'],
        leadingUnderscore: 'allow',
        trailingUnderscore: 'forbid',
      },

      {
        // constants can be in UPPER_CASE
        selector: 'variable',
        modifiers: ['const'],
        types: ['boolean', 'string', 'number', 'array'],
        format: ['strictCamelCase', 'UPPER_CASE'],
      },

      {
        // typeLike must be in StrictPascalCase
        selector: 'typeLike',
        format: ['StrictPascalCase'],
      },

      {
        // React Contexts must be in StrictPascalCase
        selector: 'variable',
        modifiers: ['const'],
        filter: {
          regex: 'Context$',
          match: true,
        },
        format: ['StrictPascalCase'],
      },

      {
        // React Components can be in StrictPascalCase
        selector: 'parameter',
        modifiers: ['destructured'],
        types: ['function'],
        format: ['StrictPascalCase', 'strictCamelCase'],
      },

      {
        // React Components must be in StrictPascalCase
        selector: 'parameter',
        filter: {
          regex: 'Component$',
          match: true,
        },
        format: ['StrictPascalCase'],
      },

      {
        // React Components can be in StrictPascalCase
        selector: 'function',
        format: ['StrictPascalCase', 'strictCamelCase'],
      },

      {
        // Allow PascalCase for Actions and States
        selector: 'objectLiteralMethod',
        filter: {
          regex: '(Action|State)$',
          match: true,
        },
        format: ['PascalCase'],
      },

      {
        // Relax restrictions for keys like `en-US` and etc.
        selector: 'objectLiteralProperty',
        modifiers: ['requiresQuotes'],
        format: null,
      },

      {
        // Force generics into UPPER_CASE
        selector: 'typeParameter',
        format: ['UPPER_CASE'],
      },
    ],
    '@typescript-eslint/no-base-to-string': ERROR,
    '@typescript-eslint/no-confusing-non-null-assertion': ERROR,
    '@typescript-eslint/no-confusing-void-expression': [
      ERROR,
      {
        ignoreArrowShorthand: true,
        ignoreVoidOperator: true,
      },
    ],
    '@typescript-eslint/no-dynamic-delete': ERROR,
    '@typescript-eslint/no-extraneous-class': ERROR,
    '@typescript-eslint/no-implicit-any-catch': ERROR,
    '@typescript-eslint/no-invalid-void-type': ERROR,
    '@typescript-eslint/no-require-imports': ERROR,
    '@typescript-eslint/no-unnecessary-boolean-literal-compare': ERROR,
    // this rule seems to be buggy
    '@typescript-eslint/no-unnecessary-condition': OFF,
    '@typescript-eslint/no-unnecessary-qualifier': ERROR,
    '@typescript-eslint/no-unnecessary-type-arguments': ERROR,
    '@typescript-eslint/no-unnecessary-type-constraint': ERROR,
    '@typescript-eslint/non-nullable-type-assertion-style': ERROR,
    '@typescript-eslint/prefer-enum-initializers': ERROR,
    '@typescript-eslint/prefer-for-of': ERROR,
    '@typescript-eslint/prefer-function-type': ERROR,
    '@typescript-eslint/prefer-includes': ERROR,
    '@typescript-eslint/prefer-literal-enum-member': ERROR,
    '@typescript-eslint/prefer-nullish-coalescing': ERROR,
    '@typescript-eslint/prefer-optional-chain': ERROR,
    '@typescript-eslint/prefer-readonly': ERROR,
    '@typescript-eslint/prefer-readonly-parameter-types': [
      ERROR,
      {
        ignoreInferredTypes: true,
      },
    ],
    '@typescript-eslint/prefer-reduce-type-parameter': ERROR,
    '@typescript-eslint/prefer-string-starts-ends-with': ERROR,
    '@typescript-eslint/prefer-ts-expect-error': ERROR,
    '@typescript-eslint/promise-function-async': ERROR,
    '@typescript-eslint/require-array-sort-compare': [
      ERROR,
      {
        ignoreStringArrays: true,
      },
    ],
    '@typescript-eslint/strict-boolean-expressions': ERROR,
    '@typescript-eslint/switch-exhaustiveness-check': ERROR,
    //'@typescript-eslint/type-annotation-spacing': ERROR,
    '@typescript-eslint/unified-signatures': ERROR,
    'default-param-last': OFF,
    '@typescript-eslint/default-param-last': ERROR,
    'dot-notation': OFF,
    '@typescript-eslint/dot-notation': ERROR,
    'lines-between-class-members': OFF,
    '@typescript-eslint/lines-between-class-members': ERROR,
    'no-dupe-class-members': OFF,
    '@typescript-eslint/no-dupe-class-members': ERROR,
    'no-duplicate-imports': OFF,
    '@typescript-eslint/no-duplicate-imports': ERROR,
    'no-invalid-this': OFF,
    '@typescript-eslint/no-invalid-this': ERROR,
    'no-loss-of-precision': OFF,
    '@typescript-eslint/no-loss-of-precision': ERROR,
    'no-magic-numbers': OFF,
    '@typescript-eslint/no-magic-numbers': [
      ERROR,
      {
        ignore: [
          // don't know why these aren't ignored by default
          -1,
          0,
          1,
        ],
      },
    ],
    'no-redeclare': OFF,
    '@typescript-eslint/no-redeclare': ERROR,
    'no-throw-literal': OFF,
    '@typescript-eslint/no-throw-literal': ERROR,
    'no-unused-expressions': OFF,
    '@typescript-eslint/no-unused-expressions': ERROR,
    'no-useless-constructor': OFF,
    '@typescript-eslint/no-useless-constructor': ERROR,
    //'object-curly-spacing': OFF,
    //'@typescript-eslint/object-curly-spacing': ERROR,
    'no-return-await': OFF,
    '@typescript-eslint/return-await': ERROR,

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
    'react/jsx-no-useless-fragment': ERROR,
    'react/jsx-pascal-case': ERROR,
    //'react/jsx-props-no-multi-spaces': ERROR,
    'react/react-in-jsx-scope': OFF,

    'unicorn/empty-brace-spaces': OFF,
    'unicorn/custom-error-definition': ERROR,
    'unicorn/filename-case': OFF,
    'unicorn/import-style': OFF,
    'unicorn/no-array-callback-reference': OFF,
    'unicorn/no-array-for-each': OFF,
    'unicorn/no-array-push-push': OFF,
    'unicorn/no-array-reduce': OFF,
    'unicorn/no-console-spaces': OFF,
    'unicorn/no-useless-undefined': OFF,
    'no-lonely-if': OFF,
    'unicorn/no-lonely-if': ERROR,
    'no-array-constructor': OFF,
    'unicorn/no-new-array': ERROR,
    'unicorn/no-unreadable-array-destructuring': OFF,
    'unicorn/no-unsafe-regex': ERROR,
    'unicorn/numeric-separators-style': ERROR,
    'unicorn/prefer-array-flat-map': ERROR,
    'unicorn/prefer-query-selector': OFF,
    'unicorn/prefer-string-replace-all': ERROR,
    'unicorn/prevent-abbreviations': [
      ERROR,
      {
        replacements: {
          props: {
            // `props` are used by React
            properties: false,
          },
          ref: {
            // `ref` is used by React
            reference: false,
          },
        },
      },
    ],
    '@typescript-eslint/no-unused-vars': [
      'error',
      {
        argsIgnorePattern: '^_', // Allow vars that begin with _
      },
    ],
  },
  settings: {
    react: {
      version: 'detect',
    },
    'import/core-modules': ['styled-jsx/css'],
  },
};
