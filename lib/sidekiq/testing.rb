require 'sidekiq/testing'

module Sidekiq
  module Superworker
    class WorkerClass
      class << self

        def drain
          records = DSLHash.new(@nested_hash, @args).to_records
          records.each do |id, record|
            Object.const_get(record[:subworker_class]).drain
            # Sidekiq::Superworker::Processor
          end
        end

      end
    end
  end
end
