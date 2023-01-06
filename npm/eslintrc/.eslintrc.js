'use strict';

const restrictedGlobals = require('confusing-browser-globals');

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
  plugins: [
    '@typescript-eslint/eslint-plugin',
    'markdown',
    'promise',
    'sonarjs',
    'simple-import-sort',
    'regexp',
    'jsx-a11y',
    'tsdoc',
    'write-good-comments',
    'functional',
    'optimize-regex',
    'jest',
  ],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'plugin:@typescript-eslint/strict',
    'plugin:unicorn/recommended',
    'plugin:array-func/all',
    'plugin:eslint-comments/recommended',
    'plugin:regexp/recommended',
    'plugin:jsx-a11y/strict',
    'plugin:functional/external-recommended',
    'plugin:functional/recommended',
    'plugin:functional/no-object-orientation',
    'plugin:functional/no-statements',
    'plugin:functional/no-exceptions',
    'plugin:functional/currying',
    'plugin:functional/stylistic',
    'plugin:promise/recommended',
    'plugin:sonarjs/recommended',
    'plugin:markdown/recommended',
  ],
  overrides: [
    {
      // Enable the Markdown processor for all .md files.
      files: ['**/*.md'],
      processor: 'markdown/markdown',
    },
    {
      /*
       * Customize the configuration ESLint uses for ```js
       * fenced code blocks inside .md files.
       */
      files: ['**/*.{md}/*.{js,ts,tsx}'],
      rules: {
        'no-undef': OFF,
        'no-unused-expression': OFF,
        'no-unused-var': OFF,
        'no-console': OFF,
      },
    },
    {
      files: ['**/__tests__/**/*.[jt]s?(x)', '**/?(*.)+(spec|test).[tj]s?(x)'],
      plugins: ['jest', 'jest-dom'],
      extends: [
        'plugin:jest/recommended',
        'plugin:jest/style',
        'plugin:jest-dom/recommended'
      ],
      rules: {
        'jest/consistent-test-it': [
          ERROR,
          { fn: 'test', withinDescribe: 'test' },
        ],
        'jest/max-expects': WARN,
        'jest/max-nested-describe': ERROR,
        'jest/no-test-return-statement': ERROR,
        'jest/prefer-called-with': WARN,
        'jest/prefer-comparison-matcher': ERROR,
        'jest/prefer-equality-matcher': ERROR,
        'jest/prefer-expect-resolves': WARN,
        'jest/prefer-hooks-in-order': ERROR,
        'jest/prefer-hooks-on-top': ERROR,
        'jest/prefer-mock-promise-shorthand': WARN,
        'jest/prefer-spy-on': WARN,
        'jest/prefer-todo': ERROR,
        'jest/require-hook': WARN,
        'jest/require-to-throw-message': WARN,
        'jest/no-large-snapshots': [WARN, { maxSize: 50, inlineMaxSize: 25 }],
        /*
         * This rule needs to know Jest version.
         * Autodetection of Jest version does not always work, thus
         * this had to be disabled.
         * Additionally, this rule wasn't that useful, as the same
         * functionally is built in in most IDEs
         */
        'jest/no-deprecated-functions': OFF,
        /*
         * This rule highlights using a string variable as a test name
         * as an error (probably because it is not integrated
         * with TypeScript type checking)
         */
        'jest/valid-title': OFF,
      },
    },
  ],
  rules: {
    'no-non-null-assertion': OFF,
    'no-console': [ERROR, { allow: ['error', 'warn'] }],
    // This fires for anonymous functions when not wrapped in {}
    'no-promise-executor-return': OFF,
    'no-template-curly-in-string': ERROR,
    'no-unsafe-optional-chaining': ERROR,
    'no-useless-backreference': ERROR,
    'array-callback-return': ERROR,
    complexity: [WARN, { max: 10 }],
    'consistent-return': ERROR,
    'default-case': ERROR,
    'default-case-last': ERROR,
    'guard-for-in': ERROR,
    'no-restricted-syntax': [
      ERROR,
      'CatchClause',
      'Class',
      'ContinueStaement',
      'DoWhileStatementView',
      'ForStatement',
      'LabeledStatement',
      'SwitchCase',
      'SwitchStatement',
      'ForInStatement',
      'Tools.Generator',
      'TryStatement',
      'WithStatement',
    ],
    'no-alert': ERROR,
    'no-caller': ERROR,
    'no-constructor-return': ERROR,
    'no-eq-null': ERROR,
    'no-eval': ERROR,
    'no-extend-native': ERROR,
    'no-extra-bind': ERROR,
    'no-implicit-coercion': ERROR,
    'no-iterator': ERROR,
    'no-labels': ERROR,
    'no-lone-blocks': ERROR,
    'no-new': WARN,
    'no-new-func': ERROR,
    'no-new-wrappers': ERROR,
    'no-nonoctal-decimal-escape': ERROR,
    'no-octal-escape': ERROR,
    'no-param-reassign': ERROR,
    'no-proto': ERROR,
    'no-return-assign': ERROR,
    'no-script-url': ERROR,
    'no-self-compare': ERROR,
    'no-sequences': ERROR,
    'no-useless-call': ERROR,
    'no-useless-concat': ERROR,
    'no-useless-return': ERROR,
    'no-warning-comments': [
      ERROR,
      {
        /*
         * I use "FIXME" comment to indicate things that must be
         * fixed before committing. Thus, this ESLint rule helps
         * catch such usages by throwwing an error, and thus causing
         * the pre-commit hooks to fail.
         */
        terms: ['fixme'],
        location: 'anywhere',
      },
    ],
    'prefer-named-capture-group': ERROR,
    'prefer-promise-reject-errors': ERROR,
    'prefer-regex-literals': ERROR,
    yoda: ERROR,
    // This is handled by @typescript-eslint/naming-convention
    camelcase: OFF,
    'capitalized-comments': ERROR,
    'consistent-this': ERROR,
    'max-depth': [
      ERROR,
      {
        max: 6,
      },
    ],
    'max-lines': [
      WARN,
      {
        max: 300,
        skipBlankLines: true,
        skipComments: true,
      },
    ],
    'max-lines-per-function': [
      WARN,
      {
        max: 100,
        skipBlankLines: true,
        skipComments: true,
      },
    ],
    'max-nested-callbacks': ERROR,
    'max-params': WARN,
    'max-statements': [
      ERROR,
      {
        max: 20,
      },
    ],
    'max-statements-per-line': ERROR,
    'multiline-comment-style': ERROR,
    'new-cap': ERROR,
    'no-bitwise': ERROR,
    'no-continue': ERROR,
    'no-inline-comments': ERROR,
    // This makes code more explicit and catches potential bugs
    'no-extra-boolean-cast': OFF,
    'no-multi-assign': ERROR,
    'no-new-object': ERROR,
    'no-plusplus': ERROR,
    'no-unneeded-ternary': ERROR,
    'one-var': [ERROR, 'never'],
    'prefer-exponentiation-operator': ERROR,
    'prefer-object-spread': ERROR,
    'spaced-comment': ERROR,
    'no-useless-computed-key': ERROR,
    'no-useless-rename': ERROR,
    'no-var': ERROR,
    'object-shorthand': ERROR,
    'prefer-const': ERROR,
    'prefer-numeric-literals': ERROR,
    'prefer-rest-params': ERROR,
    'prefer-spread': ERROR,
    'prefer-template': ERROR,
    'symbol-description': ERROR,
    'no-await-in-loop': ERROR,
    'no-constant-binary-expression': ERROR,
    'no-unreachable-loop': ERROR,
    'no-unused-private-class-members': ERROR,
    'require-atomic-updates': ERROR,
    'accessor-pairs': ERROR,
    'arrow-body-style': ERROR,
    'class-methods-use-this': ERROR,
    eqeqeq: ERROR,
    'func-name-matching': ERROR,
    'func-style': [ERROR, 'declaration', { allowArrowFunctions: true }],
    'grouped-accessor-pairs': ERROR,
    'max-depth': [WARN, { max: 6 }],
    'max-nested-callbacks': WARN,
    // Pretiter forces lambdas to have () around argument list
    'no-confusing-arrow': OFF,
    'no-floating-decimal': ERROR,
    'no-lone-blocks': ERROR,
    'no-mixed-operators': ERROR,
    'no-multi-str': ERROR,
    'no-nested-ternary': WARN,
    /*
     * Prevent accidental usages of global when forgot to declare a
     * variable
     */
    'no-restricted-globals': [
      ERROR,
      ...new Set([
        ...restrictedGlobals,
        'event',
        'name',
        'closed',
        'i',
        'index',
        'length',
        'parent',
        'self',
        'status',
        'stop',
        'toolbar',
        'top',
        'Infinity',
        'NaN',
        'isNaN',
        'isFinite',
        'parseFloat',
        'parseInt',
        'keys',
      ]),
    ],
    'no-void': [ERROR, { allowAsStatement: true }],
    'prefer-arrow-callback': [ERROR, { allowNamedFunctions: true }],
    'prefer-object-has-own': ERROR,
    radix: [ERROR, 'as-needed'],
    'require-unicode-regexp': ERROR,
    'new-parens': ERROR,
    'logical-assignment-operators': [ERROR, {
      "enforceForIfStatements": true,
    }],
    'no-new-native-nonconstructor': ERROR,

    // This rule crashes for me. TODO: reEnable in the future
    '@typescript-eslint/no-unsafe-return': OFF,
    // Lots of false positives
    '@typescript-eslint/no-base-to-string': OFF,
    '@typescript-eslint/ban-ts-comment': WARN,
    '@typescript-eslint/explicit-module-boundary-types': [
      ERROR,
      {
        allowArgumentsExplicitlyTypedAsAny: true,
        allowDirectConstAssertionInArrowFunctions: true,
      },
    ],
    '@typescript-eslint/array-type': ERROR,
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
    '@typescript-eslint/consistent-type-definitions': ['ERROR', 'type'],
    '@typescript-eslint/consistent-type-imports': ERROR,
    '@typescript-eslint/explicit-function-return-type': [
      ERROR,
      {
        allowTypedFunctionExpressions: true,
        allowHigherOrderFunctions: true,
        allowDirectConstAssertionInArrowFunctions: true,
        allowConciseArrowFunctionExpressionsStartingWithVoid: true,
      },
    ],
    '@typescript-eslint/explicit-member-accessibility': ERROR,
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
        // React Contexts, Context Providers and Backbone Views can be in
        // StrictPascalCase
        selector: 'variable',
        modifiers: ['const'],
        filter: {
          regex: '(Context|Provider|View)$',
          match: true,
        },
        format: ['StrictPascalCase', 'strictCamelCase'],
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
        // Allow StrictPascalCase for Actions and States
        selector: 'objectLiteralMethod',
        filter: {
          regex: '(Action|State)$',
          match: true,
        },
        format: ['StrictPascalCase'],
      },

      {
        // Allow StrictPascalCase for Actions and States
        selector: 'objectLiteralProperty',
        filter: {
          regex: '(Action|State)$',
          match: true,
        },
        types: ['function'],
        format: ['StrictPascalCase'],
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

      {
        // Enum members should be in upper case
        selector: 'enumMember',
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
      WARN,
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
          -1, 0, 1, 2,
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
    'no-return-await': OFF,
    '@typescript-eslint/return-await': ERROR,
    'no-unused-vars': OFF,
    '@typescript-eslint/no-unused-vars': [
      ERROR,
      {
        // Allow args and vars that begin with _
        argsIgnorePattern: '^_',
        varsIgnorePattern: '^_',
      },
    ],
    '@typescript-eslint/consistent-type-exports': [
      ERROR,
      {
        fixMixedExportsWithInlineTypeSpecifier: true,
      },
    ],
    '@typescript-eslint/member-ordering': ERROR,
    '@typescript-eslint/no-redundant-type-constituents': ERROR,
    '@typescript-eslint/no-useless-empty-export': ERROR,
    '@typescript-eslint/sort-type-union-intersection-members': ERROR,
    'no-array-constructor': OFF,
    '@typescript-eslint/no-array-constructor': ERROR,
    'no-empty-function': OFF,
    '@typescript-eslint/no-empty-function': [
      ERROR,
      {
        allow: ['arrowFunctions'],
      },
    ],
    'no-implied-eval': OFF,
    '@typescript-eslint/no-implied-eval': ERROR,
    'require-await': OFF,
    /*
     * If passing function as a prop, and the function is expected to
     * return a promise, making function async is cleaner than
     * returning Promise.resolve()
     */
    '@typescript-eslint/require-await': ERROR,
    /*
_    * While overusing non-null assertions can be harmful, there are
     * cases when it is the best solution.
     * For example, if you have a function that may return undefined,
     * but you are absolutely sure that it won't return undefined in
     * this context, the non-null assertion is helpful.
     * An alternative is to create a `defined()` helper function that
     * would throw a runtime error if value turns out to be undefined.
     * While that aligns the runtime and compile type behaviours, it
     * would mask the error message.
     * For example, if for some reason the value would turn out to
     * be undefined, `defined` helper might throw an error like
     * `Value is not defined` in a case like this:
     * `defined(maybeStyle).color.
     * However, if we don't catch this error, the browser is going to
     * catch it and report it as `Can't read property "color" of
     * undefined", which is a more helpful error message.
     *
     * This rule recommends to use `?.` instead, but that is a bad idea
     * in some cases. I am only going to use `!.` if I am absolutely
     * sure that the value would be defined. If it turns out to be
     * undefined, then my assumption was incorrect and I want to find
     * that out as soon as possible. Where as `?.` would hide this
     * from me and prevent me from finding out that my assumption is
     * incorrect.
     */
    '@typescript-eslint/no-non-null-assertion': OFF,

    // This rule is a subset of unicorn/new-for-builtins
    'unicorn/throw-new-error': OFF,
    // eslint-plugin-regexp is superior to this rule
    'unicorn/better-regex': OFF,
    // Conflicts with array-func/prefer-array-from
    'unicorn/prefer-spread': OFF,
    /*
     * Switch statements are confusing and it is easy to forget
     * to break;
     * Prefer object literal
     */
    'unicorn/prefer-switch': OFF,
    // This conflicts with prettier
    'unicorn/empty-brace-spaces': OFF,
    'unicorn/custom-error-definition': ERROR,
    'unicorn/filename-case': OFF,
    /*
     * This rule fires anytime you create a global promise, even
     * if you are not awaiting it
     */
    'unicorn/prefer-top-level-await': OFF,
    'unicorn/import-style': OFF,
    // This goes against functional programming
    'unicorn/no-array-callback-reference': OFF,
    // This goes against functional programming
    'unicorn/no-array-for-each': OFF,
    // This goes against functional programming
    'unicorn/no-array-reduce': OFF,
    // A useless rule
    'unicorn/no-console-spaces': OFF,
    // Conflicts with consistent-return
    'unicorn/no-useless-undefined': OFF,
    // Lonely if has different behavior than else if
    'no-lonely-if': OFF,
    'unicorn/no-lonely-if': ERROR,
    'no-negated-condition': OFF,
    'unicorn/no-negated-condition': ERROR,
    'unicorn/no-new-array': ERROR,
    'unicorn/no-unsafe-regex': ERROR,
    'unicorn/numeric-separators-style': ERROR,
    'unicorn/prefer-array-flat-map': ERROR,
    // Query selector has worse performance and is less explicit
    'unicorn/prefer-query-selector': OFF,
    'unicorn/prefer-string-replace-all': ERROR,
    // While using "undefined" is prefered, React relies on null values
    'unicorn/no-null': OFF,
    'unicorn/prevent-abbreviations': [
      OFF,
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
          i: {
            // in for loops, i is more commonly used then index
            index: false,
          },
          args: {
            // `arguments` is a reserved variable name
            arguments: false,
          },
        },
        /*
         * Renaming imports is a bad idea, is bug prone and causes
         * confusion (when the same function is called differently
         * in different files)
         *
         * Instead, the function should be renamed in the place where
         * it was defined
         */
        checkShorthandImports: false,
        checkShorthandProperties: false,
      },
    ],
    /*
     * While this improves readability, it makes it way harder to
     * find all usages of the attribute as \.dataset translates all
     * attribute names to camelCase
     */
    'unicorn/prefer-dom-node-dataset': OFF,
    'unicorn/prefer-at': ERROR,
    'unicorn/prefer-json-parse-buffer': ERROR,
    'unicorn/require-post-message-target-origin': ERROR,
    'unicorn/prefer-array-find': [ERROR, {
      checkFromLast: true,
    }],

    'eslint-comments/no-unused-disable': ERROR,

    'tsdoc/syntax': ERROR,

    'simple-import-sort/imports': ERROR,
    'simple-import-sort/exports': ERROR,

    'sonarjs/no-duplicate-string': WARN,
    'sonarjs/no-inverted-boolean-check': ERROR,
    'sonarjs/no-nested-template-literals': WARN,

    'regexp/no-dupe-disjunctions': ERROR,
    'regexp/no-empty-alternative': ERROR,
    'regexp/no-lazy-ends': ERROR,
    'regexp/no-optional-assertion': ERROR,
    'regexp/no-potentially-useless-backreference': ERROR,
    'regexp/no-useless-assertions': ERROR,
    'regexp/no-useless-dollar-replacements': ERROR,
    'regexp/confusing-quantifier': ERROR,
    'regexp/control-character-escape': ERROR,
    'regexp/negation': ERROR,
    'regexp/no-legacy-features': ERROR,
    'regexp/no-non-standard-flag': ERROR,
    'regexp/no-obscure-range': ERROR,
    'regexp/no-standalone-backslash': ERROR,
    'regexp/no-trivially-nested-assertion': ERROR,
    'regexp/no-trivially-nested-quantifier': ERROR,
    'regexp/no-unused-capturing-group': ERROR,
    'regexp/no-useless-flag': ERROR,
    'regexp/no-useless-lazy': ERROR,
    'regexp/no-useless-non-greedy': ERROR,
    'regexp/no-useless-quantifier': ERROR,
    'regexp/no-useless-range': ERROR,
    'regexp/no-zero-quantifier': ERROR,
    'regexp/optimal-lookaround-quantifier': ERROR,
    'regexp/prefer-escape-replacement-dollar-char': ERROR,
    'regexp/prefer-predefined-assertion': ERROR,
    'regexp/prefer-quantifier': ERROR,
    'regexp/prefer-range': ERROR,
    'regexp/prefer-regexp-exec': ERROR,
    'regexp/prefer-regexp-test': ERROR,
    'regexp/hexadecimal-escape': ERROR,
    'regexp/letter-case': ERROR,
    'regexp/no-useless-escape': ERROR,
    'regexp/no-useless-non-capturing-group': ERROR,
    'regexp/order-in-character-class': ERROR,
    'regexp/prefer-character-class': ERROR,
    'regexp/prefer-named-backreference': ERROR,
    'regexp/prefer-unicode-codepoint-escapes': ERROR,
    'regexp/sort-flags': ERROR,
    'regexp/unicode-escape': ERROR,
    'regexp/no-missing-g-flag': ERROR,
    'regexp/no-extra-lookaround-assertions': ERROR,

    // Deprecated rule
    'jsx-a11y/no-onchange': OFF,
    'jsx-a11y/no-noninteractive-element-to-interactive-role': ERROR,

    'write-good-comments/write-good-comments': WARN,

    // I have an ESLint rule that enforces "readonly" types everywhere
    'functional/immutable-data': OFF,
    /*
     * I have an ESLint that detects usages of "let" that are not
     * reassigned
     */
    'functional/no-let': OFF,
    // There are many use cases for this
    'functional/no-mixed-type': OFF,
    // This is not always possible due to readability concerns
    'functional/no-conditional-statement': OFF,
    // This is less useful when working with reaDOnly types
    'functional/no-expression-statement': OFF,
    // Callbacks need to return void
    'functional/no-return-void': OFF,
    // Promise reject can be handled in a generic way (.catch(error))
    'functional/no-promise-reject': OFF,
    // Partially covered by other rules
    'functional/functional-parameters': OFF,
    'functional/prefer-tacit': [ERROR, { assumeTypes: { allowFixer: false } }],

    'optimize-regex/optimize-regex': ERROR,
  },
};

