require 'bundler/setup'
require 'rspec/core/rake_task'
require 'fileutils'

DISTRIBUTIONS = [
  { rb_platform: 'x86_64-darwin', tuple: %w(darwin amd64) },
  # { rb_platform: 'arm64-darwin',  tuple: %w(darwin arm64) },
  # { rb_platform: 'x86_64-linux',  tuple: %w(linux amd64) },
  # { rb_platform: 'aarch64-linux', tuple: %w(linux arm64) },
  # { rb_platform: 'ppc64le-linux', tuple: %w(linux ppc64le) },
  # { rb_platform: 'x64-mswin64',   tuple: %w(windows amd64), ext: '.exe' }
]

task :build do
  require 'rubygems/package'
  require 'open-uri'
  require 'kind-rb/version'

  FileUtils.mkdir_p('pkg')

  DISTRIBUTIONS.each do |distro|
    FileUtils.rm_rf('vendor')
    FileUtils.mkdir('vendor')

    exe = "kind-#{distro[:tuple].join('-')}"
    url = "https://github.com/kubernetes-sigs/kind/releases/download/v#{KindRb::KIND_VERSION}/#{exe}"
    vendored_exe = File.join('vendor', "kind#{distro[:ext]}")
    File.write(vendored_exe, URI.open(url).read)

    # user rwx, group rx, world rx
    File.chmod(0755, vendored_exe)

    gemspec = eval(File.read('kind-rb.gemspec'))
    gemspec.platform = distro[:rb_platform]
    package = Gem::Package.build(gemspec)
    FileUtils.mv(package, 'pkg')
  end
end

task :publish do
  require 'kind-rb/version'

  Dir.glob(File.join('pkg', "kind-rb-#{KindRb::VERSION}-*.gem")).each do |pkg|
    puts "Publishing #{pkg}"
    system("gem push -k rubygems #{pkg}")
  end
end

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end
