module Danger
  module CISource
    class TeamCity < CI
      def self.validates?(env)
        env.has_key? 'TEAMCITY_VERSION'
      end

      def supported_request_sources
        @supported_request_sources ||= [Danger::RequestSources::GitHub]
      end

      def initialize(env)
        self.repo_slug       = env['GITHUB_REPO_SLUG']
        self.pull_request_id = env['GITHUB_PULL_REQUEST_ID'].to_i
        self.repo_url        = env['GITHUB_REPO_URL']
      end
    end
  end
end
