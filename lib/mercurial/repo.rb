module Mercurial
  class Repo
    include Parsers

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def self.open(path)
      Repo.new(path)
    end

    def commits
      log = nil
      Dir.chdir(@path) do
        log = `hg log`
      end
      parse_log(log).map { |commit| parse_commit(commit) }
    end

    def update(changeset)
      Dir.chdir(@path) do
        `hg update #{changeset}`
      end
    end
  end
end
