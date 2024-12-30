# Welcome to Blog

## What's Blog?

A modest blogging tool.

## Getting Started

1. Start the web server:

    ```bash
    $ bin/dev
    ```

2. Scan for security vulnerabilities in Ruby dependencies

    ```bash
    $ bin/brakeman --no-pager
    ```

3. Scan for security vulnerabilities in JavaScript dependencies

    ```bash
    $ bin/importmap audit
    ```

4. Lint code for consistent style:

    ```bash
    $ bin/rubocop
    ```

5. Run tests:

    ```bash
    $ bin/rails db:test:prepare test test:system
    ```

## Managing Secrets

1. Edit credentials:

    ```bash
    $ VISUAL="code --wait" bin/rails credentials:edit
    ```

## Remote debugging

1. Connect to the debuggee:

    ```bash
    $ rdbg -A
    ```

## Tips

1. Load fixtures into the current environment's database:

    ```bash
    $ bin/rails db:fixtures:load 
    ```
