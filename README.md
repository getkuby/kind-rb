## kind-rb

The [Kind](https://kind.sigs.k8s.io/) Kubernetes testing tool distributed as a Rubygem.

## Intro

Kind is wrapped up as a Rubygem here to make it easy to distribute with Ruby apps, and was originally created for the [Kuby](https://github.com/getkuby/kuby-core) project.

## Usage

There is only one method that returns the absolute path to the kind executable:

```ruby
require 'kind-rb'

# /Users/me/.rbenv/versions/2.5.6/lib/ruby/gems/2.5.0/gems/kind-rb-0.1.0-x86_64-darwin/vendor/kind
KindRb.executable
```

The version of kind can be obtained like so:

```ruby
require 'kind-rb/version'

# "1.18.3"
KindRb::KIND_VERSION
```

## License

Kubernetes and kind are licensed under the Apache 2 license. The LICENSE file contains a copy.

## Authors

* Cameron C. Dutro: http://github.com/camertron
