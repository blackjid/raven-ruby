# frozen_string_literal: true
require 'logger'

module Raven
  class Logger < ::Logger
    LOG_PREFIX = "** [Raven] ".freeze
    PROGNAME   = "sentry".freeze

    def initialize(*)
      super
      original_formatter = ::Logger::Formatter.new
      @default_formatter = proc do |severity, datetime, _progname, msg|
        msg = "#{LOG_PREFIX}#{msg}"
        original_formatter.call(severity, datetime, PROGNAME, msg)
      end
    end
  end
end
