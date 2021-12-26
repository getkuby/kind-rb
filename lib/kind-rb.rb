module KindRb
  def self.executable
    @executable ||= begin
      pattern = File.expand_path(File.join('..', 'vendor', 'kind*'), __dir__)
      Dir.glob(pattern).first
    end
  end
end
