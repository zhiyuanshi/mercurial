module Mercurial
  module Parsers
    def parse_log(log)
      log.split("\n\n")
    end

    def parse_commit(commit)
      commit.split("\n").reduce({}) do |acc, line|
        field, value = line.split(":", 2)
        acc[field.to_sym] = value.strip
        acc
      end
    end
  end
end
